/// Enum para los tamaños del StatCard
enum StatCardSize {
  /// Tamaño pequeño: padding reducido, íconos más pequeños
  small,

  /// Tamaño mediano (por defecto)
  medium,

  /// Tamaño grande: padding amplio, íconos más grandes
  large,
}

/// Enum para las variantes visuales del StatCard
enum StatCardVariant {
  /// Variante por defecto: fondo gris claro
  defaultVariant,

  /// Variante con color: usa el color proporcionado para el fondo
  colored,

  /// Variante outlined: fondo blanco con borde
  outlined,

  /// Variante elevada: con sombra
  elevated,
}
