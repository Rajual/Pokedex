import 'package:desing_system/molecules/app_type_tag/app_type_tag.dart';

/// Domain entity for favorites data
class FavoritesData {
  /// List of favorite Pokemon
  final List<FavoritePokemon> favorites;

  /// Total count of favorites
  int get count => favorites.length;

  /// Check if a Pokemon is in favorites
  bool contains(String pokemonId) {
    return favorites.any((favorite) => favorite.id == pokemonId);
  }

  const FavoritesData({
    required this.favorites,
  });

  /// Creates a copy of this FavoritesData with the given fields replaced
  FavoritesData copyWith({
    List<FavoritePokemon>? favorites,
  }) {
    return FavoritesData(
      favorites: favorites ?? this.favorites,
    );
  }

  /// Creates an empty FavoritesData
  factory FavoritesData.empty() {
    return const FavoritesData(favorites: []);
  }
}

/// Domain entity for a favorite Pokemon
class FavoritePokemon {
  /// Pokemon ID
  final String id;

  /// Pokemon name
  final String name;

  /// Pokemon number (e.g., "001", "025")
  final String number;

  /// Pokemon image URL
  final String imageUrl;

  /// Pokemon types
  final List<PokemonType> types;

  /// Date when Pokemon was added to favorites
  final DateTime addedAt;

  const FavoritePokemon({
    required this.id,
    required this.name,
    required this.number,
    required this.imageUrl,
    required this.types,
    required this.addedAt,
  });

  /// Creates a copy of this FavoritePokemon with the given fields replaced
  FavoritePokemon copyWith({
    String? id,
    String? name,
    String? number,
    String? imageUrl,
    List<PokemonType>? types,
    DateTime? addedAt,
  }) {
    return FavoritePokemon(
      id: id ?? this.id,
      name: name ?? this.name,
      number: number ?? this.number,
      imageUrl: imageUrl ?? this.imageUrl,
      types: types ?? this.types,
      addedAt: addedAt ?? this.addedAt,
    );
  }
}

