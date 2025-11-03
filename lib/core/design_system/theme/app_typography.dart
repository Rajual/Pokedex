import 'package:flutter/material.dart';

/// Escala de tipografía consistente
class AppTypography {
  AppTypography._();

  // Display - Títulos grandes
  static const TextStyle displayLarge = TextStyle(
    fontSize: 57,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.25,
    height: 1.12,
  );

  // Headline - Encabezados
  static const TextStyle headlineLarge = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w700,
    letterSpacing: 0,
    height: 1.25,
  );

  static const TextStyle headlineMedium = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w700,
    letterSpacing: 0,
    height: 1.29,
  );

  static const TextStyle headlineSmall = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    letterSpacing: 0,
    height: 1.33,
  );

  // Title - Títulos
  static const TextStyle titleLarge = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w700,
    letterSpacing: 0,
    height: 1.27,
  );

  static const TextStyle titleMedium = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.15,
    height: 1.50,
  );

  static const TextStyle titleSmall = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.1,
    height: 1.43,
  );

  // Body - Cuerpo de texto
  static const TextStyle bodyLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.5,
    height: 1.50,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
    height: 1.43,
  );

  static const TextStyle bodySmall = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.4,
    height: 1.33,
  );

  // Label - Etiquetas
  static const TextStyle labelLarge = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
    height: 1.43,
  );

  static const TextStyle labelMedium = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.5,
    height: 1.33,
  );

  static const TextStyle labelSmall = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.5,
    height: 1.45,
  );
}

/// TextTheme simplificado con 3 estilos principales para usar con Flutter nativo
class AppTextTheme {
  AppTextTheme._();

  /// Tema de texto principal para la aplicación
  static TextTheme lightTextTheme = const TextTheme(
    displayLarge: AppTypography.displayLarge,
    displayMedium: AppTypography.headlineLarge,
    displaySmall: AppTypography.headlineMedium,
    headlineMedium: AppTypography.headlineSmall,
    headlineSmall: AppTypography.titleLarge,
    titleLarge: AppTypography.titleMedium,
    titleMedium: AppTypography.titleSmall,
    titleSmall: AppTypography.bodyLarge,
    bodyLarge: AppTypography.bodyMedium,
    bodyMedium: AppTypography.bodySmall,
    bodySmall: AppTypography.labelLarge,
    labelLarge: AppTypography.labelMedium,
    labelMedium: AppTypography.labelSmall,
    labelSmall: AppTypography.labelSmall,
  );

  /// TextTheme secundario para variaciones
  static TextTheme darkTextTheme = const TextTheme(
    displayLarge: AppTypography.displayLarge,
    displayMedium: AppTypography.headlineLarge,
    displaySmall: AppTypography.headlineMedium,
    headlineMedium: AppTypography.headlineSmall,
    headlineSmall: AppTypography.titleLarge,
    titleLarge: AppTypography.titleMedium,
    titleMedium: AppTypography.titleSmall,
    titleSmall: AppTypography.bodyLarge,
    bodyLarge: AppTypography.bodyMedium,
    bodyMedium: AppTypography.bodySmall,
    bodySmall: AppTypography.labelLarge,
    labelLarge: AppTypography.labelMedium,
    labelMedium: AppTypography.labelSmall,
    labelSmall: AppTypography.labelSmall,
  );

  /// TextTheme compacto para espacios reducidos
  static TextTheme compactTextTheme = const TextTheme(
    displayLarge: AppTypography.titleLarge,
    displayMedium: AppTypography.titleMedium,
    displaySmall: AppTypography.titleSmall,
    headlineMedium: AppTypography.bodyLarge,
    headlineSmall: AppTypography.bodyMedium,
    titleLarge: AppTypography.bodySmall,
    titleMedium: AppTypography.labelLarge,
    titleSmall: AppTypography.labelMedium,
    bodyLarge: AppTypography.labelSmall,
    bodyMedium: AppTypography.labelSmall,
    bodySmall: AppTypography.labelSmall,
    labelLarge: AppTypography.labelSmall,
    labelMedium: AppTypography.labelSmall,
    labelSmall: AppTypography.labelSmall,
  );
}
