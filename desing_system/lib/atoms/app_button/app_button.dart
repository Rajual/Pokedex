import 'package:flutter/material.dart';
import '../../theme/app_typography.dart';
import 'models/app_button_ui_model.dart';
import 'utils/button_color_scheme.dart';
import 'utils/button_dimensions.dart';
import 'models/button_colors.dart';
import 'models/button_dimensions_model.dart';
import 'models/button_state.dart';
import 'utils/enum.dart';
import 'widgets/jumping_dots_loader.dart';



/// Componente Button reutilizable con múltiples variantes
class AppButton extends StatelessWidget {
  final AppButtonUiModel uiModel;
  final VoidCallback? onPressed;

  const AppButton({
    required this.uiModel,
    this.onPressed,
    super.key,
  });

  /// Factory constructor for backward compatibility
  factory AppButton.fromProperties({
    required String label,
    VoidCallback? onPressed,
    ButtonType type = ButtonType.primary,
    ButtonSize size = ButtonSize.medium,
    bool isLoading = false,
    bool isEnabled = true,
    IconData? leadingIcon,
    IconData? trailingIcon,
    double? width,
    Key? key,
  }) {
    return AppButton(
      uiModel: AppButtonUiModel(
        label: label,
        type: type,
        size: size,
        isLoading: isLoading,
        isEnabled: isEnabled,
        leadingIcon: leadingIcon,
        trailingIcon: trailingIcon,
        width: width,
      ),
      onPressed: onPressed,
      key: key,
    );
  }

  /// Retorna los colores según el tipo de button
  ButtonColors _getColorScheme() {
    switch (uiModel.type) {
      case ButtonType.primary:
        return ButtonColorScheme.primary;
      case ButtonType.secondary:
        return ButtonColorScheme.secondary;
      case ButtonType.tertiary:
        return ButtonColorScheme.tertiary;
    }
  }

  /// Retorna las dimensiones según el tamaño
  ButtonDimensionsModel _getSizeDimensions() {
    switch (uiModel.size) {
      case ButtonSize.small:
        return ButtonDimensions.small;
      case ButtonSize.medium:
        return ButtonDimensions.medium;
      case ButtonSize.large:
        return ButtonDimensions.large;
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = _getColorScheme();
    final dimensions = _getSizeDimensions();
    final state = ButtonState(isEnabled: uiModel.isEnabled, isLoading: uiModel.isLoading);

    final backgroundColor = colors.getBackgroundColor(state.canPress);
    final textColor = colors.getTextColor(state.canPress);
    final borderColor = colors.getBorderColor(state.canPress);

    // Decidir qué widget usar basado en el tipo
    if (uiModel.type == ButtonType.secondary) {
      return _OutlinedButtonWidget(
        backgroundColor: backgroundColor,
        textColor: textColor,
        borderColor: borderColor,
        state: state,
        dimensions: dimensions,
        width: uiModel.width,
        onPressed: onPressed,
        label: uiModel.label,
        leadingIcon: uiModel.leadingIcon,
        trailingIcon: uiModel.trailingIcon,
      );
    }

    return Center(
      child: _ElevatedButtonWidget(
        backgroundColor: backgroundColor,
        textColor: textColor,
        state: state,
        dimensions: dimensions,
        width: uiModel.width,
        onPressed: onPressed,
        label: uiModel.label,
        leadingIcon: uiModel.leadingIcon,
        trailingIcon: uiModel.trailingIcon,
      ),
    );
  }
}

class _ElevatedButtonWidget extends StatelessWidget {
  final Color backgroundColor;
  final Color textColor;
  final ButtonState state;
  final ButtonDimensionsModel dimensions;
  final double? width;
  final VoidCallback? onPressed;
  final String label;
  final IconData? leadingIcon;
  final IconData? trailingIcon;

  const _ElevatedButtonWidget({
    required this.backgroundColor,
    required this.textColor,
    required this.state,
    required this.dimensions,
    required this.width,
    required this.onPressed,
    required this.label,
    required this.leadingIcon,
    required this.trailingIcon,
  });

  @override
  Widget build(BuildContext context) => SizedBox(
        width: width ?? double.infinity,
        height: dimensions.height,
        child: ElevatedButton(
          onPressed: state.canPress ? onPressed : null,
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            disabledBackgroundColor: backgroundColor,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(dimensions.borderRadius),
            ),
            padding: EdgeInsets.symmetric(horizontal: dimensions.padding),
          ),
          child: _ButtonContentWidget(
            textColor: textColor,
            dimensions: dimensions,
            state: state,
            label: label,
            leadingIcon: leadingIcon,
            trailingIcon: trailingIcon,
          ),
        ),
      );
}

class _OutlinedButtonWidget extends StatelessWidget {
  final Color backgroundColor;
  final Color textColor;
  final Color borderColor;
  final ButtonState state;
  final ButtonDimensionsModel dimensions;
  final double? width;
  final VoidCallback? onPressed;
  final String label;
  final IconData? leadingIcon;
  final IconData? trailingIcon;

  const _OutlinedButtonWidget({
    required this.backgroundColor,
    required this.textColor,
    required this.borderColor,
    required this.state,
    required this.dimensions,
    required this.width,
    required this.onPressed,
    required this.label,
    required this.leadingIcon,
    required this.trailingIcon,
  });

  @override
  Widget build(BuildContext context) => SizedBox(
        width: width ?? double.infinity,
        height: dimensions.height,
        child: OutlinedButton(
          onPressed: state.canPress ? onPressed : null,
          style: OutlinedButton.styleFrom(
            backgroundColor: backgroundColor,
            side: BorderSide(color: borderColor),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(dimensions.borderRadius),
            ),
            padding: EdgeInsets.symmetric(horizontal: dimensions.padding),
          ),
          child: _ButtonContentWidget(
            textColor: textColor,
            dimensions: dimensions,
            state: state,
            label: label,
            leadingIcon: leadingIcon,
            trailingIcon: trailingIcon,
          ),
        ),
      );
}

class _ButtonContentWidget extends StatelessWidget {
  final Color textColor;
  final ButtonDimensionsModel dimensions;
  final ButtonState state;
  final String label;
  final IconData? leadingIcon;
  final IconData? trailingIcon;

  const _ButtonContentWidget({
    required this.textColor,
    required this.dimensions,
    required this.state,
    required this.label,
    required this.leadingIcon,
    required this.trailingIcon,
  });

  @override
  Widget build(BuildContext context) => state.isLoading
      ? JumpingDotsLoader(
          color: textColor,
          dotSize: 6,
          spacing: 4,
        )
      : Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (leadingIcon != null) ...[
              Icon(
                leadingIcon,
                color: textColor,
                size: dimensions.iconSize,
              ),
              SizedBox(width: dimensions.iconTextSpacing),
            ],
            Flexible(
              child: Text(
                label,
                style: AppTypography.labelLarge.copyWith(
                  color: textColor,
                  fontSize: dimensions.fontSize,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            if (trailingIcon != null) ...[
              SizedBox(width: dimensions.iconTextSpacing),
              Icon(
                trailingIcon,
                color: textColor,
                size: dimensions.iconSize,
              ),
            ],
          ],
        );
}