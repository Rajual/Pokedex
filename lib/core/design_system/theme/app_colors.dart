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
}
