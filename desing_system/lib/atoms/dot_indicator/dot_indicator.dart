import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';

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
///   count: 5,
///   currentIndex: 2,
///   variant: DotIndicatorVariant.dots,
///   size: DotIndicatorSize.medium,
/// )
/// ```
class DotIndicator extends StatelessWidget {
  /// Número total de indicadores
  final int count;

  /// Índice actual (0-indexed)
  final int currentIndex;

  /// Tamaño del indicador
  final DotIndicatorSize size;

  /// Variante visual
  final DotIndicatorVariant variant;

  /// Color del indicador activo
  final Color? activeColor;

  /// Color del indicador inactivo
  final Color? inactiveColor;

  /// Espaciado entre indicadores
  final double? spacing;

  /// Callback cuando se toca un indicador
  final void Function(int index)? onTap;

  const DotIndicator({
    super.key,
    required this.count,
    required this.currentIndex,
    this.size = DotIndicatorSize.medium,
    this.variant = DotIndicatorVariant.dots,
    this.activeColor,
    this.inactiveColor,
    this.spacing,
    this.onTap,
  })  : assert(count > 0, 'count debe ser mayor a 0'),
        assert(currentIndex >= 0 && currentIndex < count,
            'currentIndex debe estar entre 0 y count-1');

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        count,
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
    final isActive = index == currentIndex;

    return switch (variant) {
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
    final baseSize = switch (size) {
      DotIndicatorSize.small => 6.0,
      DotIndicatorSize.medium => 8.0,
      DotIndicatorSize.large => 10.0,
    };

    return isActive ? baseSize * 1.5 : baseSize;
  }

  double _getBarWidth(bool isActive) {
    final baseWidth = switch (size) {
      DotIndicatorSize.small => 16.0,
      DotIndicatorSize.medium => 20.0,
      DotIndicatorSize.large => 24.0,
    };

    return isActive ? baseWidth * 1.5 : baseWidth;
  }

  double _getBarHeight() {
    return switch (size) {
      DotIndicatorSize.small => 4.0,
      DotIndicatorSize.medium => 5.0,
      DotIndicatorSize.large => 6.0,
    };
  }

  double _getSpacing() {
    if (spacing != null) return spacing!;

    return switch (size) {
      DotIndicatorSize.small => 8.0,
      DotIndicatorSize.medium => 12.0,
      DotIndicatorSize.large => 16.0,
    };
  }

  Color _getActiveColor() {
    return activeColor ?? AppColors.primary;
  }

  Color _getInactiveColor() {
    return inactiveColor ?? AppColors.gray300;
  }
}
