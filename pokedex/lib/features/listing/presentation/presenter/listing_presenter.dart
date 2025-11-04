import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/common/result.dart';
import '../../../../core/data/gateways/pokemon_list_gateway.dart';
import '../../../../core/data/gateways/pokemon_detail_gateway.dart';
import '../../domain/entities/pokemon_list_item.dart';
import '../../domain/repositories/pokemon_repository.dart' as repo;
import '../../domain/usecases/load_pokemon_list_usecase.dart';
import '../../data/repositories/pokemon_repository_impl.dart';

/// State for the listing presenter
class ListingState {
  final bool isLoading;
  final List<PokemonListItem> pokemon;
  final String? error;

  const ListingState({
    this.isLoading = false,
    this.pokemon = const [],
    this.error,
  });

  ListingState copyWith({
    bool? isLoading,
    List<PokemonListItem>? pokemon,
    String? error,
  }) {
    return ListingState(
      isLoading: isLoading ?? this.isLoading,
      pokemon: pokemon ?? this.pokemon,
      error: error ?? this.error,
    );
  }
}

/// Presenter for listing feature using Riverpod
class ListingPresenter {
  final LoadPokemonListUseCase _loadPokemonListUseCase;

  ListingPresenter(this._loadPokemonListUseCase);

  Future<Result<List<PokemonListItem>, String>> loadData() async {
    return await _loadPokemonListUseCase.execute(
      repo.LoadPokemonListParams(limit: 20, offset: 0),
    );
  }
}

/// Provider for the listing presenter
final listingPresenterProvider = Provider<ListingPresenter>((ref) {
  // This would normally be injected, but for simplicity we'll create it here
  // In a real app, you'd use a dependency injection framework
  final repository = ref.watch(pokemonRepositoryProvider);
  final useCase = LoadPokemonListUseCase(repository);
  return ListingPresenter(useCase);
});

/// Provider for the pokemon repository
final pokemonRepositoryProvider = Provider<repo.PokemonRepository>((ref) {
  // Create the repository implementation with required gateways
  return PokemonRepositoryImpl(
    pokemonListGateway: PokemonListGateway(),
    pokemonDetailGateway: PokemonDetailGateway(),
  );
});