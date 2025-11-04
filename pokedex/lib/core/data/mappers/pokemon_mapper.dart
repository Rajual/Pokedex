import 'package:desing_system/molecules/app_type_tag/app_type_tag.dart';
import 'package:flutter/material.dart';
import '../models/pokemon_detail/pokemon_detail_dto.dart';

/// Mapper para convertir DTOs a modelos de dominio
class PokemonMapper {
  PokemonMapper._();

  /// Mapea un string del API a un PokemonType enum
  static PokemonType fromString(String typeName) {
    return switch (typeName.toLowerCase()) {
      'water' => PokemonType.water,
      'dragon' => PokemonType.dragon,
      'electric' => PokemonType.electric,
      'fairy' => PokemonType.fairy,
      'ghost' => PokemonType.ghost,
      'fire' => PokemonType.fire,
      'ice' => PokemonType.ice,
      'grass' => PokemonType.grass,
      'bug' => PokemonType.bug,
      'fighting' => PokemonType.fighting,
      'normal' => PokemonType.normal,
      'dark' => PokemonType.dark,
      'steel' => PokemonType.steel,
      'poison' => PokemonType.poison,
      'psychic' => PokemonType.psychic,
      'rock' => PokemonType.rock,
      'ground' => PokemonType.ground,
      'flying' => PokemonType.flying,
      _ => PokemonType.normal, // Fallback por defecto
    };
  }
}

/// Clase para representar las estadísticas de un Pokémon
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

  /// Total de estadísticas base
  int get total => hp + attack + defense + specialAttack + specialDefense + speed;
}

/// Extension para mapear PokemonDetailDto
extension PokemonDetailDtoMapper on PokemonDetailDto {
  /// Obtiene la URL de la imagen preferida
  String get imageUrl {
    return sprites.other?.officialArtwork?.frontDefault ??
        sprites.frontDefault ??
        '';
  }

  /// Mapea los tipos del Pokémon
  List<PokemonType> get pokemonTypes {
    return types
        .map((typeSlot) => PokemonMapper.fromString(typeSlot.type.name))
        .toList();
  }

  /// Mapea las estadísticas del Pokémon
  PokemonStats get pokemonStats {
    final statsMap = {for (var stat in stats) stat.stat.name: stat.baseStat};

    return PokemonStats(
      hp: statsMap['hp'] ?? 0,
      attack: statsMap['attack'] ?? 0,
      defense: statsMap['defense'] ?? 0,
      specialAttack: statsMap['special-attack'] ?? 0,
      specialDefense: statsMap['special-defense'] ?? 0,
      speed: statsMap['speed'] ?? 0,
    );
  }

  /// Obtiene el color de fondo basado en el tipo primario
  Color getBackgroundColor() {
    if (types.isEmpty) return Colors.grey;
    final primaryType = PokemonMapper.fromString(types.first.type.name);
    return primaryType.backgroundColor;
  }
}
