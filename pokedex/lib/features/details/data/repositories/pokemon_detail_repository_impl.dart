import 'dart:convert';
import 'package:desing_system/molecules/app_type_tag/app_type_tag.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import '../../../../core/common/result.dart';
import '../../../../core/data/gateways/pokemon_detail_gateway.dart';
import '../../domain/entities/pokemon_detail_entity.dart';
import '../../domain/repositories/pokemon_detail_repository.dart';

/// Implementation of PokemonDetailRepository using PokeAPI
class PokemonDetailRepositoryImpl implements PokemonDetailRepository {
  final PokemonDetailGateway _pokemonDetailGateway;
  final http.Client _httpClient;

  // In-memory storage for favorites (in real app, this would be persistent)
  final Set<String> _favorites = {};

  PokemonDetailRepositoryImpl({
    PokemonDetailGateway? pokemonDetailGateway,
    http.Client? httpClient,
  })  : _pokemonDetailGateway = pokemonDetailGateway ?? PokemonDetailGateway(),
        _httpClient = httpClient ?? http.Client();

  @override
  Future<Result<PokemonDetailEntity, PokemonDetailFailure>> loadPokemonDetail(String pokemonId) async {
    try {
      // Fetch Pokemon detail from PokeAPI
      final pokemonDto = await _pokemonDetailGateway.getPokemonDetail(pokemonId);

      // Fetch Pokemon species for description and additional info
      String description = 'A mysterious Pokémon.';
      String category = 'Unknown';
      double malePercentage = 50.0;
      double femalePercentage = 50.0;

      try {
        final speciesResponse = await _httpClient.get(
          Uri.parse('https://pokeapi.co/api/v2/pokemon-species/${pokemonDto.id}'),
        );

        if (speciesResponse.statusCode == 200) {
          final speciesData = json.decode(speciesResponse.body);

          // Get English description
          final flavorTextEntries = speciesData['flavor_text_entries'] as List<dynamic>?;
          if (flavorTextEntries != null) {
            final englishEntry = flavorTextEntries.firstWhere(
              (entry) => entry['language']['name'] == 'en',
              orElse: () => flavorTextEntries.isNotEmpty ? flavorTextEntries.first : null,
            );
            if (englishEntry != null) {
              description = (englishEntry['flavor_text'] as String)
                  .replaceAll('\n', ' ')
                  .replaceAll('\f', ' ')
                  .replaceAll('  ', ' ');
            }
          }

          // Get category (genus)
          final genera = speciesData['genera'] as List<dynamic>?;
          if (genera != null) {
            final englishGenus = genera.firstWhere(
              (genus) => genus['language']['name'] == 'en',
              orElse: () => genera.isNotEmpty ? genera.first : null,
            );
            if (englishGenus != null) {
              category = (englishGenus['genus'] as String).replaceAll(' Pokémon', '').toUpperCase();
            }
          }

          // Get gender ratio
          final genderRate = speciesData['gender_rate'] as int?;
          if (genderRate != null && genderRate >= 0) {
            // gender_rate -1 means genderless
            // otherwise, it's in eighths (0-8)
            // 0 = 100% male, 8 = 100% female
            femalePercentage = (genderRate / 8.0) * 100;
            malePercentage = 100 - femalePercentage;
          } else if (genderRate == -1) {
            // Genderless Pokémon
            malePercentage = 0;
            femalePercentage = 0;
          }
        }
      } catch (e) {
        // If species fetch fails, continue with defaults
        print('Failed to fetch species data: $e');
      }

      // Get types
      final types = pokemonDto.types.map((typeSlot) {
        return _stringToPokemonType(typeSlot.type.name);
      }).toList();

      // Get primary type for color
      final primaryType = types.isNotEmpty ? types.first : PokemonType.normal;
      final primaryColor = _getTypeColor(primaryType);

      // Get ability (first ability)
      String ability = 'Unknown';
      try {
        final abilitiesResponse = await _httpClient.get(
          Uri.parse('https://pokeapi.co/api/v2/pokemon/${pokemonDto.id}'),
        );
        if (abilitiesResponse.statusCode == 200) {
          final pokemonData = json.decode(abilitiesResponse.body);
          final abilities = pokemonData['abilities'] as List<dynamic>?;
          if (abilities != null && abilities.isNotEmpty) {
            final firstAbility = abilities.first['ability']['name'] as String;
            ability = _formatAbilityName(firstAbility);
          }
        }
      } catch (e) {
        print('Failed to fetch ability: $e');
      }

      // Get weaknesses based on type
      final weaknesses = _getWeaknessesForTypes(types);

      // Format weight and height
      final weight = '${(pokemonDto.weight / 10.0).toStringAsFixed(1)} kg';
      final height = '${(pokemonDto.height / 10.0).toStringAsFixed(1)} m';

      // Get image URL
      final imageUrl = pokemonDto.sprites.other?.officialArtwork?.frontDefault ??
          pokemonDto.sprites.frontDefault ??
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${pokemonDto.id}.png';

      // Create entity
      final entity = PokemonDetailEntity(
        number: pokemonDto.id.toString().padLeft(3, '0'),
        name: _formatPokemonName(pokemonDto.name),
        imageUrl: imageUrl,
        types: types,
        description: description,
        weight: weight,
        height: height,
        category: category,
        ability: ability,
        malePercentage: malePercentage,
        femalePercentage: femalePercentage,
        weaknesses: weaknesses,
        primaryColor: primaryColor,
        isFavorite: _favorites.contains(pokemonId),
      );

      return Result.success(entity);
    } catch (e) {
      print('Error loading Pokemon detail: $e');
      if (e.toString().contains('404')) {
        return Result.failure(PokemonDetailFailure.notFound(pokemonId));
      } else if (e is FormatException) {
        return Result.failure(PokemonDetailFailure.parsingError(e.message));
      } else {
        return Result.failure(PokemonDetailFailure.localizationError(e.toString()));
      }
    }
  }

