import '../../../../core/common/result.dart';
import '../entities/pokemon_detail_entity.dart';
import '../repositories/pokemon_detail_repository.dart';

/// Use case for loading Pokemon detail data
class LoadPokemonDetailUseCase {
  final PokemonDetailRepository repository;

  const LoadPokemonDetailUseCase(this.repository);

  /// Executes the use case to load Pokemon detail data by ID
  ///
  /// Returns a [Result] containing either [PokemonDetailEntity] on success
  /// or [PokemonDetailFailure] on failure
  Future<Result<PokemonDetailEntity, PokemonDetailFailure>> call(String pokemonId) {
    return repository.loadPokemonDetail(pokemonId);
  }
}

/// Use case for toggling Pokemon favorite status
class TogglePokemonFavoriteUseCase {
  final PokemonDetailRepository repository;

  const TogglePokemonFavoriteUseCase(this.repository);

  /// Executes the use case to toggle favorite status for a Pokemon
  ///
  /// Returns a [Result] containing either [bool] (new favorite status) on success
  /// or [PokemonDetailFailure] on failure
  Future<Result<bool, PokemonDetailFailure>> call(String pokemonId) {
    return repository.toggleFavorite(pokemonId);
  }
}

/// Use case for checking if Pokemon is favorite
class IsPokemonFavoriteUseCase {
  final PokemonDetailRepository repository;

  const IsPokemonFavoriteUseCase(this.repository);

  /// Executes the use case to check if a Pokemon is marked as favorite
  ///
  /// Returns a [Result] containing either [bool] on success
  /// or [PokemonDetailFailure] on failure
  Future<Result<bool, PokemonDetailFailure>> call(String pokemonId) {
    return repository.isFavorite(pokemonId);
  }
}