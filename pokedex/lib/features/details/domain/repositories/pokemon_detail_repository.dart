import '../../../../core/common/result.dart';
import '../entities/pokemon_detail_entity.dart';

/// Repository interface for Pokemon detail data operations
abstract class PokemonDetailRepository {
  /// Loads Pokemon detail data by ID from localization files
  ///
  /// Returns a [Result] containing either [PokemonDetailEntity] on success
  /// or [PokemonDetailFailure] on failure
  Future<Result<PokemonDetailEntity, PokemonDetailFailure>> loadPokemonDetail(String pokemonId);

  /// Toggles favorite status for a Pokemon
  ///
  /// Returns a [Result] containing either [bool] (new favorite status) on success
  /// or [PokemonDetailFailure] on failure
  Future<Result<bool, PokemonDetailFailure>> toggleFavorite(String pokemonId);

  /// Checks if a Pokemon is marked as favorite
  ///
  /// Returns a [Result] containing either [bool] on success
  /// or [PokemonDetailFailure] on failure
  Future<Result<bool, PokemonDetailFailure>> isFavorite(String pokemonId);
}

/// Failure types for Pokemon detail operations
abstract class PokemonDetailFailure {
  const PokemonDetailFailure();

  /// Creates a failure for when Pokemon data cannot be loaded
  factory PokemonDetailFailure.notFound(String pokemonId) =>
      _PokemonNotFound(pokemonId);

  /// Creates a failure for when localization data cannot be loaded
  factory PokemonDetailFailure.localizationError(String message) =>
      _LocalizationError(message);

  /// Creates a failure for when JSON parsing fails
  factory PokemonDetailFailure.parsingError(String message) =>
      _ParsingError(message);

  /// Creates a failure for when required assets are missing
  factory PokemonDetailFailure.assetNotFound(String assetPath) =>
      _AssetNotFound(assetPath);

  /// Creates a failure for when favorite operation fails
  factory PokemonDetailFailure.favoriteError(String message) =>
      _FavoriteError(message);
}

class _PokemonNotFound extends PokemonDetailFailure {
  final String pokemonId;
  const _PokemonNotFound(this.pokemonId);

  @override
  String toString() => 'PokemonNotFound: $pokemonId';
}

class _LocalizationError extends PokemonDetailFailure {
  final String message;
  const _LocalizationError(this.message);

  @override
  String toString() => 'LocalizationError: $message';
}

class _ParsingError extends PokemonDetailFailure {
  final String message;
  const _ParsingError(this.message);

  @override
  String toString() => 'ParsingError: $message';
}

class _AssetNotFound extends PokemonDetailFailure {
  final String assetPath;
  const _AssetNotFound(this.assetPath);

  @override
  String toString() => 'AssetNotFound: $assetPath';
}

class _FavoriteError extends PokemonDetailFailure {
  final String message;
  const _FavoriteError(this.message);

  @override
  String toString() => 'FavoriteError: $message';
}