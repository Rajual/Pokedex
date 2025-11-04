import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import 'models/dot_indicator_ui_model.dart';

/// Tamaño del DotIndicator
enum DotIndicatorSize {
  small,
  medium,
  large,
}

/// Variante del DotIndicator
enum DotIndicatorVariant {
  dots,
  bars,
}

/// Componente DotIndicator para indicar paginación o progreso
///
/// Soporta dos variantes:
/// - dots: Puntos circulares
/// - bars: Barras horizontales
///
/// Ejemplo de uso:
/// ```dart
/// DotIndicator(
///   uiModel: DotIndicatorUiModel(
///     count: 5,
///     currentIndex: 2,
///     variant: DotIndicatorVariant.dots,
///     size: DotIndicatorSize.medium,
///   ),
///   onTap: (index) => print('Tapped $index'),
/// )
/// ```
class DotIndicator extends StatelessWidget {
  /// UI Model configuration
  final DotIndicatorUiModel uiModel;

  /// Callback cuando se toca un indicador
  final void Function(int index)? onTap;

  const DotIndicator({
    super.key,
    required this.uiModel,
    this.onTap,
  });

  /// Factory constructor for backward compatibility
  factory DotIndicator.fromProperties({
    required int count,
    required int currentIndex,
    DotIndicatorSize size = DotIndicatorSize.medium,
    DotIndicatorVariant variant = DotIndicatorVariant.dots,
    Color? activeColor,
    Color? inactiveColor,
    double? spacing,
    void Function(int index)? onTap,
    Key? key,
  }) {
    return DotIndicator(
      uiModel: DotIndicatorUiModel(
        count: count,
        currentIndex: currentIndex,
        size: size,
        variant: variant,
        activeColor: activeColor,
        inactiveColor: inactiveColor,
        spacing: spacing,
      ),
      onTap: onTap,
      key: key,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        uiModel.count,
        (index) => Padding(
          padding: EdgeInsets.symmetric(horizontal: _getSpacing() / 2),
          child: GestureDetector(
            onTap: onTap != null ? () => onTap!(index) : null,
            child: _buildIndicator(index),
          ),
        ),
      ),
    );
  }

  Widget _buildIndicator(int index) {
    final isActive = index == uiModel.currentIndex;

    return switch (uiModel.variant) {
      DotIndicatorVariant.dots => _buildDot(isActive),
      DotIndicatorVariant.bars => _buildBar(isActive),
    };
  }

  Widget _buildDot(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      width: _getDotSize(isActive),
      height: _getDotSize(isActive),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive ? _getActiveColor() : _getInactiveColor(),
      ),
    );
  }

  Widget _buildBar(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      width: _getBarWidth(isActive),
      height: _getBarHeight(),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(_getBarHeight() / 2),
        color: isActive ? _getActiveColor() : _getInactiveColor(),
      ),
    );
  }

  double _getDotSize(bool isActive) {
    final baseSize = switch (uiModel.size) {
      DotIndicatorSize.small => 6.0,
      DotIndicatorSize.medium => 8.0,
      DotIndicatorSize.large => 10.0,
    };

    return isActive ? baseSize * 1.5 : baseSize;
  }

  double _getBarWidth(bool isActive) {
    final baseWidth = switch (uiModel.size) {
      DotIndicatorSize.small => 16.0,
      DotIndicatorSize.medium => 20.0,
      DotIndicatorSize.large => 24.0,
    };

    return isActive ? baseWidth * 1.5 : baseWidth;
  }

  double _getBarHeight() {
    return switch (uiModel.size) {
      DotIndicatorSize.small => 4.0,
      DotIndicatorSize.medium => 5.0,
      DotIndicatorSize.large => 6.0,
    };
  }

  double _getSpacing() {
    if (uiModel.spacing != null) return uiModel.spacing!;

    return switch (uiModel.size) {
      DotIndicatorSize.small => 8.0,
      DotIndicatorSize.medium => 12.0,
      DotIndicatorSize.large => 16.0,
    };
  }

  Color _getActiveColor() {
    return uiModel.activeColor ?? AppColors.primary;
  }

  Color _getInactiveColor() {
    return uiModel.inactiveColor ?? AppColors.gray300;
  }
}
