import 'package:flutter/material.dart';
import 'favorite_tag_enums.dart';

/// Widget base para todos los estilos de favorite tag
abstract class BaseFavoriteTagStyle extends StatelessWidget {
  final double dimension;
  final double iconSize;
  final Color currentColor;
  final bool isFavorite;
  final VoidCallback onTap;
  final bool isEnabled;

  const BaseFavoriteTagStyle({
    required this.dimension,
    required this.iconSize,
    required this.currentColor,
    required this.isFavorite,
    required this.onTap,
    required this.isEnabled,
    super.key,
  });

  Icon buildIcon() {
    return Icon(
      isFavorite ? Icons.favorite : Icons.favorite_border,
      size: iconSize,
      color: currentColor,
    );
  }

  void handleTap() {
    if (isEnabled) {
      onTap();
    }
  }
}

/// Estilo Filled - Fondo sólido
class FilledFavoriteTag extends BaseFavoriteTagStyle {
  const FilledFavoriteTag({
    required double dimension,
    required double iconSize,
    required Color currentColor,
    required bool isFavorite,
    required VoidCallback onTap,
    required bool isEnabled,
    super.key,
  }) : super(
    dimension: dimension,
    iconSize: iconSize,
    currentColor: currentColor,
    isFavorite: isFavorite,
    onTap: onTap,
    isEnabled: isEnabled,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: dimension,
      height: dimension,
      decoration: BoxDecoration(
        color: currentColor.withOpacity(0.15),
        borderRadius: BorderRadius.circular(dimension / 2),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: handleTap,
          borderRadius: BorderRadius.circular(dimension / 2),
          child: Center(child: buildIcon()),
        ),
      ),
    );
  }
}

/// Estilo Outlined - Solo borde
class OutlinedFavoriteTag extends BaseFavoriteTagStyle {
  const OutlinedFavoriteTag({
    required double dimension,
    required double iconSize,
    required Color currentColor,
    required bool isFavorite,
    required VoidCallback onTap,
    required bool isEnabled,
    super.key,
  }) : super(
    dimension: dimension,
    iconSize: iconSize,
    currentColor: currentColor,
    isFavorite: isFavorite,
    onTap: onTap,
    isEnabled: isEnabled,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: dimension,
      height: dimension,
      decoration: BoxDecoration(
        border: Border.all(
          color: currentColor,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(dimension / 2),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: handleTap,
          borderRadius: BorderRadius.circular(dimension / 2),
          child: Center(child: buildIcon()),
        ),
      ),
    );
  }
}

/// Estilo Floating - Flotante con shadow
class FloatingFavoriteTag extends BaseFavoriteTagStyle {
  const FloatingFavoriteTag({
    required double dimension,
    required double iconSize,
    required Color currentColor,
    required bool isFavorite,
    required VoidCallback onTap,
    required bool isEnabled,
    super.key,
  }) : super(
    dimension: dimension,
    iconSize: iconSize,
    currentColor: currentColor,
    isFavorite: isFavorite,
    onTap: onTap,
    isEnabled: isEnabled,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: dimension,
      height: dimension,
      decoration: BoxDecoration(
        color: currentColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(dimension / 2),
        boxShadow: [
          BoxShadow(
            color: currentColor.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: handleTap,
          borderRadius: BorderRadius.circular(dimension / 2),
          child: Center(child: buildIcon()),
        ),
      ),
    );
  }
}

/// Factory para crear el widget correcto según el estilo
class FavoriteTagStyleFactory {
  static Widget create({
    required FavoriteTagStyle style,
    required double dimension,
    required double iconSize,
    required Color currentColor,
    required bool isFavorite,
    required VoidCallback onTap,
    required bool isEnabled,
  }) {
    return switch (style) {
      FavoriteTagStyle.filled => FilledFavoriteTag(
        dimension: dimension,
        iconSize: iconSize,
        currentColor: currentColor,
        isFavorite: isFavorite,
        onTap: onTap,
        isEnabled: isEnabled,
      ),
      FavoriteTagStyle.outlined => OutlinedFavoriteTag(
        dimension: dimension,
        iconSize: iconSize,
        currentColor: currentColor,
        isFavorite: isFavorite,
        onTap: onTap,
        isEnabled: isEnabled,
      ),
      FavoriteTagStyle.floating => FloatingFavoriteTag(
        dimension: dimension,
        iconSize: iconSize,
        currentColor: currentColor,
        isFavorite: isFavorite,
        onTap: onTap,
        isEnabled: isEnabled,
      ),
    };
  }
}
