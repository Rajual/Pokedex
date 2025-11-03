/// Modelo que representa las dimensiones de un botón
class ButtonDimensionsModel {
  final double height;
  final double fontSize;
  final double padding;
  final double iconSize;
  final double borderRadius;
  final double iconTextSpacing;
  final double loaderStrokeWidth;

  const ButtonDimensionsModel({
    required this.height,
    required this.fontSize,
    required this.padding,
    required this.iconSize,
    required this.borderRadius,
    required this.iconTextSpacing,
    required this.loaderStrokeWidth,
  });

  /// Crea una copia con valores opcionales reemplazados
  ButtonDimensionsModel copyWith({
    double? height,
    double? fontSize,
    double? padding,
    double? iconSize,
    double? borderRadius,
    double? iconTextSpacing,
    double? loaderStrokeWidth,
  }) {
    return ButtonDimensionsModel(
      height: height ?? this.height,
      fontSize: fontSize ?? this.fontSize,
      padding: padding ?? this.padding,
      iconSize: iconSize ?? this.iconSize,
      borderRadius: borderRadius ?? this.borderRadius,
      iconTextSpacing: iconTextSpacing ?? this.iconTextSpacing,
      loaderStrokeWidth: loaderStrokeWidth ?? this.loaderStrokeWidth,
    );
  }

  @override
  String toString() => '''ButtonDimensionsModel(
    height: $height,
    fontSize: $fontSize,
    padding: $padding,
    iconSize: $iconSize,
    borderRadius: $borderRadius,
    iconTextSpacing: $iconTextSpacing,
    loaderStrokeWidth: $loaderStrokeWidth,
  )''';
}
