import 'package:flutter/material.dart';
import 'models/app_image_ui_model.dart';

// Enums moved to models/app_image_ui_model.dart
export 'models/app_image_ui_model.dart' show AppImageSize, AppImageFit;

/// Componente para renderizar imágenes PNG desde assets
///
/// Ejemplo:
/// ```dart
/// AppImage(
///   uiModel: AppImageUiModel(
///     assetPath: 'assets/ilustration/PokemonCharizard.png',
///     size: AppImageSize.medium,
///   ),
/// )
/// ```
class AppImage extends StatelessWidget {
  final AppImageUiModel uiModel;

  const AppImage({
    required this.uiModel,
    Key? key,
  }) : super(key: key);

  /// Factory constructor for backward compatibility
  factory AppImage.fromProperties(
    String assetPath, {
    AppImageSize size = AppImageSize.medium,
    AppImageFit fit = AppImageFit.cover,
    double borderRadius = 8.0,
    bool showShadow = false,
    Color? backgroundColor,
    bool showErrorIcon = true,
    Key? key,
  }) {
    return AppImage(
      uiModel: AppImageUiModel(
        assetPath: assetPath,
        size: size,
        fit: fit,
        borderRadius: borderRadius,
        showShadow: showShadow,
        backgroundColor: backgroundColor,
        showErrorIcon: showErrorIcon,
      ),
      key: key,
    );
  }

  @override
  Widget build(BuildContext context) {
    final dimension = uiModel.size.dimension;
    final isNetworkImage = uiModel.assetPath.startsWith('http://') || 
                           uiModel.assetPath.startsWith('https://');

    final imageWidget = ClipRRect(
      borderRadius: BorderRadius.circular(uiModel.borderRadius),
      child: isNetworkImage
          ? Image.network(
              uiModel.assetPath,
              width: dimension,
              height: dimension,
              fit: uiModel.fit.boxFit,
              errorBuilder: (context, error, stackTrace) {
                debugPrint('Error loading image: ${uiModel.assetPath} - $error');
                return Container(
                  width: dimension,
                  height: dimension,
                  color: Colors.grey[300],
                  child: uiModel.showErrorIcon
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
            )
          : Image.asset(
              uiModel.assetPath,
              width: dimension,
              height: dimension,
              fit: uiModel.fit.boxFit,
              errorBuilder: (context, error, stackTrace) {
                debugPrint('Error loading image: ${uiModel.assetPath} - $error');
                return Container(
                  width: dimension,
                  height: dimension,
                  color: Colors.grey[300],
                  child: uiModel.showErrorIcon
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

    if (uiModel.backgroundColor != null) {
      return Container(
        width: dimension,
        height: dimension,
        decoration: BoxDecoration(
          color: uiModel.backgroundColor,
          borderRadius: BorderRadius.circular(uiModel.borderRadius),
        ),
        child: imageWidget,
      );
    }

    if (uiModel.showShadow) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(uiModel.borderRadius),
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
