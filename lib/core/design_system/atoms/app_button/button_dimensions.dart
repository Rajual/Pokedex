import '../../theme/app_dimensions.dart';
import 'models/button_dimensions_model.dart';

/// Configuración de dimensiones para los diferentes tamaños de botones
class ButtonDimensions {
  ButtonDimensions._();

  /// Dimensiones para botón Small (40px)
  static ButtonDimensionsModel get small {
    return const ButtonDimensionsModel(
      height: AppDimensions.heightButtonSmall,
      fontSize: 12,
      padding: AppDimensions.md,
      iconSize: AppDimensions.iconXs,
      borderRadius: AppDimensions.radiusXl,
      iconTextSpacing: AppDimensions.sm,
      loaderStrokeWidth: 2,
    );
  }

  /// Dimensiones para botón Medium (48px) - DEFAULT
  static ButtonDimensionsModel get medium {
    return const ButtonDimensionsModel(
      height: AppDimensions.heightButton,
      fontSize: 16,
      padding: AppDimensions.lg,
      iconSize: AppDimensions.iconSm,
      borderRadius: AppDimensions.radiusXl,
      iconTextSpacing: AppDimensions.sm,
      loaderStrokeWidth: 2,
    );
  }

  /// Dimensiones para botón Large (56px)
  static ButtonDimensionsModel get large {
    return const ButtonDimensionsModel(
      height: AppDimensions.heightButtonLarge,
      fontSize: 18,
      padding: AppDimensions.xl,
      iconSize: AppDimensions.iconMd,
      borderRadius: AppDimensions.radiusXl,
      iconTextSpacing: AppDimensions.sm,
      loaderStrokeWidth: 2,
    );
  }

  /// Retorna las dimensiones para el tamaño de botón especificado
  static ButtonDimensionsModel getSizeDimensions(String buttonSize) {
    switch (buttonSize) {
      case 'small':
        return small;
      case 'medium':
        return medium;
      case 'large':
        return large;
      default:
        return medium;
    }
  }
}
