import 'dart:convert';
import 'package:desing_system/molecules/app_type_tag/app_type_tag.dart';
import 'package:flutter/services.dart';
import '../../../../core/common/result.dart';
import '../../../../core/data/models/pokemon_detail/pokemon_detail_dto.dart';
import '../../../favorites/domain/entities/favorites_entity.dart';
import '../../domain/entities/pokemon_detail_entity.dart';
import '../../domain/repositories/pokemon_detail_repository.dart';

/// Implementation of PokemonDetailRepository
class PokemonDetailRepositoryImpl implements PokemonDetailRepository {
  // Mock data for demonstration - in real app this would come from API
  static const Map<String, Map<String, dynamic>> _mockPokemonData = {
    '1': {
      'number': '001',
      'name': 'Bulbasaur',
      'imageUrl': 'assets/ilustration/PokemonBulbasaur.png',
      'types': ['grass', 'poison'],
      'description': 'A strange seed was planted on its back at birth. The plant sprouts and grows with this POKéMON.',
      'weight': '6,9 kg',
      'height': '0,7 m',
      'category': 'SEED',
      'ability': 'Overgrow',
      'malePercentage': 87.5,
      'femalePercentage': 12.5,
      'weaknesses': ['fire', 'psychic', 'flying', 'ice'],
      'primaryColor': 0xFF78C850, // Green
      'isFavorite': false,
    },
    '4': {
      'number': '004',
      'name': 'Charmander',
      'imageUrl': 'assets/ilustration/PokemonCharizard.png',
      'types': ['fire'],
      'description': 'Obviously prefers hot places. When it rains, steam is said to spout from the tip of its tail.',
      'weight': '8,5 kg',
      'height': '0,6 m',
      'category': 'LIZARD',
      'ability': 'Blaze',
      'malePercentage': 87.5,
      'femalePercentage': 12.5,
      'weaknesses': ['water', 'ground', 'rock'],
      'primaryColor': 0xFFF08030, // Orange
      'isFavorite': false,
    },
    '7': {
      'number': '007',
      'name': 'Squirtle',
      'imageUrl': 'assets/ilustration/PokemonBlastoise.png',
      'types': ['water'],
      'description': 'After birth, its back swells and hardens into a shell. Powerfully sprays foam from its mouth.',
      'weight': '9,0 kg',
      'height': '0,5 m',
      'category': 'TINY TURTLE',
      'ability': 'Torrent',
      'malePercentage': 87.5,
      'femalePercentage': 12.5,
      'weaknesses': ['electric', 'grass'],
      'primaryColor': 0xFF6890F0, // Blue
      'isFavorite': false,
    },
  };

  // In-memory storage for favorites (in real app, this would be persistent)
  final Set<String> _favorites = {};

  @override
  Future<Result<PokemonDetailEntity, PokemonDetailFailure>> loadPokemonDetail(String pokemonId) async {
    try {
      // Try to load from localization first (for description, etc.)
      final localeData = await _loadLocaleData();

      // Get Pokemon data (mock for now)
      final pokemonData = _mockPokemonData[pokemonId];
      if (pokemonData == null) {
        return Result.failure(PokemonDetailFailure.notFound(pokemonId));
      }

      // Create entity
      final entity = PokemonDetailEntity(
        number: pokemonData['number'],
        name: pokemonData['name'],
        imageUrl: pokemonData['imageUrl'],
        types: (pokemonData['types'] as List<dynamic>)
            .map((type) => _stringToPokemonType(type as String))
            .toList(),
        description: pokemonData['description'],
        weight: pokemonData['weight'],
        height: pokemonData['height'],
        category: pokemonData['category'],
        ability: pokemonData['ability'],
        malePercentage: pokemonData['malePercentage'],
        femalePercentage: pokemonData['femalePercentage'],
        weaknesses: (pokemonData['weaknesses'] as List<dynamic>)
            .map((weakness) => _stringToPokemonType(weakness as String))
            .toList(),
        primaryColor: Color(pokemonData['primaryColor']),
        isFavorite: _favorites.contains(pokemonId),
      );

      return Result.success(entity);
    } catch (e) {
      if (e is FormatException) {
        return Result.failure(PokemonDetailFailure.parsingError(e.message));
      } else if (e is PlatformException) {
        return Result.failure(PokemonDetailFailure.assetNotFound(e.message ?? 'Asset not found'));
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

  Future<Map<String, dynamic>> _loadLocaleData() async {
    // Get current locale (simplified - in real app you'd use localization service)
    const locale = 'en';

    final assetPath = 'assets/locals/$locale/details.json';
    try {
      final jsonString = await rootBundle.loadString(assetPath);
      return json.decode(jsonString) as Map<String, dynamic>;
    } catch (e) {
      // Return empty map if file doesn't exist
      return {};
    }
  }
}