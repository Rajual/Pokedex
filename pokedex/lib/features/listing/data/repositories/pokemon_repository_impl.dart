import 'package:pokedex/core/common/result.dart';
import 'package:pokedex/core/data/gateways/pokemon_list_gateway.dart';
import 'package:pokedex/core/data/gateways/pokemon_detail_gateway.dart';
import 'package:pokedex/features/listing/domain/entities/pokemon_list_item.dart';
import 'package:pokedex/features/listing/domain/repositories/pokemon_repository.dart';

/// Implementation of PokemonRepository using PokeAPI gateways
class PokemonRepositoryImpl implements PokemonRepository {
  final PokemonListGateway _pokemonListGateway;
  final PokemonDetailGateway _pokemonDetailGateway;

  PokemonRepositoryImpl({
    required PokemonListGateway pokemonListGateway,
    required PokemonDetailGateway pokemonDetailGateway,
  })  : _pokemonListGateway = pokemonListGateway,
        _pokemonDetailGateway = pokemonDetailGateway;

  @override
  Future<Result<List<PokemonListItem>, String>> loadPokemonList(
    LoadPokemonListParams params,
  ) async {
    try {
      // Load basic Pokemon list
      final pokemonList = await _pokemonListGateway.getPokemonList(
        limit: params.limit,
        offset: params.offset,
      );

      // Convert to domain entities
      final pokemonItems = <PokemonListItem>[];

      for (final pokemon in pokemonList.results) {
        try {
          // Try to get detailed info for types
          final detail = await _pokemonDetailGateway.getPokemonDetail(pokemon.name);

          // Create item with detailed info
          final primaryType = detail.types.isNotEmpty ? detail.types[0].type.name : 'normal';
          final secondaryType = detail.types.length > 1 ? detail.types[1].type.name : null;

          final pokemonItem = PokemonListItem(
            id: detail.id,
            name: detail.name,
            imageUrl: detail.sprites.other?.officialArtwork?.frontDefault ??
                      detail.sprites.frontDefault ??
                      _getPokemonImageUrl(detail.id),
            primaryType: primaryType,
            secondaryType: secondaryType,
          );

          pokemonItems.add(pokemonItem);
        } catch (e) {
          // If detail fetch fails, create basic item
          final id = _extractIdFromUrl(pokemon.url);
          pokemonItems.add(PokemonListItem(
            id: id,
            name: pokemon.name,
            imageUrl: _getPokemonImageUrl(id),
            primaryType: 'normal',
          ));
        }
      }

      return Result.success(pokemonItems);
    } catch (e) {
      return Result.failure('Failed to load Pokemon list: ${e.toString()}');
    }
  }

  @override
  Future<Result<List<PokemonListItem>, String>> loadMorePokemon(
    LoadPokemonListParams params,
  ) async {
    // For now, same implementation as loadPokemonList
    // In a real app, this might have different caching/loading strategies
    return loadPokemonList(params);
  }

  /// Extract Pokemon ID from PokeAPI URL
  int _extractIdFromUrl(String url) {
    final uri = Uri.parse(url);
    final segments = uri.pathSegments;
    if (segments.length >= 2 && segments[segments.length - 2] == 'pokemon') {
      return int.tryParse(segments.last) ?? 0;
    }
    return 0;
  }

  /// Get Pokemon image URL from PokeAPI
  String _getPokemonImageUrl(int id) {
    return 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$id.png';
  }

  /// Get Pokemon image URL for local assets (fallback)
  String _getPokemonImageAsset(int id) {
    return 'assets/pokemon_$id.png';
  }
}