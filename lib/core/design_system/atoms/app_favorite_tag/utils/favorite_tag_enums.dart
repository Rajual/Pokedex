/// Tamaños del botón de favoritos
enum FavoriteTagSize {
  small,    // 40x40
  medium,   // 56x56
  large,    // 72x72
}

extension FavoriteTagSizeExtension on FavoriteTagSize {
  double get dimension {
    return switch (this) {
      FavoriteTagSize.small => 40,
      FavoriteTagSize.medium => 56,
      FavoriteTagSize.large => 72,
    };
  }

  double get iconSize {
    return switch (this) {
      FavoriteTagSize.small => 20,
      FavoriteTagSize.medium => 28,
      FavoriteTagSize.large => 36,
    };
  }
}

/// Estilos del botón de favoritos
enum FavoriteTagStyle {
  filled,      // Fondo sólido
  outlined,    // Solo borde
  floating,    // Flotante con shadow
}
