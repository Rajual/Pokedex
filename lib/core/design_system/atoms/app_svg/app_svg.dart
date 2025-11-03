import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokedex/core/design_system/atoms/app_svg/utils/svg_dimensions.dart';
import 'package:pokedex/core/design_system/atoms/app_svg/utils/enums.dart';

/// [AppSvg] es un componente reutilizable para cargar SVGs desde assets
/// con soporte para colores dinámicos y diferentes tamaños.
class AppSvg extends StatelessWidget {
  /// Ruta del SVG en assets (ej: 'assets/icons/pokemon.svg')
  final String assetPath;

  /// Tamaño del SVG
  final SvgSize size;

  /// Color del SVG. Si es null, mantiene el color original del SVG
  final Color? color;

  /// Fit del SVG dentro de su contenedor
  final BoxFit fit;

  /// Si muestra un placeholder mientras carga
  final bool showPlaceholder;

  const AppSvg(
    this.assetPath, {
    this.size = SvgSize.medium,
    this.color,
    this.fit = BoxFit.contain,
    this.showPlaceholder = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dimensions = getSvgDimensions(size);

    final colorFilterToApply = color != null
        ? ColorFilter.mode(color!, BlendMode.srcIn)
        : null;

    final svgPicture = SvgPicture.asset(
      assetPath,
      width: dimensions.size,
      height: dimensions.size,
      fit: fit,
      semanticsLabel: 'Pokemon illustration',
      colorFilter: colorFilterToApply,
      placeholderBuilder: showPlaceholder
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
        debugPrint('Error loading SVG: $assetPath - $error');
        return Container(
          width: dimensions.size,
          height: dimensions.size,
          color: Colors.red[100],
          child: const Center(
            child: Icon(Icons.error, color: Colors.red),
          ),
        );
      },
      
    );

    return SizedBox(
      width: dimensions.size,
      height: dimensions.size,
      child: svgPicture,
    );
  }
}
