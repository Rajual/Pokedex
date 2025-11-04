import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/common/result.dart';
import '../../domain/entities/pokemon_detail_entity.dart';
import '../../domain/repositories/pokemon_detail_repository.dart';
import '../../domain/usecases/load_pokemon_detail_usecase.dart';
import '../../data/repositories/pokemon_detail_repository_impl.dart';

/// State for the Pokemon detail presenter
class PokemonDetailState {
  final bool isLoading;
  final PokemonDetailEntity? pokemon;
  final String? error;
  final bool isFavoriteLoading;

  const PokemonDetailState({
    this.isLoading = false,
    this.pokemon,
    this.error,
    this.isFavoriteLoading = false,
  });

  PokemonDetailState copyWith({
    bool? isLoading,
    PokemonDetailEntity? pokemon,
    String? error,
    bool? isFavoriteLoading,
  }) {
    return PokemonDetailState(
      isLoading: isLoading ?? this.isLoading,
      pokemon: pokemon ?? this.pokemon,
      error: error ?? this.error,
      isFavoriteLoading: isFavoriteLoading ?? this.isFavoriteLoading,
    );
  }
}

/// Presenter for Pokemon detail feature using Riverpod
class PokemonDetailPresenter {
  final LoadPokemonDetailUseCase _loadPokemonDetailUseCase;
  final TogglePokemonFavoriteUseCase _togglePokemonFavoriteUseCase;
  final IsPokemonFavoriteUseCase _isPokemonFavoriteUseCase;

  PokemonDetailPresenter(
    this._loadPokemonDetailUseCase,
    this._togglePokemonFavoriteUseCase,
    this._isPokemonFavoriteUseCase,
  );

  /// Loads Pokemon detail data by ID
  Future<Result<PokemonDetailEntity, PokemonDetailFailure>> loadPokemonDetail(String pokemonId) async {
    return await _loadPokemonDetailUseCase(pokemonId);
  }

  /// Toggles favorite status for a Pokemon
  Future<Result<bool, PokemonDetailFailure>> toggleFavorite(String pokemonId) async {
    return await _togglePokemonFavoriteUseCase(pokemonId);
  }

  /// Checks if a Pokemon is marked as favorite
  Future<Result<bool, PokemonDetailFailure>> isFavorite(String pokemonId) async {
    return await _isPokemonFavoriteUseCase(pokemonId);
  }
}

/// Provider for the Pokemon detail presenter
final pokemonDetailPresenterProvider = Provider<PokemonDetailPresenter>((ref) {
  final repository = ref.watch(pokemonDetailRepositoryProvider);
  final loadPokemonDetailUseCase = LoadPokemonDetailUseCase(repository);
  final togglePokemonFavoriteUseCase = TogglePokemonFavoriteUseCase(repository);
  final isPokemonFavoriteUseCase = IsPokemonFavoriteUseCase(repository);
  return PokemonDetailPresenter(
    loadPokemonDetailUseCase,
    togglePokemonFavoriteUseCase,
    isPokemonFavoriteUseCase,
  );
});

/// Provider for the Pokemon detail repository
final pokemonDetailRepositoryProvider = Provider<PokemonDetailRepository>((ref) {
  return PokemonDetailRepositoryImpl();
});