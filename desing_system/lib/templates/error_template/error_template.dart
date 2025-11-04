import 'package:flutter/material.dart';
import '../../atoms/app_button/app_button.dart';
import '../../atoms/app_image/app_image.dart';
import '../../atoms/app_svg/app_svg.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_dimensions.dart';
import '../../theme/app_typography.dart';
import 'models/error_template_ui_model.dart';

/// Template for displaying error states
class ErrorTemplate extends StatelessWidget {
  /// UI model containing error display configuration
  final ErrorTemplateUiModel uiModel;

  /// Callback when retry button is pressed
  final VoidCallback? onRetry;

  const ErrorTemplate({
    super.key,
    required this.uiModel,
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: uiModel.backgroundColor ?? AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(AppDimensions.lg),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Error icon
              _buildIcon(),
              SizedBox(height: AppDimensions.xl),

              // Error title
              Text(
                uiModel.title,
                style: AppTypography.headlineMedium.copyWith(
                  color: uiModel.textColor ?? AppColors.text.primary,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: AppDimensions.md),

              // Error description
              Text(
                uiModel.description,
                style: AppTypography.bodyLarge.copyWith(
                  color: uiModel.textColor?.withOpacity(0.7) ?? AppColors.text.secondary,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: AppDimensions.xl),

              // Retry button
              if (onRetry != null)
                AppButton.fromProperties(
                  label: uiModel.retryButtonText,
                  onPressed: onRetry,
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIcon() {
    if (uiModel.icon != null) {
      return uiModel.icon!;
    }

    if (uiModel.iconPath != null) {
      if (uiModel.iconPath!.endsWith('.svg')) {
        return AppSvg.fromProperties(
          uiModel.iconPath!,
        );
      } else {
        return AppImage.fromProperties(
          uiModel.iconPath!,
        );
      }
    }

    // Default error icon (you can replace with a proper icon)
    return Container(
      width: 120,
      height: 120,
      decoration: BoxDecoration(
        color: AppColors.error.withOpacity(0.1),
        shape: BoxShape.circle,
      ),
      child: Icon(
        Icons.error_outline,
        size: 60,
        color: AppColors.error,
      ),
    );
  }
}