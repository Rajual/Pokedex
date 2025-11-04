import 'package:desing_system/molecules/app_type_tag/app_type_tag.dart';
import 'package:flutter/material.dart';

/// Domain model for Pokemon entity
class Pokemon {
  final int id;
  final String name;
  final int height;
  final int weight;
  final List<PokemonType> types;
  final PokemonStats stats;
  final PokemonSprites sprites;
  final bool isFavorite;

  const Pokemon({
    required this.id,
    required this.name,
    required this.height,
    required this.weight,
    required this.types,
    required this.stats,
    required this.sprites,
    this.isFavorite = false,
  });

  /// Primary type (first type in the list)
  PokemonType get primaryType => types.isNotEmpty ? types.first : PokemonType.normal;

  /// Secondary type (second type if exists)
  PokemonType? get secondaryType => types.length > 1 ? types[1] : null;

  /// Background color based on primary type
  Color get backgroundColor => primaryType.backgroundColor;

  /// Official artwork URL
  String get imageUrl => sprites.officialArtwork ?? sprites.frontDefault ?? '';

  /// Formatted height in meters
  double get heightInMeters => height / 10.0;

  /// Formatted weight in kilograms
  double get weightInKilograms => weight / 10.0;

  /// Total base stats
  int get totalStats => stats.total;

  /// Copy with new values
  Pokemon copyWith({
    int? id,
    String? name,
    int? height,
    int? weight,
    List<PokemonType>? types,
    PokemonStats? stats,
    PokemonSprites? sprites,
    bool? isFavorite,
  }) {
    return Pokemon(
      id: id ?? this.id,
      name: name ?? this.name,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      types: types ?? this.types,
      stats: stats ?? this.stats,
      sprites: sprites ?? this.sprites,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Pokemon &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() {
    return 'Pokemon(id: $id, name: $name, types: $types, isFavorite: $isFavorite)';
  }
}

/// Domain model for Pokemon statistics
class PokemonStats {
  final int hp;
  final int attack;
  final int defense;
  final int specialAttack;
  final int specialDefense;
  final int speed;

  const PokemonStats({
    required this.hp,
    required this.attack,
    required this.defense,
    required this.specialAttack,
    required this.specialDefense,
    required this.speed,
  });

  /// Total of all base stats
  int get total => hp + attack + defense + specialAttack + specialDefense + speed;

  /// Returns stats as a map for easy access
  Map<String, int> get asMap => {
        'hp': hp,
        'attack': attack,
        'defense': defense,
        'special-attack': specialAttack,
        'special-defense': specialDefense,
        'speed': speed,
      };

  /// Get stat value by name
  int getStat(String statName) {
    return asMap[statName.toLowerCase()] ?? 0;
  }

  @override
  String toString() {
    return 'PokemonStats(hp: $hp, attack: $attack, defense: $defense, '
        'specialAttack: $specialAttack, specialDefense: $specialDefense, speed: $speed)';
  }
}

/// Domain model for Pokemon sprites
class PokemonSprites {
  final String? frontDefault;
  final String? officialArtwork;

  const PokemonSprites({
    this.frontDefault,
    this.officialArtwork,
  });

  /// Check if any sprite is available
  bool get hasSprites => frontDefault != null || officialArtwork != null;

  @override
  String toString() {
    return 'PokemonSprites(frontDefault: $frontDefault, officialArtwork: $officialArtwork)';
  }
}

/// Domain model for Pokemon list item (simplified version for lists)
class PokemonListItem {
  final int id;
  final String name;
  final String url;

  const PokemonListItem({
    required this.id,
    required this.name,
    required this.url,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PokemonListItem &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() {
    return 'PokemonListItem(id: $id, name: $name)';
  }
}

/// Domain model for Pokemon list response
class PokemonListResponse {
  final int count;
  final String? next;
  final String? previous;
  final List<PokemonListItem> results;

  const PokemonListResponse({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });

  /// Check if there are more pages
  bool get hasNext => next != null;
  bool get hasPrevious => previous != null;

  @override
  String toString() {
    return 'PokemonListResponse(count: $count, results: ${results.length})';
  }
}