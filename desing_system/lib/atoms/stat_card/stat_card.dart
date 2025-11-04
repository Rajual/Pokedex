import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_dimensions.dart';
import 'models/stat_card_ui_model.dart';
import 'utils/stat_card_enums.dart';

/// StatCard atom - Muestra una estadística con ícono, label y valor
///
/// Componente reutilizable para mostrar métricas, estadísticas o información
/// estructurada en formato card.
///
/// **Características**:
/// - 3 tamaños: small, medium, large
/// - 4 variantes: default, colored, outlined, elevated
/// - Colores personalizables
/// - Estado enabled/disabled
///
/// **Ejemplo básico**:
/// ```dart
/// StatCard(
///   uiModel: StatCardUiModel(
///     icon: Icons.monitor_weight_outlined,
///     label: 'PESO',
///     value: '6,9 kg',
///   ),
/// )
/// ```
///
/// **Ejemplo con variante colored**:
/// ```dart
/// StatCard(
///   uiModel: StatCardUiModel(
///     icon: Icons.height,
///     label: 'ALTURA',
///     value: '0,7 m',
///     size: StatCardSize.large,
///     variant: StatCardVariant.colored,
///     color: Colors.blue,
///   ),
/// )
/// ```
class StatCard extends StatelessWidget {
  /// UI Model con la configuración del card
  final StatCardUiModel uiModel;

  /// Callback al presionar el card (opcional)
  final VoidCallback? onTap;

  const StatCard({
    super.key,
    required this.uiModel,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Dimensiones según el tamaño
    final padding = _getPadding();
    final iconSize = _getIconSize();
    final borderRadius = _getBorderRadius();

    // Colores según la variante
    final backgroundColor = _getBackgroundColor();
    final borderColor = _getBorderColor();
    final elevation = _getElevation();

    // Colores del contenido
    final iconColor = uiModel.iconColor ?? AppColors.gray600;
    final labelColor = uiModel.labelColor ?? AppColors.gray600;
    final valueColor = uiModel.valueColor ?? theme.textTheme.titleMedium?.color;

    final content = Container(
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
        border: borderColor != null ? Border.all(color: borderColor) : null,
        boxShadow: elevation > 0
            ? [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: elevation,
                  offset: Offset(0, elevation / 2),
                ),
              ]
            : null,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Ícono + Label
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                uiModel.icon,
                size: iconSize,
                color: uiModel.isEnabled
                    ? iconColor
                    : iconColor.withOpacity(0.5),
              ),
              const SizedBox(width: AppDimensions.xs),
              Flexible(
                child: Text(
                  uiModel.label,
                  style: _getLabelStyle(theme).copyWith(
                    color: uiModel.isEnabled
                        ? labelColor
                        : labelColor.withOpacity(0.5),
                  ),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppDimensions.xs),
          // Valor
          Text(
            uiModel.value,
            style: _getValueStyle(theme).copyWith(
              color: uiModel.isEnabled
                  ? valueColor
                  : valueColor?.withOpacity(0.5),
            ),
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
        ],
      ),
    );

    if (onTap != null && uiModel.isEnabled) {
      return InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(borderRadius),
        child: content,
      );
    }

    return content;
  }

  // Obtener padding según el tamaño
  double _getPadding() {
    switch (uiModel.size) {
      case StatCardSize.small:
        return AppDimensions.sm;
      case StatCardSize.medium:
        return AppDimensions.md;
      case StatCardSize.large:
        return AppDimensions.lg;
    }
  }

  // Obtener tamaño del ícono según el tamaño del card
  double _getIconSize() {
    switch (uiModel.size) {
      case StatCardSize.small:
        return 16.0;
      case StatCardSize.medium:
        return 20.0;
      case StatCardSize.large:
        return 24.0;
    }
  }

  // Obtener border radius según el tamaño
  double _getBorderRadius() {
    switch (uiModel.size) {
      case StatCardSize.small:
        return AppDimensions.sm;
      case StatCardSize.medium:
        return AppDimensions.md;
      case StatCardSize.large:
        return AppDimensions.lg;
    }
  }

  // Obtener color de fondo según la variante
  Color _getBackgroundColor() {
    switch (uiModel.variant) {
      case StatCardVariant.defaultVariant:
        return AppColors.gray100;
      case StatCardVariant.colored:
        return uiModel.color?.withOpacity(0.1) ?? AppColors.gray100;
      case StatCardVariant.outlined:
        return AppColors.white;
      case StatCardVariant.elevated:
        return AppColors.white;
    }
  }

  // Obtener color del borde según la variante
  Color? _getBorderColor() {
    switch (uiModel.variant) {
      case StatCardVariant.outlined:
        return uiModel.color ?? AppColors.gray300;
      case StatCardVariant.defaultVariant:
      case StatCardVariant.colored:
      case StatCardVariant.elevated:
        return null;
    }
  }

  // Obtener elevación según la variante
  double _getElevation() {
    switch (uiModel.variant) {
      case StatCardVariant.elevated:
        return 4.0;
      case StatCardVariant.defaultVariant:
      case StatCardVariant.colored:
      case StatCardVariant.outlined:
        return 0.0;
    }
  }

  // Obtener estilo del label según el tamaño
  TextStyle _getLabelStyle(ThemeData theme) {
    switch (uiModel.size) {
      case StatCardSize.small:
        return theme.textTheme.labelSmall?.copyWith(
              fontWeight: FontWeight.w600,
              letterSpacing: 0.8,
            ) ??
            const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.8,
            );
      case StatCardSize.medium:
        return theme.textTheme.labelSmall?.copyWith(
              fontWeight: FontWeight.w600,
              letterSpacing: 1.0,
            ) ??
            const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.0,
            );
      case StatCardSize.large:
        return theme.textTheme.labelMedium?.copyWith(
              fontWeight: FontWeight.w600,
              letterSpacing: 1.2,
            ) ??
            const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.2,
            );
    }
  }

  // Obtener estilo del valor según el tamaño
  TextStyle _getValueStyle(ThemeData theme) {
    switch (uiModel.size) {
      case StatCardSize.small:
        return theme.textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ) ??
            const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            );
      case StatCardSize.medium:
        return theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ) ??
            const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            );
      case StatCardSize.large:
        return theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ) ??
            const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            );
    }
  }
}
