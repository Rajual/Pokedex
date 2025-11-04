import 'package:pokedex/core/common/result.dart';
import '../repositories/pokemon_repository.dart' as repo;
import '../entities/pokemon_list_item.dart';

/// Use case for loading Pokemon list
class LoadPokemonListUseCase {
  final repo.PokemonRepository _repository;

  LoadPokemonListUseCase(this._repository);

  /// Execute the use case to load Pokemon list
  Future<Result<List<PokemonListItem>, String>> execute(
    repo.LoadPokemonListParams params,
  ) async {
    try {
      return await _repository.loadPokemonList(params);
    } catch (e) {
      return Result.failure('Failed to load Pokemon list: ${e.toString()}');
    }
  }
}