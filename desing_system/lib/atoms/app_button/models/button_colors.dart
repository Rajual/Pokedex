import 'package:flutter/material.dart';

/// Modelo que representa el esquema de colores de un botón
class ButtonColors {
  final Color background;
  final Color text;
  final Color disabledBg;
  final Color disabledText;
  final Color? border;

  const ButtonColors({
    required this.background,
    required this.text,
    required this.disabledBg,
    required this.disabledText,
    this.border,
  });

  /// Obtiene el color de fondo basado en el estado
  Color getBackgroundColor(bool isEnabled) {
    return isEnabled ? background : disabledBg;
  }

  /// Obtiene el color de texto basado en el estado
  Color getTextColor(bool isEnabled) {
    return isEnabled ? text : disabledText;
  }

  /// Obtiene el color del borde, por defecto el text color
  Color getBorderColor(bool isEnabled) {
    return border ?? (isEnabled ? text : disabledText);
  }
}
