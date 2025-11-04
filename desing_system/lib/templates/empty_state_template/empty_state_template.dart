import 'package:flutter/material.dart';
import '../../atoms/app_button/app_button.dart';
import '../../atoms/app_button/utils/enum.dart';
import '../../atoms/app_image/app_image.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_dimensions.dart';
import 'models/empty_state_template_ui_model.dart';

/// Template para mostrar estados vacíos o informativos
///
/// Reutiliza:
/// - AppImage: Para la ilustración
/// - AppButton: Para acciones (opcional)
/// - TextTheme: Para título, descripción y hint
///
/// Ejemplo de uso:
/// ```dart
/// EmptyStateTemplate(
///   uiModel: EmptyStateTemplateUiModel(
///     imagePath: 'assets/ilustration/PokemonMagikarp.png',
///     title: 'No has marcado ningún\nPokémon como favorito',
///     description: 'Haz clic en el ícono de corazón de tus\nPokémon favoritos y aparecerán aquí.',
///     actionLabel: 'Explorar Pokémon',
///     onAction: () => Navigator.push(...),
///   ),
/// )
/// ```
class EmptyStateTemplate extends StatelessWidget {
  /// UI Model configuration
  final EmptyStateTemplateUiModel uiModel;

  /// Color de fondo
  final Color? backgroundColor;

  /// Alineación del contenido
  final CrossAxisAlignment alignment;

  const EmptyStateTemplate({
    super.key,
    required this.uiModel,
    this.backgroundColor,
    this.alignment = CrossAxisAlignment.center,
  });

  /// Factory constructor for backward compatibility
  factory EmptyStateTemplate.fromProperties({
    required String imagePath,
    required String title,
    String? description,
    String? hint,
    String? actionLabel,
    VoidCallback? onAction,
    String? secondaryActionLabel,
    VoidCallback? onSecondaryAction,
    AppImageSize imageSize = AppImageSize.extraLarge,
    Color? backgroundColor,
    CrossAxisAlignment alignment = CrossAxisAlignment.center,
    double horizontalPadding = 24.0,
    double spacing = 16.0,
    Key? key,
  }) {
    return EmptyStateTemplate(
      uiModel: EmptyStateTemplateUiModel(
        imagePath: imagePath,
        title: title,
        description: description,
        hint: hint,
        actionLabel: actionLabel,
        secondaryActionLabel: secondaryActionLabel,
        imageSize: imageSize,
        horizontalPadding: horizontalPadding,
        spacing: spacing,
        onAction: onAction,
        onSecondaryAction: onSecondaryAction,
      ),
      backgroundColor: backgroundColor,
      alignment: alignment,
      key: key,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      color: backgroundColor ?? AppColors.gray100,
      child: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: uiModel.horizontalPadding,
              vertical: AppDimensions.xl,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: alignment,
              children: [
                // Imagen/Ilustración
                AppImage.fromProperties(
                  uiModel.imagePath,
                  size: uiModel.imageSize,
                  showErrorIcon: false,
                ),

                SizedBox(height: uiModel.spacing * 2),

                // Título
                Text(
                  uiModel.title,
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.gray900,
                  ),
                  textAlign: _getTextAlign(),
                ),

                if (uiModel.description != null) ...[
                  SizedBox(height: uiModel.spacing),

                  // Descripción
                  Text(
                    uiModel.description!,
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: AppColors.gray600,
                    ),
                    textAlign: _getTextAlign(),
                  ),
                ],

                if (uiModel.hint != null) ...[
                  SizedBox(height: uiModel.spacing / 2),

                  // Hint adicional
                  Text(
                    uiModel.hint!,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: AppColors.gray500,
                      fontStyle: FontStyle.italic,
                    ),
                    textAlign: _getTextAlign(),
                  ),
                ],

                // Botones de acción
                if (uiModel.actionLabel != null || uiModel.secondaryActionLabel != null) ...[
                  SizedBox(height: uiModel.spacing * 2),

                  _buildActions(),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildActions() {
    // Si solo hay un botón
    if (uiModel.actionLabel != null && uiModel.secondaryActionLabel == null) {
      return AppButton.fromProperties(
        label: uiModel.actionLabel!,
        onPressed: uiModel.onAction,
        type: ButtonType.primary,
        size: ButtonSize.large,
        width: double.infinity,
      );
    }

    // Si solo hay botón secundario
    if (uiModel.actionLabel == null && uiModel.secondaryActionLabel != null) {
      return AppButton.fromProperties(
        label: uiModel.secondaryActionLabel!,
        onPressed: uiModel.onSecondaryAction,
        type: ButtonType.secondary,
        size: ButtonSize.large,
        width: double.infinity,
      );
    }

    // Si hay ambos botones
    return Column(
      children: [
        AppButton.fromProperties(
          label: uiModel.actionLabel!,
          onPressed: uiModel.onAction,
          type: ButtonType.primary,
          size: ButtonSize.large,
          width: double.infinity,
        ),
        SizedBox(height: uiModel.spacing),
        AppButton.fromProperties(
          label: uiModel.secondaryActionLabel!,
          onPressed: uiModel.onSecondaryAction,
          type: ButtonType.secondary,
          size: ButtonSize.large,
          width: double.infinity,
        ),
      ],
    );
  }

  TextAlign _getTextAlign() {
    return alignment == CrossAxisAlignment.center
        ? TextAlign.center
        : alignment == CrossAxisAlignment.start
            ? TextAlign.start
            : TextAlign.end;
  }
}
