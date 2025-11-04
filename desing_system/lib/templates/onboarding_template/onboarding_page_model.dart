import 'package:flutter/material.dart';

/// Modelo para una página de onboarding
class OnboardingPageModel {
  /// Ruta del asset de la imagen
  final String imagePath;

  /// Título de la página
  final String title;

  /// Descripción de la página
  final String description;

  /// Color de fondo opcional
  final Color? backgroundColor;

  /// Color del texto opcional
  final Color? textColor;

  const OnboardingPageModel({
    required this.imagePath,
    required this.title,
    required this.description,
    this.backgroundColor,
    this.textColor,
  });
}
