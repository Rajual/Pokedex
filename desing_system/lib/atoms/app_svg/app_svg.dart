// Enums moved to models/app_svg_ui_model.dart
export 'models/app_svg_ui_model.dart' show SvgSize;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'models/app_svg_ui_model.dart';

/// [AppSvg] es un componente reutilizable para cargar SVGs desde assets
/// con soporte para colores dinámicos y diferentes tamaños.
class AppSvg extends StatelessWidget {
  final AppSvgUiModel uiModel;

  const AppSvg({
    required this.uiModel,
    super.key,
  });

  /// Factory constructor for backward compatibility
  factory AppSvg.fromProperties(
    String assetPath, {
    SvgSize size = SvgSize.medium,
    Color? color,
    BoxFit fit = BoxFit.contain,
    bool showPlaceholder = false,
    Key? key,
  }) {
    return AppSvg(
      uiModel: AppSvgUiModel(
        assetPath: assetPath,
        size: size,
        color: color,
        fit: fit,
        showPlaceholder: showPlaceholder,
      ),
      key: key,
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorFilterToApply = uiModel.color != null
        ? ColorFilter.mode(uiModel.color!, BlendMode.srcIn)
        : null;

    final svgPicture = SvgPicture.asset(
      uiModel.assetPath,
      width: uiModel.size.size,
      height: uiModel.size.size,
      fit: uiModel.fit,
      semanticsLabel: 'Pokemon illustration',
      colorFilter: colorFilterToApply,
      placeholderBuilder: uiModel.showPlaceholder
          ? (context) => Container(
                color: Colors.grey[200],
                child: const Center(
                  child: SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                ),
              )
          : null,
      errorBuilder: (context, error, stackTrace) {
        debugPrint('Error loading SVG: ${uiModel.assetPath} - $error');
        return Container(
          width: uiModel.size.size,
          height: uiModel.size.size,
          color: Colors.red[100],
          child: const Center(
            child: Icon(Icons.error, color: Colors.red),
          ),
        );
      },

    );

    return SizedBox(
      width: uiModel.size.size,
      height: uiModel.size.size,
      child: svgPicture,
    );
  }
}
