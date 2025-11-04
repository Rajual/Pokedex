/// Enum para el tamaño de la decoración circular
enum DecorationSize {
  small,
  medium,
  large,
}

/// Enum para la posición de la decoración circular
enum CircleDecorationPosition {
  topLeft,
  topRight,
  bottomLeft,
  bottomRight,
}

/// Extension para obtener el tamaño numérico
extension DecorationSizeExtension on DecorationSize {
  double get size {
    switch (this) {
      case DecorationSize.small:
        return 150.0;
      case DecorationSize.medium:
        return 200.0;
      case DecorationSize.large:
        return 250.0;
    }
  }
}

/// Extension para obtener la posición de la decoración
extension CircleDecorationPositionExtension on CircleDecorationPosition {
  Map<String, double> getPosition() {
    switch (this) {
      case CircleDecorationPosition.topLeft:
        return {'left': -50.0, 'top': -50.0};
      case CircleDecorationPosition.topRight:
        return {'right': -50.0, 'top': -50.0};
      case CircleDecorationPosition.bottomLeft:
        return {'left': -50.0, 'bottom': -50.0};
      case CircleDecorationPosition.bottomRight:
        return {'right': -50.0, 'bottom': -50.0};
    }
  }
}
