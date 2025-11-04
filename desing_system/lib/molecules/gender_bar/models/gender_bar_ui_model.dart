import 'package:flutter/material.dart';
import '../utils/gender_bar_enums.dart';

/// UI Model para GenderBar
///
/// Contiene la información de distribución de género.
/// Los porcentajes deben sumar 100.0 para una visualización correcta.
class GenderBarUiModel {
  /// Porcentaje masculino (0-100)
  final double malePercentage;

  /// Porcentaje femenino (0-100)
  final double femalePercentage;

  /// Variante visual del componente
  final GenderBarVariant variant;

  /// Tamaño del componente
  final GenderBarSize size;

  /// Mostrar iconos de género (solo para variant detailed)
  final bool showIcons;

  /// Mostrar etiquetas de porcentaje
  final bool showLabels;

  /// Título opcional de la sección
  final String? title;

  /// Color personalizado para género masculino
  final Color? maleColor;

  /// Color personalizado para género femenino
  final Color? femaleColor;

  const GenderBarUiModel({
    required this.malePercentage,
    required this.femalePercentage,
    this.variant = GenderBarVariant.detailed,
    this.size = GenderBarSize.medium,
    this.showIcons = true,
    this.showLabels = true,
    this.title,
    this.maleColor,
    this.femaleColor,
  }) : assert(
          malePercentage >= 0 && malePercentage <= 100,
          'malePercentage must be between 0 and 100',
        ),
        assert(
          femalePercentage >= 0 && femalePercentage <= 100,
          'femalePercentage must be between 0 and 100',
        );

  /// Verifica si los porcentajes suman 100
  bool get isValid => (malePercentage + femalePercentage).toStringAsFixed(1) == '100.0';

  /// Obtiene el porcentaje masculino como entero para flex
  int get maleFlexValue => (malePercentage * 100).toInt();

  /// Obtiene el porcentaje femenino como entero para flex
  int get femaleFlexValue => (femalePercentage * 100).toInt();

  /// Verifica si es 100% masculino
  bool get isMaleOnly => femalePercentage == 0;

  /// Verifica si es 100% femenino
  bool get isFemaleOnly => malePercentage == 0;

  /// Verifica si es sin género (ambos son 0)
  bool get isGenderless => malePercentage == 0 && femalePercentage == 0;

  /// Crea una copia del modelo con valores actualizados
  GenderBarUiModel copyWith({
    double? malePercentage,
    double? femalePercentage,
    GenderBarVariant? variant,
    GenderBarSize? size,
    bool? showIcons,
    bool? showLabels,
    String? title,
    Color? maleColor,
    Color? femaleColor,
  }) {
    return GenderBarUiModel(
      malePercentage: malePercentage ?? this.malePercentage,
      femalePercentage: femalePercentage ?? this.femalePercentage,
      variant: variant ?? this.variant,
      size: size ?? this.size,
      showIcons: showIcons ?? this.showIcons,
      showLabels: showLabels ?? this.showLabels,
      title: title ?? this.title,
      maleColor: maleColor ?? this.maleColor,
      femaleColor: femaleColor ?? this.femaleColor,
    );
  }
}
