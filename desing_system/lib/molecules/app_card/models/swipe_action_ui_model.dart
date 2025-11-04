import 'package:flutter/material.dart';

/// Tipo de acción al deslizar
enum SwipeActionType {
  delete,
  archive,
  favorite,
  share,
  custom,
}

/// Modelo para configurar una acción de swipe
class SwipeActionUiModel {
  /// Tipo de acción
  final SwipeActionType type;

  /// Color de fondo cuando se desliza
  final Color backgroundColor;

  /// Icono de la acción
  final IconData icon;

  /// Color del icono
  final Color iconColor;

  /// Texto de la acción (opcional)
  final String? label;

  /// Callback cuando se completa la acción
  final VoidCallback? onAction;

  /// Distancia mínima de deslizamiento para activar (0.0 a 1.0)
  /// Por defecto 0.4 (40% del ancho de la card)
  final double threshold;

  const SwipeActionUiModel({
    required this.type,
    required this.backgroundColor,
    required this.icon,
    this.iconColor = Colors.white,
    this.label,
    this.onAction,
    this.threshold = 0.4,
  }) : assert(threshold >= 0.0 && threshold <= 1.0, 'threshold debe estar entre 0.0 y 1.0');

  /// Factory para crear una acción de eliminar
  factory SwipeActionUiModel.delete({
    Color? backgroundColor,
    Color? iconColor,
    String? label,
    VoidCallback? onAction,
    double threshold = 0.4,
  }) {
    return SwipeActionUiModel(
      type: SwipeActionType.delete,
      backgroundColor: backgroundColor ?? const Color(0xFFFF3D71),
      icon: Icons.delete_outline,
      iconColor: iconColor ?? Colors.white,
      label: label,
      onAction: onAction,
      threshold: threshold,
    );
  }

  /// Factory para crear una acción de archivar
  factory SwipeActionUiModel.archive({
    Color? backgroundColor,
    Color? iconColor,
    String? label,
    VoidCallback? onAction,
    double threshold = 0.4,
  }) {
    return SwipeActionUiModel(
      type: SwipeActionType.archive,
      backgroundColor: backgroundColor ?? const Color(0xFF6C757D),
      icon: Icons.archive_outlined,
      iconColor: iconColor ?? Colors.white,
      label: label,
      onAction: onAction,
      threshold: threshold,
    );
  }

  /// Factory para crear una acción de favorito
  factory SwipeActionUiModel.favorite({
    Color? backgroundColor,
    Color? iconColor,
    String? label,
    VoidCallback? onAction,
    double threshold = 0.4,
  }) {
    return SwipeActionUiModel(
      type: SwipeActionType.favorite,
      backgroundColor: backgroundColor ?? const Color(0xFFFFC107),
      icon: Icons.star_outline,
      iconColor: iconColor ?? Colors.white,
      label: label,
      onAction: onAction,
      threshold: threshold,
    );
  }

  /// Factory para crear una acción de compartir
  factory SwipeActionUiModel.share({
    Color? backgroundColor,
    Color? iconColor,
    String? label,
    VoidCallback? onAction,
    double threshold = 0.4,
  }) {
    return SwipeActionUiModel(
      type: SwipeActionType.share,
      backgroundColor: backgroundColor ?? const Color(0xFF2196F3),
      icon: Icons.share_outlined,
      iconColor: iconColor ?? Colors.white,
      label: label,
      onAction: onAction,
      threshold: threshold,
    );
  }

  /// Factory para crear una acción personalizada
  factory SwipeActionUiModel.custom({
    required Color backgroundColor,
    required IconData icon,
    Color iconColor = Colors.white,
    String? label,
    VoidCallback? onAction,
    double threshold = 0.4,
  }) {
    return SwipeActionUiModel(
      type: SwipeActionType.custom,
      backgroundColor: backgroundColor,
      icon: icon,
      iconColor: iconColor,
      label: label,
      onAction: onAction,
      threshold: threshold,
    );
  }

  SwipeActionUiModel copyWith({
    SwipeActionType? type,
    Color? backgroundColor,
    IconData? icon,
    Color? iconColor,
    String? label,
    VoidCallback? onAction,
    double? threshold,
  }) {
    return SwipeActionUiModel(
      type: type ?? this.type,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      icon: icon ?? this.icon,
      iconColor: iconColor ?? this.iconColor,
      label: label ?? this.label,
      onAction: onAction ?? this.onAction,
      threshold: threshold ?? this.threshold,
    );
  }
}
