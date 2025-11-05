import '../../../../core/common/result.dart';
import '../entities/favorites_entity.dart';
import '../repositories/favorites_repository.dart';

/// Use case for loading favorites
class LoadFavoritesUseCase {
  final FavoritesRepository repository;

  const LoadFavoritesUseCase(this.repository);

  /// Executes the use case to load favorites
  ///
  /// Returns a [Result] containing either [FavoritesData] on success
  /// or [FavoritesFailure] on failure
  Future<Result<FavoritesData, FavoritesFailure>> call() {
    return repository.loadFavorites();
  }
}

/// Use case for adding to favorites
class AddToFavoritesUseCase {
  final FavoritesRepository repository;

  const AddToFavoritesUseCase(this.repository);

  /// Executes the use case to add a Pokemon to favorites
  ///
  /// Returns a [Result] containing either [bool] (true on success) on success
  /// or [FavoritesFailure] on failure
  Future<Result<bool, FavoritesFailure>> call(FavoritePokemon pokemon) {
    return repository.addToFavorites(pokemon);
  }
}

/// Use case for removing from favorites
class RemoveFromFavoritesUseCase {
  final FavoritesRepository repository;

  const RemoveFromFavoritesUseCase(this.repository);

  /// Executes the use case to remove a Pokemon from favorites
  ///
  /// Returns a [Result] containing either [bool] (true on success) on success
  /// or [FavoritesFailure] on failure
  Future<Result<bool, FavoritesFailure>> call(String pokemonId) {
    return repository.removeFromFavorites(pokemonId);
  }
}

/// Use case for checking if Pokemon is favorite
class IsFavoriteUseCase {
  final FavoritesRepository repository;

  const IsFavoriteUseCase(this.repository);

  /// Executes the use case to check if a Pokemon is in favorites
  ///
  /// Returns a [Result] containing either [bool] on success
  /// or [FavoritesFailure] on failure
  Future<Result<bool, FavoritesFailure>> call(String pokemonId) {
    return repository.isFavorite(pokemonId);
  }
}

/// Use case for toggling favorite status
class ToggleFavoriteUseCase {
  final FavoritesRepository repository;

  const ToggleFavoriteUseCase(this.repository);

  /// Executes the use case to toggle favorite status
  ///
  /// Returns a [Result] containing either [bool] (new favorite status) on success
  /// or [FavoritesFailure] on failure
  Future<Result<bool, FavoritesFailure>> call(String pokemonId, FavoritePokemon? pokemon) {
    return repository.toggleFavorite(pokemonId, pokemon);
  }
}