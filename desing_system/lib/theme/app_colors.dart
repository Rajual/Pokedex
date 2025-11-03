import 'package:flutter/material.dart';

/// Colores de la aplicación siguiendo la guía de diseño del Pokédex
class AppColors {
  AppColors._();

  // Colores Primarios - Pokémon Red
  static const Color primary = Color(0xFF0052CC); // Azul Pokémon (del figma)
  static const Color primaryLight = Color(0xFF3B82F6); // Azul más claro
  static const Color primaryDark = Color(0xFF003B99);

  // Colores Secundarios - Pokémon Yellow
  static const Color secondary = Color(0xFFFECC16);
  static const Color secondaryLight = Color(0xFFFFED4E);
  static const Color secondaryDark = Color(0xFFC4A500);

  // Colores Neutros
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color gray900 = Color(0xFF1F2937);
  static const Color gray800 = Color(0xFF374151);
  static const Color gray700 = Color(0xFF4B5563);
  static const Color gray600 = Color(0xFF6B7280);
  static const Color gray500 = Color(0xFF9CA3AF);
  static const Color gray400 = Color(0xFFD1D5DB);
  static const Color gray300 = Color(0xFFE5E7EB);
  static const Color gray200 = Color(0xFFF3F4F6);
  static const Color gray100 = Color(0xFFF9FAFB);

  // Colores de Estado
  static const Color success = Color(0xFF10B981);
  static const Color error = Color(0xFFEF4444);
  static const Color warning = Color(0xFFF59E0B);
  static const Color info = Color(0xFF3B82F6);

  // Colores para backgrounds
  static const Color backgroundColor = Color(0xFFF9FAFB);
  static const Color surfaceColor = white;
  static const Color surfaceVariant = Color(0xFFF3F4F6);

  // Colores para bordes
  static const Color borderColor = Color(0xFFE5E7EB);
  static const Color borderColorDark = Color(0xFFD1D5DB);

  // Colores para texto
  static const _TextColors text = _TextColors();
}

class _TextColors {
  const _TextColors();

  Color get primary => AppColors.gray900;
  Color get secondary => AppColors.gray600;
  Color get tertiary => AppColors.gray500;
  Color get error => AppColors.error;
  Color get success => AppColors.success;
  Color get warning => AppColors.warning;
}

/// Colores para cada tipo de Pokémon
class PokemonTypeColors {
  PokemonTypeColors._();

  // Agua / Water
  static const Color water = Color(0xFF4090F0);
  static const Color waterLight = Color(0xFF89C5FF);

  // Dragón / Dragon
  static const Color dragon = Color(0xFF007BC7);
  static const Color dragonLight = Color(0xFF5BA3E0);

  // Eléctrico / Electric
  static const Color electric = Color(0xFFFFC107);
  static const Color electricLight = Color(0xFFFFD966);

  // Hada / Fairy
  static const Color fairy = Color(0xFFEB3B9E);
  static const Color fairyLight = Color(0xFFF88BCC);

  // Fantasma / Ghost
  static const Color ghost = Color(0xFF704888);
  static const Color ghostLight = Color(0xFF9D7BA8);

  // Fuego / Fire
  static const Color fire = Color(0xFFF08030);
  static const Color fireLight = Color(0xFFFFA060);

  // Hielo / Ice
  static const Color ice = Color(0xFF98D8D8);
  static const Color iceLight = Color(0xFFB8E8E8);

  // Planta / Grass
  static const Color grass = Color(0xFF78C850);
  static const Color grassLight = Color(0xFFA8E86B);

  // Bicho / Bug
  static const Color bug = Color(0xFFA8B820);
  static const Color bugLight = Color(0xFFC8D850);

  // Lucha / Fighting
  static const Color fighting = Color(0xFFC03028);
  static const Color fightingLight = Color(0xFFE05050);

  // Lucha / Normal
  static const Color normal = Color(0xFFA8A878);
  static const Color normalLight = Color(0xFFC8B8A8);

  // Siniestro / Dark
  static const Color dark = Color(0xFF705848);
  static const Color darkLight = Color(0xFF8B7868);

  // Acero / Steel
  static const Color steel = Color(0xFFB8B8D0);
  static const Color steelLight = Color(0xFFD0D0E0);

  // Veneno / Poison
  static const Color poison = Color(0xFFA040A0);
  static const Color poisonLight = Color(0xFFC868C8);

  // Psíquico / Psychic
  static const Color psychic = Color(0xFFF85888);
  static const Color psychicLight = Color(0xFFFF88B8);

  // Roca / Rock
  static const Color rock = Color(0xFFB8A038);
  static const Color rockLight = Color(0xFFD8C860);

  // Tierra / Ground
  static const Color ground = Color(0xFFE0C068);
  static const Color groundLight = Color(0xFFE8D090);

  // Volador / Flying
  static const Color flying = Color(0xFFA890F0);
  static const Color flyingLight = Color(0xFFC8B8FF);
}
