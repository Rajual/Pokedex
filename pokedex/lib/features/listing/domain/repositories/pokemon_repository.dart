import 'package:pokedex/core/common/result.dart';
import 'package:pokedex/features/listing/domain/entities/pokemon_list_item.dart';

/// Parameters for loading Pokemon list
class LoadPokemonListParams {
  final int limit;
  final int offset;

  const LoadPokemonListParams({
    required this.limit,
    required this.offset,
  });
}

/// Repository interface for Pokemon data operations
abstract class PokemonRepository {
  /// Load a list of Pokemon with pagination
  Future<Result<List<PokemonListItem>, String>> loadPokemonList(
    LoadPokemonListParams params,
  );

  /// Load more Pokemon for infinite scroll
  Future<Result<List<PokemonListItem>, String>> loadMorePokemon(
    LoadPokemonListParams params,
  );
}