import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_dimensions.dart';
import 'models/gender_bar_ui_model.dart';
import 'utils/gender_bar_enums.dart';

/// GenderBar molecule - Visualiza distribución de género
///
/// Componente para mostrar la proporción de género masculino y femenino
/// con una barra visual, iconos y porcentajes.
///
/// **Características**:
/// - 3 variantes: detailed, simple, compact
/// - 3 tamaños: small, medium, large
/// - Validación automática de porcentajes
/// - Colores personalizables
/// - Manejo de casos especiales (100% masculino, 100% femenino, sin género)
///
/// **Ejemplo básico**:
/// ```dart
/// GenderBar(
///   uiModel: GenderBarUiModel(
///     malePercentage: 87.5,
///     femalePercentage: 12.5,
///   ),
/// )
/// ```
///
/// **Ejemplo con variante simple**:
/// ```dart
/// GenderBar(
///   uiModel: GenderBarUiModel(
///     malePercentage: 50.0,
///     femalePercentage: 50.0,
///     variant: GenderBarVariant.simple,
///     showIcons: false,
///   ),
/// )
/// ```
class GenderBar extends StatelessWidget {
  /// UI Model con la configuración del componente
  final GenderBarUiModel uiModel;

  const GenderBar({
    super.key,
    required this.uiModel,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Validar porcentajes
    if (!uiModel.isValid) {
      return _buildErrorWidget(theme);
    }

    // Manejar caso sin género
    if (uiModel.isGenderless) {
      return _buildGenderlessWidget(theme);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Título opcional
        if (uiModel.title != null) ...[
          Text(
            uiModel.title!,
            style: theme.textTheme.labelLarge?.copyWith(
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
          SizedBox(height: _getSpacing()),
        ],

        // Barra de género
        _buildGenderBar(),

        // Labels según la variante
        if (uiModel.variant != GenderBarVariant.compact &&
            uiModel.showLabels) ...[
          SizedBox(height: _getSpacing()),
          _buildLabels(theme),
        ],
      ],
    );
  }

  /// Construye la barra de género
  Widget _buildGenderBar() {
    final barHeight = _getBarHeight();
    final borderRadius = _getBorderRadius();

    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: SizedBox(
        height: barHeight,
        child: Row(
          children: [
            // Barra masculina
            if (!uiModel.isFemaleOnly)
              Expanded(
                flex: uiModel.maleFlexValue,
                child: Container(
                  color: uiModel.maleColor ?? Colors.blue,
                ),
              ),
            // Barra femenina
            if (!uiModel.isMaleOnly)
              Expanded(
                flex: uiModel.femaleFlexValue,
                child: Container(
                  color: uiModel.femaleColor ?? Colors.pink,
                ),
              ),
          ],
        ),
      ),
    );
  }

  /// Construye las etiquetas de porcentaje
  Widget _buildLabels(ThemeData theme) {
    switch (uiModel.variant) {
      case GenderBarVariant.detailed:
        return _buildDetailedLabels(theme);
      case GenderBarVariant.simple:
        return _buildSimpleLabels(theme);
      case GenderBarVariant.compact:
        return const SizedBox.shrink();
    }
  }

  /// Construye labels detallados con iconos
  Widget _buildDetailedLabels(ThemeData theme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Label masculino
        if (!uiModel.isFemaleOnly)
          Flexible(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (uiModel.showIcons)
                  Icon(
                    Icons.male,
                    color: uiModel.maleColor ?? Colors.blue,
                    size: _getIconSize(),
                  ),
                if (uiModel.showIcons) const SizedBox(width: AppDimensions.xs),
                Text(
                  '${uiModel.malePercentage.toStringAsFixed(1)}%',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        // Label femenino
        if (!uiModel.isMaleOnly)
          Flexible(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (uiModel.showIcons)
                  Icon(
                    Icons.female,
                    color: uiModel.femaleColor ?? Colors.pink,
                    size: _getIconSize(),
                  ),
                if (uiModel.showIcons) const SizedBox(width: AppDimensions.xs),
                Text(
                  '${uiModel.femalePercentage.toStringAsFixed(1)}%',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }

  /// Construye labels simples sin iconos
  Widget _buildSimpleLabels(ThemeData theme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (!uiModel.isFemaleOnly)
          Text(
            '${uiModel.malePercentage.toStringAsFixed(1)}%',
            style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: uiModel.maleColor ?? Colors.blue,
            ),
          ),
        if (!uiModel.isMaleOnly)
          Text(
            '${uiModel.femalePercentage.toStringAsFixed(1)}%',
            style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: uiModel.femaleColor ?? Colors.pink,
            ),
          ),
      ],
    );
  }

  /// Widget de error cuando los porcentajes no suman 100
  Widget _buildErrorWidget(ThemeData theme) {
    return Container(
      padding: const EdgeInsets.all(AppDimensions.md),
      decoration: BoxDecoration(
        color: Colors.red.shade50,
        borderRadius: BorderRadius.circular(AppDimensions.sm),
        border: Border.all(color: Colors.red.shade300),
      ),
      child: Row(
        children: [
          Icon(Icons.error_outline, color: Colors.red.shade700, size: 20),
          const SizedBox(width: AppDimensions.sm),
          Expanded(
            child: Text(
              'Error: Los porcentajes deben sumar 100% (${uiModel.malePercentage + uiModel.femalePercentage}%)',
              style: theme.textTheme.bodySmall?.copyWith(
                color: Colors.red.shade700,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Widget para Pokémon sin género
  Widget _buildGenderlessWidget(ThemeData theme) {
    return Container(
      padding: const EdgeInsets.all(AppDimensions.md),
      decoration: BoxDecoration(
        color: AppColors.gray100,
        borderRadius: BorderRadius.circular(AppDimensions.sm),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.do_not_disturb, color: AppColors.gray500, size: 20),
          const SizedBox(width: AppDimensions.sm),
          Text(
            'Sin género',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: AppColors.gray700,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  // Obtener altura de la barra según el tamaño
  double _getBarHeight() {
    switch (uiModel.size) {
      case GenderBarSize.small:
        return 6.0;
      case GenderBarSize.medium:
        return 8.0;
      case GenderBarSize.large:
        return 12.0;
    }
  }

  // Obtener border radius según el tamaño
  double _getBorderRadius() {
    switch (uiModel.size) {
      case GenderBarSize.small:
        return 3.0;
      case GenderBarSize.medium:
        return 4.0;
      case GenderBarSize.large:
        return 6.0;
    }
  }

  // Obtener spacing según el tamaño
  double _getSpacing() {
    switch (uiModel.size) {
      case GenderBarSize.small:
        return AppDimensions.xs;
      case GenderBarSize.medium:
        return AppDimensions.sm;
      case GenderBarSize.large:
        return AppDimensions.md;
    }
  }

  // Obtener tamaño del ícono según el tamaño del componente
  double _getIconSize() {
    switch (uiModel.size) {
      case GenderBarSize.small:
        return 16.0;
      case GenderBarSize.medium:
        return 20.0;
      case GenderBarSize.large:
        return 24.0;
    }
  }
}
