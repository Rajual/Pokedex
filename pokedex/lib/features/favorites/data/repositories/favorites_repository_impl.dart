import 'dart:convert';
import 'package:desing_system/molecules/app_type_tag/app_type_tag.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/common/result.dart';
import '../../domain/entities/favorites_entity.dart';
import '../../domain/repositories/favorites_repository.dart';

/// Implementation of FavoritesRepository
class FavoritesRepositoryImpl implements FavoritesRepository {
  static const String _favoritesKey = 'favorite_pokemon';

  @override
  Future<Result<FavoritesData, FavoritesFailure>> loadFavorites() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final favoritesJson = prefs.getStringList(_favoritesKey) ?? [];

      final favorites = favoritesJson.map((json) {
        final data = jsonDecode(json) as Map<String, dynamic>;
        return FavoritePokemon(
          id: data['id'] as String,
          name: data['name'] as String,
          number: data['number'] as String,
          imageUrl: data['imageUrl'] as String,
          types: (data['types'] as List<dynamic>)
              .map((type) => PokemonType.values.firstWhere(
                    (e) => e.name == type,
                    orElse: () => PokemonType.normal,
                  ))
              .toList(),
          addedAt: DateTime.parse(data['addedAt'] as String),
        );
      }).toList();

      // Sort by added date (most recent first)
      favorites.sort((a, b) => b.addedAt.compareTo(a.addedAt));

      return Result.success(FavoritesData(favorites: favorites));
    } catch (e) {
      return Result.failure(FavoritesFailure.loadError(e.toString()));
    }
  }

  @override
  Future<Result<bool, FavoritesFailure>> addToFavorites(FavoritePokemon pokemon) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final favoritesJson = prefs.getStringList(_favoritesKey) ?? [];

      // Check if already exists
      final existingIndex = favoritesJson.indexWhere((json) {
        final data = jsonDecode(json) as Map<String, dynamic>;
        return data['id'] == pokemon.id;
      });

      if (existingIndex != -1) {
        return Result.failure(FavoritesFailure.alreadyExists(pokemon.id));
      }

      // Add new favorite
      final pokemonJson = jsonEncode({
        'id': pokemon.id,
        'name': pokemon.name,
        'number': pokemon.number,
        'imageUrl': pokemon.imageUrl,
        'types': pokemon.types.map((type) => type.name).toList(),
        'addedAt': pokemon.addedAt.toIso8601String(),
      });

      favoritesJson.add(pokemonJson);
      await prefs.setStringList(_favoritesKey, favoritesJson);

      return Result.success(true);
    } catch (e) {
      return Result.failure(FavoritesFailure.saveError(e.toString()));
    }
  }

  @override
  Future<Result<bool, FavoritesFailure>> removeFromFavorites(String pokemonId) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final favoritesJson = prefs.getStringList(_favoritesKey) ?? [];

      final updatedFavorites = favoritesJson.where((json) {
        final data = jsonDecode(json) as Map<String, dynamic>;
        return data['id'] != pokemonId;
      }).toList();

      if (updatedFavorites.length == favoritesJson.length) {
        return Result.failure(FavoritesFailure.notFound(pokemonId));
      }

      await prefs.setStringList(_favoritesKey, updatedFavorites);
      return Result.success(true);
    } catch (e) {
      return Result.failure(FavoritesFailure.saveError(e.toString()));
    }
  }

  @override
  Future<Result<bool, FavoritesFailure>> isFavorite(String pokemonId) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final favoritesJson = prefs.getStringList(_favoritesKey) ?? [];

      final isFavorite = favoritesJson.any((json) {
        final data = jsonDecode(json) as Map<String, dynamic>;
        return data['id'] == pokemonId;
      });

      return Result.success(isFavorite);
    } catch (e) {
      return Result.failure(FavoritesFailure.loadError(e.toString()));
    }
  }

  @override
  Future<Result<bool, FavoritesFailure>> toggleFavorite(String pokemonId, FavoritePokemon? pokemon) async {
    try {
      final isFavResult = await isFavorite(pokemonId);

      if (isFavResult.isFailure) {
        return isFavResult.match(onSuccess: (_) => throw StateError('Unexpected success'), onFailure: (f) => Result.failure(f));
      }

      final isCurrentlyFavorite = isFavResult.match(onSuccess: (s) => s, onFailure: (_) => throw StateError('Unexpected failure'));

      if (isCurrentlyFavorite) {
        // Remove from favorites
        final removeResult = await removeFromFavorites(pokemonId);
        return removeResult.match(onSuccess: (_) => Result.success(false), onFailure: (f) => Result.failure(f));
      } else {
        // Add to favorites (requires pokemon data)
        if (pokemon == null) {
          return Result.failure(FavoritesFailure.loadError('Pokemon data required to add to favorites'));
        }
        final addResult = await addToFavorites(pokemon);
        return addResult.match(onSuccess: (_) => Result.success(true), onFailure: (f) => Result.failure(f));
      }
    } catch (e) {
      return Result.failure(FavoritesFailure.saveError(e.toString()));
    }
  }
}