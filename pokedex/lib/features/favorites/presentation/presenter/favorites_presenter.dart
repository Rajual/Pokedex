import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/common/result.dart';
import '../../domain/entities/favorites_entity.dart';
import '../../domain/repositories/favorites_repository.dart';
import '../../domain/usecases/load_favorites_usecase.dart';
import '../../data/repositories/favorites_repository_impl.dart';

/// State for the favorites presenter
class FavoritesState {
  final bool isLoading;
  final FavoritesData? favoritesData;
  final String? error;

  const FavoritesState({
    this.isLoading = false,
    this.favoritesData,
    this.error,
  });

  FavoritesState copyWith({
    bool? isLoading,
    FavoritesData? favoritesData,
    String? error,
  }) {
    return FavoritesState(
      isLoading: isLoading ?? this.isLoading,
      favoritesData: favoritesData ?? this.favoritesData,
      error: error ?? this.error,
    );
  }
}

/// Presenter for favorites feature using Riverpod
class FavoritesPresenter {
  final LoadFavoritesUseCase _loadFavoritesUseCase;

  FavoritesPresenter(this._loadFavoritesUseCase);

  /// Loads favorites data
  Future<Result<FavoritesData, FavoritesFailure>> loadFavorites() async {
    return await _loadFavoritesUseCase();
  }

  /// Removes a Pokemon from favorites
  Future<Result<bool, FavoritesFailure>> removeFromFavorites(String pokemonId) async {
    final repository = FavoritesRepositoryImpl();
    return await repository.removeFromFavorites(pokemonId);
  }

  /// Adds a Pokemon to favorites
  Future<Result<bool, FavoritesFailure>> addToFavorites(FavoritePokemon pokemon) async {
    final repository = FavoritesRepositoryImpl();
    return await repository.addToFavorites(pokemon);
  }
}

/// Provider for the favorites presenter
final favoritesPresenterProvider = Provider<FavoritesPresenter>((ref) {
  final repository = ref.watch(favoritesRepositoryProvider);
  final loadFavoritesUseCase = LoadFavoritesUseCase(repository);
  return FavoritesPresenter(loadFavoritesUseCase);
});

/// Provider for the favorites repository
final favoritesRepositoryProvider = Provider<FavoritesRepository>((ref) {
  return FavoritesRepositoryImpl();
});