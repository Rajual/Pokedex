import 'package:flutter/material.dart';
import '../utils/stat_card_enums.dart';

/// UI Model para StatCard
///
/// Contiene toda la información necesaria para renderizar
/// un card de estadística.
class StatCardUiModel {
  /// Ícono de la estadística
  final IconData icon;

  /// Label/título de la estadística (ej: "PESO", "ALTURA")
  final String label;

  /// Valor de la estadística (ej: "6,9 kg", "0,7 m")
  final String value;

  /// Tamaño del card
  final StatCardSize size;

  /// Variante visual del card
  final StatCardVariant variant;

  /// Color personalizado (usado cuando variant = colored)
  final Color? color;

  /// Color del ícono (opcional, por defecto usa gray600)
  final Color? iconColor;

  /// Color del texto del label (opcional, por defecto usa gray600)
  final Color? labelColor;

  /// Color del texto del value (opcional, por defecto usa theme)
  final Color? valueColor;

  /// Si está habilitado para interacción
  final bool isEnabled;

  const StatCardUiModel({
    required this.icon,
    required this.label,
    required this.value,
    this.size = StatCardSize.medium,
    this.variant = StatCardVariant.defaultVariant,
    this.color,
    this.iconColor,
    this.labelColor,
    this.valueColor,
    this.isEnabled = true,
  });

  /// Crea una copia del modelo con valores actualizados
  StatCardUiModel copyWith({
    IconData? icon,
    String? label,
    String? value,
    StatCardSize? size,
    StatCardVariant? variant,
    Color? color,
    Color? iconColor,
    Color? labelColor,
    Color? valueColor,
    bool? isEnabled,
  }) {
    return StatCardUiModel(
      icon: icon ?? this.icon,
      label: label ?? this.label,
      value: value ?? this.value,
      size: size ?? this.size,
      variant: variant ?? this.variant,
      color: color ?? this.color,
      iconColor: iconColor ?? this.iconColor,
      labelColor: labelColor ?? this.labelColor,
      valueColor: valueColor ?? this.valueColor,
      isEnabled: isEnabled ?? this.isEnabled,
    );
  }
}
