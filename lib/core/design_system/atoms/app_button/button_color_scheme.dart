import '../../theme/app_colors.dart';
import 'models/button_colors.dart';

/// Configuración de esquemas de colores para los diferentes tipos de botones
class ButtonColorScheme {
  ButtonColorScheme._();

  /// Retorna el esquema de colores para Primary Button
  static ButtonColors get primary {
    return const ButtonColors(
      background: AppColors.primary,
      text: AppColors.white,
      disabledBg: AppColors.gray400,
      disabledText: AppColors.gray600,
    );
  }

  /// Retorna el esquema de colores para Secondary Button
  static ButtonColors get secondary {
    return const ButtonColors(
      background: AppColors.white,
      text: AppColors.black,
      disabledBg: AppColors.gray200,
      disabledText: AppColors.gray500,
      border: AppColors.black,
    );
  }

  /// Retorna el esquema de colores para Tertiary Button
  static ButtonColors get tertiary {
    return const ButtonColors(
      background: AppColors.gray200,
      text: AppColors.primary,
      disabledBg: AppColors.gray200,
      disabledText: AppColors.gray500,
    );
  }

  /// Retorna los colores para el tipo de botón especificado
  static ButtonColors getColorScheme(String buttonType) {
    switch (buttonType) {
      case 'primary':
        return primary;
      case 'secondary':
        return secondary;
      case 'tertiary':
        return tertiary;
      default:
        return primary;
    }
  }
}

