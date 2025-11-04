import 'package:flutter/material.dart';
import '../utils/hero_image_header_enums.dart';

/// UI Model para HeroImageHeader
///
/// Contiene la configuración del header con imagen hero.
class HeroImageHeaderUiModel {
  /// URL de la imagen a mostrar
  final String imageUrl;

  /// Tag para la animación hero
  final String heroTag;

  /// Color de fondo/gradiente
  final Color backgroundColor;

  /// Altura expandida como fracción de la pantalla (0.0 - 1.0)
  final double expandedHeightFraction;

  /// Si el AppBar debe permanecer fijo al hacer scroll
  final bool pinned;

  /// Mostrar botón de retroceso
  final bool showBackButton;

  /// Callback cuando se presiona el botón de retroceso
  final VoidCallback? onBack;

  /// Widgets para mostrar en actions (ej: favorite button)
  final List<Widget> actions;

  /// Mostrar decoración circular de fondo
  final bool showDecoration;

  /// Tamaño de la decoración
  final DecorationSize decorationSize;

  /// Posición de la decoración
  final CircleDecorationPosition decorationPosition;

  /// Opacidad de la decoración (0.0 - 1.0)
  final double decorationOpacity;

  /// Fracción del ancho de pantalla para la imagen (0.0 - 1.0)
  final double imageWidthFraction;

  /// Color del botón de retroceso
  final Color? backButtonColor;

  /// Icono personalizado para el botón de retroceso
  final IconData? backButtonIcon;

  /// Color para colorear la imagen SVG (opcional)
  final Color? imageColor;

  /// Widget de error cuando falla la carga de imagen
  final Widget Function(BuildContext, String, dynamic)? errorBuilder;

  /// Widget de placeholder mientras carga la imagen
  final Widget Function(BuildContext, String)? placeholderBuilder;

  const HeroImageHeaderUiModel({
    required this.imageUrl,
    required this.heroTag,
    this.backgroundColor = Colors.blue,
    this.expandedHeightFraction = 0.4,
    this.pinned = true,
    this.showBackButton = true,
    this.onBack,
    this.actions = const [],
    this.showDecoration = true,
    this.decorationSize = DecorationSize.large,
    this.decorationPosition = CircleDecorationPosition.topRight,
    this.decorationOpacity = 0.1,
    this.imageWidthFraction = 0.6,
    this.backButtonColor,
    this.backButtonIcon,
    this.imageColor,
    this.errorBuilder,
    this.placeholderBuilder,
  }) : assert(
          expandedHeightFraction >= 0.0 && expandedHeightFraction <= 1.0,
          'expandedHeightFraction must be between 0.0 and 1.0',
        ),
        assert(
          imageWidthFraction >= 0.0 && imageWidthFraction <= 1.0,
          'imageWidthFraction must be between 0.0 and 1.0',
        ),
        assert(
          decorationOpacity >= 0.0 && decorationOpacity <= 1.0,
          'decorationOpacity must be between 0.0 and 1.0',
        );

  /// Obtiene la altura expandida en pixels
  double getExpandedHeight(BuildContext context) {
    return MediaQuery.of(context).size.height * expandedHeightFraction;
  }

  /// Obtiene el ancho de la imagen en pixels
  double getImageWidth(BuildContext context) {
    return MediaQuery.of(context).size.width * imageWidthFraction;
  }

  /// Crea una copia del modelo con valores actualizados
  HeroImageHeaderUiModel copyWith({
    String? imageUrl,
    String? heroTag,
    Color? backgroundColor,
    double? expandedHeightFraction,
    bool? pinned,
    bool? showBackButton,
    VoidCallback? onBack,
    List<Widget>? actions,
    bool? showDecoration,
    DecorationSize? decorationSize,
    CircleDecorationPosition? decorationPosition,
    double? decorationOpacity,
    double? imageWidthFraction,
    Color? backButtonColor,
    IconData? backButtonIcon,
    Color? imageColor,
    Widget Function(BuildContext, String, dynamic)? errorBuilder,
    Widget Function(BuildContext, String)? placeholderBuilder,
  }) {
    return HeroImageHeaderUiModel(
      imageUrl: imageUrl ?? this.imageUrl,
      heroTag: heroTag ?? this.heroTag,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      expandedHeightFraction: expandedHeightFraction ?? this.expandedHeightFraction,
      pinned: pinned ?? this.pinned,
      showBackButton: showBackButton ?? this.showBackButton,
      onBack: onBack ?? this.onBack,
      actions: actions ?? this.actions,
      showDecoration: showDecoration ?? this.showDecoration,
      decorationSize: decorationSize ?? this.decorationSize,
      decorationPosition: decorationPosition ?? this.decorationPosition,
      decorationOpacity: decorationOpacity ?? this.decorationOpacity,
      imageWidthFraction: imageWidthFraction ?? this.imageWidthFraction,
      backButtonColor: backButtonColor ?? this.backButtonColor,
      backButtonIcon: backButtonIcon ?? this.backButtonIcon,
      imageColor: imageColor ?? this.imageColor,
      errorBuilder: errorBuilder ?? this.errorBuilder,
      placeholderBuilder: placeholderBuilder ?? this.placeholderBuilder,
    );
  }
}
