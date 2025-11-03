/// Tamaños del card
enum CardSize {
  small,    // Compact size
  medium,   // Default size
  large,    // Expanded size
}

extension CardSizeExtension on CardSize {
  double get height {
    return switch (this) {
      CardSize.small => 160,
      CardSize.medium => 180,
      CardSize.large => 220,
    };
  }

  double get width {
    return switch (this) {
      CardSize.small => 150,
      CardSize.medium => 170,
      CardSize.large => 200,
    };
  }

  double get padding {
    return switch (this) {
      CardSize.small => 12,
      CardSize.medium => 16,
      CardSize.large => 20,
    };
  }

  double get borderRadius {
    return switch (this) {
      CardSize.small => 12,
      CardSize.medium => 16,
      CardSize.large => 20,
    };
  }

  double get imageSize {
    return switch (this) {
      CardSize.small => 60,
      CardSize.medium => 80,
      CardSize.large => 100,
    };
  }
}

/// Estilos del card
enum CardStyle {
  elevated,    // Con sombra
  outlined,    // Solo borde
  filled,      // Fondo sólido
}

/// Variantes de elevación
enum CardElevation {
  none,      // Sin sombra
  low,       // Baja sombra (2dp)
  medium,    // Sombra media (4dp)
  high,      // Alta sombra (8dp)
}

extension CardElevationExtension on CardElevation {
  double get value {
    return switch (this) {
      CardElevation.none => 0,
      CardElevation.low => 2,
      CardElevation.medium => 4,
      CardElevation.high => 8,
    };
  }
}
