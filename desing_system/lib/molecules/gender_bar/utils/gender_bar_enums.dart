/// Enum para las variantes visuales del GenderBar
enum GenderBarVariant {
  /// Variante detallada: barra + iconos + porcentajes
  detailed,

  /// Variante simple: solo barra con porcentajes
  simple,

  /// Variante compacta: solo barra sin labels
  compact,
}

/// Enum para el tamaño del GenderBar
enum GenderBarSize {
  /// Tamaño pequeño: barra más delgada
  small,

  /// Tamaño mediano (por defecto)
  medium,

  /// Tamaño grande: barra más gruesa
  large,
}
