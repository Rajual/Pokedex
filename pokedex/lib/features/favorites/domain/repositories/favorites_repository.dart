import '../../../../core/common/result.dart';
import '../entities/favorites_entity.dart';

/// Repository interface for favorites data operations
abstract class FavoritesRepository {
  /// Loads all favorite Pokemon
  ///
  /// Returns a [Result] containing either [FavoritesData] on success
  /// or [FavoritesFailure] on failure
  Future<Result<FavoritesData, FavoritesFailure>> loadFavorites();

  /// Adds a Pokemon to favorites
  ///
  /// Returns a [Result] containing either [bool] (true on success) on success
  /// or [FavoritesFailure] on failure
  Future<Result<bool, FavoritesFailure>> addToFavorites(FavoritePokemon pokemon);

  /// Removes a Pokemon from favorites by ID
  ///
  /// Returns a [Result] containing either [bool] (true on success) on success
  /// or [FavoritesFailure] on failure
  Future<Result<bool, FavoritesFailure>> removeFromFavorites(String pokemonId);

  /// Checks if a Pokemon is in favorites
  ///
  /// Returns a [Result] containing either [bool] on success
  /// or [FavoritesFailure] on failure
  Future<Result<bool, FavoritesFailure>> isFavorite(String pokemonId);

  /// Toggles favorite status for a Pokemon
  ///
  /// Returns a [Result] containing either [bool] (new favorite status) on success
  /// or [FavoritesFailure] on failure
  Future<Result<bool, FavoritesFailure>> toggleFavorite(String pokemonId, FavoritePokemon? pokemon);
}

/// Failure types for favorites operations
abstract class FavoritesFailure {
  const FavoritesFailure();

  /// Creates a failure for when data cannot be loaded
  factory FavoritesFailure.loadError(String message) =>
      _LoadError(message);

  /// Creates a failure for when data cannot be saved
  factory FavoritesFailure.saveError(String message) =>
      _SaveError(message);

  /// Creates a failure for when a Pokemon is not found
  factory FavoritesFailure.notFound(String pokemonId) =>
      _NotFound(pokemonId);

  /// Creates a failure for when a Pokemon is already in favorites
  factory FavoritesFailure.alreadyExists(String pokemonId) =>
      _AlreadyExists(pokemonId);
}

class _LoadError extends FavoritesFailure {
  final String message;
  const _LoadError(this.message);

  @override
  String toString() => 'LoadError: $message';
}

class _SaveError extends FavoritesFailure {
  final String message;
  const _SaveError(this.message);

  @override
  String toString() => 'SaveError: $message';
}

class _NotFound extends FavoritesFailure {
  final String pokemonId;
  const _NotFound(this.pokemonId);

  @override
  String toString() => 'NotFound: Pokemon $pokemonId not found in favorites';
}

class _AlreadyExists extends FavoritesFailure {
  final String pokemonId;
  const _AlreadyExists(this.pokemonId);

  @override
  String toString() => 'AlreadyExists: Pokemon $pokemonId is already in favorites';
}