  @override
  Future<Result<bool, PokemonDetailFailure>> toggleFavorite(String pokemonId) async {
    try {
      final isCurrentlyFavorite = _favorites.contains(pokemonId);
      if (isCurrentlyFavorite) {
        _favorites.remove(pokemonId);
      } else {
        _favorites.add(pokemonId);
      }
      return Result.success(!isCurrentlyFavorite);
    } catch (e) {
      return Result.failure(PokemonDetailFailure.favoriteError(e.toString()));
    }
  }

  @override
  Future<Result<bool, PokemonDetailFailure>> isFavorite(String pokemonId) async {
    try {
      return Result.success(_favorites.contains(pokemonId));
    } catch (e) {
      return Result.failure(PokemonDetailFailure.favoriteError(e.toString()));
    }
  }

  PokemonType _stringToPokemonType(String typeString) {
    return PokemonType.values.firstWhere(
      (type) => type.name == typeString,
      orElse: () => PokemonType.normal,
    );
  }

  String _formatPokemonName(String name) {
    return name.substring(0, 1).toUpperCase() + name.substring(1);
  }

  String _formatAbilityName(String ability) {
    return ability.split('-').map((word) {
      return word.substring(0, 1).toUpperCase() + word.substring(1);
    }).join(' ');
  }

  Color _getTypeColor(PokemonType type) {
    switch (type) {
      case PokemonType.fire:
        return const Color(0xFFF08030);
      case PokemonType.water:
        return const Color(0xFF6890F0);
      case PokemonType.grass:
        return const Color(0xFF78C850);
      case PokemonType.electric:
        return const Color(0xFFF8D030);
      case PokemonType.ice:
        return const Color(0xFF98D8D8);
      case PokemonType.fighting:
        return const Color(0xFFC03028);
      case PokemonType.poison:
        return const Color(0xFFA040A0);
      case PokemonType.ground:
        return const Color(0xFFE0C068);
      case PokemonType.flying:
        return const Color(0xFFA890F0);
      case PokemonType.psychic:
        return const Color(0xFFF85888);
      case PokemonType.bug:
        return const Color(0xFFA8B820);
      case PokemonType.rock:
        return const Color(0xFFB8A038);
      case PokemonType.ghost:
        return const Color(0xFF705898);
      case PokemonType.dragon:
        return const Color(0xFF7038F8);
      case PokemonType.dark:
        return const Color(0xFF705848);
      case PokemonType.steel:
        return const Color(0xFFB8B8D0);
      case PokemonType.fairy:
        return const Color(0xFFEE99AC);
      case PokemonType.normal:
        return const Color(0xFFA8A878);
    }
  }

  List<PokemonType> _getWeaknessesForTypes(List<PokemonType> types) {
    final Set<PokemonType> weaknesses = {};

    for (final type in types) {
      weaknesses.addAll(_getWeaknessesForType(type));
    }

    // Remove types that the Pokemon is
    weaknesses.removeWhere((weakness) => types.contains(weakness));

    return weaknesses.toList();
  }

  List<PokemonType> _getWeaknessesForType(PokemonType type) {
    switch (type) {
      case PokemonType.normal:
        return [PokemonType.fighting];
      case PokemonType.fire:
        return [PokemonType.water, PokemonType.ground, PokemonType.rock];
      case PokemonType.water:
        return [PokemonType.electric, PokemonType.grass];
      case PokemonType.grass:
        return [PokemonType.fire, PokemonType.ice, PokemonType.poison, PokemonType.flying, PokemonType.bug];
      case PokemonType.electric:
        return [PokemonType.ground];
      case PokemonType.ice:
        return [PokemonType.fire, PokemonType.fighting, PokemonType.rock, PokemonType.steel];
      case PokemonType.fighting:
        return [PokemonType.flying, PokemonType.psychic, PokemonType.fairy];
      case PokemonType.poison:
        return [PokemonType.ground, PokemonType.psychic];
      case PokemonType.ground:
        return [PokemonType.water, PokemonType.grass, PokemonType.ice];
      case PokemonType.flying:
        return [PokemonType.electric, PokemonType.ice, PokemonType.rock];
      case PokemonType.psychic:
        return [PokemonType.bug, PokemonType.ghost, PokemonType.dark];
      case PokemonType.bug:
        return [PokemonType.fire, PokemonType.flying, PokemonType.rock];
      case PokemonType.rock:
        return [PokemonType.water, PokemonType.grass, PokemonType.fighting, PokemonType.ground, PokemonType.steel];
      case PokemonType.ghost:
        return [PokemonType.ghost, PokemonType.dark];
      case PokemonType.dragon:
        return [PokemonType.ice, PokemonType.dragon, PokemonType.fairy];
      case PokemonType.dark:
        return [PokemonType.fighting, PokemonType.bug, PokemonType.fairy];
      case PokemonType.steel:
        return [PokemonType.fire, PokemonType.fighting, PokemonType.ground];
      case PokemonType.fairy:
        return [PokemonType.poison, PokemonType.steel];
    }
  }
}