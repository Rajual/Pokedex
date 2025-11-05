import 'package:desing_system/molecules/app_type_tag/app_type_tag.dart';
import 'package:flutter/material.dart';

/// Domain entity for Pokemon detail data
class PokemonDetailEntity {
  /// Pokemon number (e.g., "001")
  final String number;

  /// Pokemon name
  final String name;

  /// Pokemon image URL
  final String imageUrl;

  /// Pokemon types
  final List<PokemonType> types;

  /// Pokemon description
  final String description;

  /// Pokemon weight (e.g., "6,9 kg")
  final String weight;

  /// Pokemon height (e.g., "0,7 m")
  final String height;

  /// Pokemon category (e.g., "SEMILLA")
  final String category;

  /// Pokemon ability
  final String ability;

  /// Male gender percentage (0-100)
  final double malePercentage;

  /// Female gender percentage (0-100)
  final double femalePercentage;

  /// Pokemon weaknesses
  final List<PokemonType> weaknesses;

  /// Primary color for UI theming
  final Color primaryColor;

  /// Whether this Pokemon is marked as favorite
  final bool isFavorite;

  const PokemonDetailEntity({
    required this.number,
    required this.name,
    required this.imageUrl,
    required this.types,
    required this.description,
    required this.weight,
    required this.height,
    required this.category,
    required this.ability,
    required this.malePercentage,
    required this.femalePercentage,
    required this.weaknesses,
    required this.primaryColor,
    this.isFavorite = false,
  });

  /// Creates a copy of this PokemonDetailEntity with the given fields replaced
  PokemonDetailEntity copyWith({
    String? number,
    String? name,
    String? imageUrl,
    List<PokemonType>? types,
    String? description,
    String? weight,
    String? height,
    String? category,
    String? ability,
    double? malePercentage,
    double? femalePercentage,
    List<PokemonType>? weaknesses,
    Color? primaryColor,
    bool? isFavorite,
  }) {
    return PokemonDetailEntity(
      number: number ?? this.number,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      types: types ?? this.types,
      description: description ?? this.description,
      weight: weight ?? this.weight,
      height: height ?? this.height,
      category: category ?? this.category,
      ability: ability ?? this.ability,
      malePercentage: malePercentage ?? this.malePercentage,
      femalePercentage: femalePercentage ?? this.femalePercentage,
      weaknesses: weaknesses ?? this.weaknesses,
      primaryColor: primaryColor ?? this.primaryColor,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}



/// Extension to get color for each Pokemon type
extension PokemonTypeExtension on PokemonType {
  Color get color {
    return switch (this) {
      PokemonType.normal => const Color(0xFFA8A878),
      PokemonType.fire => const Color(0xFFF08030),
      PokemonType.water => const Color(0xFF6890F0),
      PokemonType.electric => const Color(0xFFF8D030),
      PokemonType.grass => const Color(0xFF78C850),
      PokemonType.ice => const Color(0xFF98D8D8),
      PokemonType.fighting => const Color(0xFFC03028),
      PokemonType.poison => const Color(0xFFA040A0),
      PokemonType.ground => const Color(0xFFE0C068),
      PokemonType.flying => const Color(0xFFA890F0),
      PokemonType.psychic => const Color(0xFFF85888),
      PokemonType.bug => const Color(0xFFA8B820),
      PokemonType.rock => const Color(0xFFB8A038),
      PokemonType.ghost => const Color(0xFF705898),
      PokemonType.dragon => const Color(0xFF7038F8),
      PokemonType.dark => const Color(0xFF705848),
      PokemonType.steel => const Color(0xFFB8B8D0),
      PokemonType.fairy => const Color(0xFFEE99AC),
    };
  }
}