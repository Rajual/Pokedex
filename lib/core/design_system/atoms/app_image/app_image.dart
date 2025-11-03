import 'package:flutter/material.dart';

/// Tamaños disponibles para AppImage
enum AppImageSize {
  small,      // 80x80
  medium,     // 120x120
  large,      // 160x160
  extraLarge, // 200x200
}

extension AppImageSizeExtension on AppImageSize {
  double get dimension {
    return switch (this) {
      AppImageSize.small => 80,
      AppImageSize.medium => 120,
      AppImageSize.large => 160,
      AppImageSize.extraLarge => 200,
    };
  }
}

/// Modo de ajuste de imagen
enum AppImageFit {
  cover,
  contain,
  fill,
  fitWidth,
  fitHeight,
}

extension AppImageFitExtension on AppImageFit {
  BoxFit get boxFit {
    return switch (this) {
      AppImageFit.cover => BoxFit.cover,
      AppImageFit.contain => BoxFit.contain,
      AppImageFit.fill => BoxFit.fill,
      AppImageFit.fitWidth => BoxFit.fitWidth,
      AppImageFit.fitHeight => BoxFit.fitHeight,
    };
  }
}

/// Componente para renderizar imágenes PNG desde assets
/// 
/// Ejemplo:
/// ```dart
/// AppImage(
///   assetPath: 'assets/ilustration/PokemonCharizard.png',
///   size: AppImageSize.medium,
/// )
/// ```
class AppImage extends StatelessWidget {
  /// Ruta del asset de imagen (ej: 'assets/ilustration/PokemonCharizard.png')
  final String assetPath;

  /// Tamaño de la imagen
  final AppImageSize size;

  /// Modo de ajuste de la imagen
  final AppImageFit fit;

  /// Border radius de la imagen
  final double borderRadius;

  /// Shadow para elevar la imagen
  final bool showShadow;

  /// Color de fondo detrás de la imagen
  final Color? backgroundColor;

  /// Errores al cargar la imagen
  final bool showErrorIcon;

  const AppImage(
    this.assetPath, {
    this.size = AppImageSize.medium,
    this.fit = AppImageFit.cover,
    this.borderRadius = 8.0,
    this.showShadow = false,
    this.backgroundColor,
    this.showErrorIcon = true,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dimension = size.dimension;

    final imageWidget = ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Image.asset(
        assetPath,
        width: dimension,
        height: dimension,
        fit: fit.boxFit,
        errorBuilder: (context, error, stackTrace) {
          debugPrint('Error loading image: $assetPath - $error');
          return Container(
            width: dimension,
            height: dimension,
            color: Colors.grey[300],
            child: showErrorIcon
                ? const Center(
                    child: Icon(
                      Icons.broken_image,
                      color: Colors.grey,
                      size: 32,
                    ),
                  )
                : null,
          );
        },
      ),
    );

    if (backgroundColor != null) {
      return Container(
        width: dimension,
        height: dimension,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: imageWidget,
      );
    }

    if (showShadow) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: imageWidget,
      );
    }

    return imageWidget;
  }
}
