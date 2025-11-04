import 'package:flutter/material.dart';
import '../../../molecules/app_type_tag/app_type_tag.dart';

/// UI Model para PokemonDetailTemplate
class PokemonDetailTemplateUiModel {
  /// Número del Pokémon (ej: "001", "025")
  final String number;

  /// Nombre del Pokémon
  final String name;

  /// URL de la imagen del Pokémon
  final String imageUrl;

  /// Lista de tipos del Pokémon
  final List<PokemonType> types;

  /// Descripción del Pokémon
  final String description;

  /// Peso en kg
  final String weight;

  /// Altura en metros
  final String height;

  /// Categoría (ej: "SEMILLA", "LLAMA")
  final String category;

  /// Habilidad principal
  final String ability;

  /// Porcentaje de género masculino (0-100)
  final double malePercentage;

  /// Porcentaje de género femenino (0-100)
  final double femalePercentage;

  /// Lista de debilidades (tipos)
  final List<PokemonType> weaknesses;

  /// Color predominante (para el header)
  final Color primaryColor;

  /// Estado de favorito
  final bool isFavorite;

  /// Callback al presionar favorito
  final VoidCallback? onFavoriteToggle;

  /// Callback al presionar back
  final VoidCallback? onBack;

  const PokemonDetailTemplateUiModel({
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
    this.onFavoriteToggle,
    this.onBack,
  });

  PokemonDetailTemplateUiModel copyWith({
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
    VoidCallback? onFavoriteToggle,
    VoidCallback? onBack,
  }) {
    return PokemonDetailTemplateUiModel(
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
      onFavoriteToggle: onFavoriteToggle ?? this.onFavoriteToggle,
      onBack: onBack ?? this.onBack,
    );
  }
}
