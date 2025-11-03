import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_typography.dart';

/// Tema Material 3 personalizado para Pokédex
class AppTheme {
  AppTheme._();

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.backgroundColor,
      colorScheme: ColorScheme.light(
        primary: AppColors.primary,
        onPrimary: AppColors.white,
        secondary: AppColors.secondary,
        onSecondary: AppColors.black,
        surface: AppColors.surfaceColor,
        onSurface: AppColors.gray900,
        outline: AppColors.borderColor,
        error: AppColors.error,
        onError: AppColors.white,
      ),
      textTheme: TextTheme(
        displayLarge: AppTypography.displayLarge.copyWith(color: AppColors.gray900),
        headlineLarge: AppTypography.headlineLarge.copyWith(color: AppColors.gray900),
        headlineMedium: AppTypography.headlineMedium.copyWith(color: AppColors.gray900),
        headlineSmall: AppTypography.headlineSmall.copyWith(color: AppColors.gray900),
        titleLarge: AppTypography.titleLarge.copyWith(color: AppColors.gray900),
        titleMedium: AppTypography.titleMedium.copyWith(color: AppColors.gray700),
        titleSmall: AppTypography.titleSmall.copyWith(color: AppColors.gray700),
        bodyLarge: AppTypography.bodyLarge.copyWith(color: AppColors.gray900),
        bodyMedium: AppTypography.bodyMedium.copyWith(color: AppColors.gray700),
        bodySmall: AppTypography.bodySmall.copyWith(color: AppColors.gray600),
        labelLarge: AppTypography.labelLarge.copyWith(color: AppColors.gray900),
        labelMedium: AppTypography.labelMedium.copyWith(color: AppColors.gray700),
        labelSmall: AppTypography.labelSmall.copyWith(color: AppColors.gray600),
      ),
    );
  }
}
