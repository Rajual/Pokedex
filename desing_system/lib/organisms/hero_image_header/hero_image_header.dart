import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'models/hero_image_header_ui_model.dart';
import 'utils/hero_image_header_enums.dart';

/// HeroImageHeader organism - Header con imagen hero y decoraciones
///
/// Componente para mostrar un header con imagen hero, gradiente de fondo,
/// decoraciones circulares y acciones personalizables.
///
/// **Características**:
/// - SliverAppBar con FlexibleSpaceBar
/// - Animación Hero para transiciones fluidas
/// - Gradiente de fondo configurable
/// - Decoración circular opcional
/// - Soporte para SVG (flutter_svg) con color personalizable
/// - Botón de retroceso personalizable
/// - Acciones personalizables (ej: favorito)
/// - Placeholder mientras carga la imagen
///
/// **Ejemplo básico**:
/// ```dart
/// HeroImageHeader(
///   uiModel: HeroImageHeaderUiModel(
///     imageUrl: 'assets/pokemon/bulbasaur.svg',
///     heroTag: 'pokemon-001',
///     backgroundColor: Colors.green,
///   ),
/// )
/// ```
///
/// **Ejemplo completo**:
/// ```dart
/// HeroImageHeader(
///   uiModel: HeroImageHeaderUiModel(
///     imageUrl: 'assets/pokemon/bulbasaur.svg',
///     heroTag: 'pokemon-001',
///     backgroundColor: Colors.green,
///     expandedHeightFraction: 0.4,
///     imageColor: Colors.white,  // Colorear el SVG
///     showBackButton: true,
///     onBack: () => Navigator.pop(context),
///     actions: [
///       AppFavoriteTag(
///         uiModel: AppFavoriteTagUiModel(isFavorite: true),
///         onFavoriteChanged: (value) {},
///       ),
///     ],
///     showDecoration: true,
///     decorationPosition: CircleDecorationPosition.topRight,
///   ),
/// )
/// ```
class HeroImageHeader extends StatelessWidget {
  /// UI Model configuration
  final HeroImageHeaderUiModel uiModel;

  const HeroImageHeader({
    super.key,
    required this.uiModel,
  });

  @override
  Widget build(BuildContext context) {
    final expandedHeight = uiModel.getExpandedHeight(context);
    final imageWidth = uiModel.getImageWidth(context);

    return SliverAppBar(
      expandedHeight: expandedHeight,
      pinned: uiModel.pinned,
      backgroundColor: uiModel.backgroundColor,
      leading: uiModel.showBackButton
          ? IconButton(
              icon: Icon(
                uiModel.backButtonIcon ?? Icons.arrow_back,
                color: uiModel.backButtonColor ?? Colors.white,
              ),
              onPressed: uiModel.onBack ?? () => Navigator.of(context).pop(),
            )
          : null,
      actions: uiModel.actions,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          children: [
            // Gradiente de fondo
            _buildGradientBackground(),

            // Decoración circular opcional
            if (uiModel.showDecoration) _buildCircleDecoration(),

            // Imagen Hero
            _buildHeroImage(context, imageWidth),
          ],
        ),
      ),
    );
  }

  /// Construye el gradiente de fondo
  Widget _buildGradientBackground() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            uiModel.backgroundColor,
            uiModel.backgroundColor.withOpacity(0.7),
          ],
        ),
      ),
    );
  }

  /// Construye la decoración circular
  Widget _buildCircleDecoration() {
    final position = uiModel.decorationPosition.getPosition();
    final size = uiModel.decorationSize.size;

    return Positioned(
      left: position['left'],
      right: position['right'],
      top: position['top'],
      bottom: position['bottom'],
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white.withOpacity(uiModel.decorationOpacity),
        ),
      ),
    );
  }

  /// Construye la imagen hero con soporte para SVG (asset), PNG/JPG (asset o network)
  Widget _buildHeroImage(BuildContext context, double imageWidth) {
    final isNetworkImage = uiModel.imageUrl.startsWith('http://') || 
                           uiModel.imageUrl.startsWith('https://');
    final isSvg = uiModel.imageUrl.toLowerCase().endsWith('.svg');

    return Center(
      child: Hero(
        tag: uiModel.heroTag,
        child: _buildImageWidget(imageWidth, isNetworkImage, isSvg),
      ),
    );
  }

  /// Construye el widget de imagen apropiado según el tipo
  Widget _buildImageWidget(double imageWidth, bool isNetworkImage, bool isSvg) {
    // SVG desde assets
    if (isSvg && !isNetworkImage) {
      return SvgPicture.asset(
        uiModel.imageUrl,
        width: imageWidth,
        height: imageWidth,
        fit: BoxFit.contain,
        colorFilter: uiModel.imageColor != null
            ? ColorFilter.mode(uiModel.imageColor!, BlendMode.srcIn)
            : null,
        placeholderBuilder: (context) => _buildPlaceholder(imageWidth),
      );
    }

    // SVG desde network
    if (isSvg && isNetworkImage) {
      return SvgPicture.network(
        uiModel.imageUrl,
        width: imageWidth,
        height: imageWidth,
        fit: BoxFit.contain,
        colorFilter: uiModel.imageColor != null
            ? ColorFilter.mode(uiModel.imageColor!, BlendMode.srcIn)
            : null,
        placeholderBuilder: (context) => _buildPlaceholder(imageWidth),
      );
    }

    // PNG/JPG desde network
    if (isNetworkImage) {
      return Image.network(
        uiModel.imageUrl,
        width: imageWidth,
        height: imageWidth,
        fit: BoxFit.contain,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return _buildPlaceholder(imageWidth);
        },
        errorBuilder: (context, error, stackTrace) {
          debugPrint('Error loading network image: ${uiModel.imageUrl} - $error');
          return _buildErrorWidget(imageWidth);
        },
      );
    }

    // PNG/JPG desde assets
    return Image.asset(
      uiModel.imageUrl,
      width: imageWidth,
      height: imageWidth,
      fit: BoxFit.contain,
      errorBuilder: (context, error, stackTrace) {
        debugPrint('Error loading asset image: ${uiModel.imageUrl} - $error');
        return _buildErrorWidget(imageWidth);
      },
    );
  }

  /// Construye el placeholder mientras carga
  Widget _buildPlaceholder(double size) {
    return SizedBox(
      width: size,
      height: size,
      child: Center(
        child: CircularProgressIndicator(
          color: uiModel.backButtonColor ?? Colors.white,
        ),
      ),
    );
  }

  /// Construye el widget de error
  Widget _buildErrorWidget(double size) {
    return SizedBox(
      width: size,
      height: size,
      child: Center(
        child: Icon(
          Icons.broken_image,
          size: size * 0.3,
          color: Colors.white.withOpacity(0.5),
        ),
      ),
    );
  }
}
