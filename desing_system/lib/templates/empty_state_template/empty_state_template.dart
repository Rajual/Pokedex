import 'package:flutter/material.dart';
import '../../atoms/app_button/app_button.dart';
import '../../atoms/app_button/utils/enum.dart';
import '../../atoms/app_image/app_image.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_dimensions.dart';

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
///   imagePath: 'assets/ilustration/PokemonMagikarp.png',
///   title: 'No has marcado ningún\nPokémon como favorito',
///   description: 'Haz clic en el ícono de corazón de tus\nPokémon favoritos y aparecerán aquí.',
///   actionLabel: 'Explorar Pokémon',
///   onAction: () => Navigator.push(...),
/// )
/// ```
class EmptyStateTemplate extends StatelessWidget {
  /// Ruta de la imagen (ilustración)
  final String imagePath;

  /// Título principal
  final String title;

  /// Descripción (opcional)
  final String? description;

  /// Texto de hint/ayuda adicional (opcional)
  final String? hint;

  /// Etiqueta del botón de acción (opcional)
  final String? actionLabel;

  /// Callback del botón de acción
  final VoidCallback? onAction;

  /// Etiqueta del botón secundario (opcional)
  final String? secondaryActionLabel;

  /// Callback del botón secundario
  final VoidCallback? onSecondaryAction;

  /// Tamaño de la imagen
  final AppImageSize imageSize;

  /// Color de fondo
  final Color? backgroundColor;

  /// Alineación del contenido
  final CrossAxisAlignment alignment;

  /// Padding horizontal
  final double horizontalPadding;

  /// Espaciado entre elementos
  final double spacing;

  const EmptyStateTemplate({
    super.key,
    required this.imagePath,
    required this.title,
    this.description,
    this.hint,
    this.actionLabel,
    this.onAction,
    this.secondaryActionLabel,
    this.onSecondaryAction,
    this.imageSize = AppImageSize.extraLarge,
    this.backgroundColor,
    this.alignment = CrossAxisAlignment.center,
    this.horizontalPadding = 24.0,
    this.spacing = 16.0,
  }) : assert(
          actionLabel == null || onAction != null,
          'onAction debe estar definido si actionLabel está presente',
        ),
        assert(
          secondaryActionLabel == null || onSecondaryAction != null,
          'onSecondaryAction debe estar definido si secondaryActionLabel está presente',
        );

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      color: backgroundColor ?? AppColors.gray100,
      child: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding,
              vertical: AppDimensions.xl,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: alignment,
              children: [
                // Imagen/Ilustración
                AppImage(
                  imagePath,
                  size: imageSize,
                  showErrorIcon: false,
                ),

                SizedBox(height: spacing * 2),

                // Título
                Text(
                  title,
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.gray900,
                  ),
                  textAlign: _getTextAlign(),
                ),

                if (description != null) ...[
                  SizedBox(height: spacing),

                  // Descripción
                  Text(
                    description!,
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: AppColors.gray600,
                    ),
                    textAlign: _getTextAlign(),
                  ),
                ],

                if (hint != null) ...[
                  SizedBox(height: spacing / 2),

                  // Hint adicional
                  Text(
                    hint!,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: AppColors.gray500,
                      fontStyle: FontStyle.italic,
                    ),
                    textAlign: _getTextAlign(),
                  ),
                ],

                // Botones de acción
                if (actionLabel != null || secondaryActionLabel != null) ...[
                  SizedBox(height: spacing * 2),

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
    if (actionLabel != null && secondaryActionLabel == null) {
      return AppButton(
        label: actionLabel!,
        onPressed: onAction,
        type: ButtonType.primary,
        size: ButtonSize.large,
        width: double.infinity,
      );
    }

    // Si solo hay botón secundario
    if (actionLabel == null && secondaryActionLabel != null) {
      return AppButton(
        label: secondaryActionLabel!,
        onPressed: onSecondaryAction,
        type: ButtonType.secondary,
        size: ButtonSize.large,
        width: double.infinity,
      );
    }

    // Si hay ambos botones
    return Column(
      children: [
        AppButton(
          label: actionLabel!,
          onPressed: onAction,
          type: ButtonType.primary,
          size: ButtonSize.large,
          width: double.infinity,
        ),
        SizedBox(height: spacing),
        AppButton(
          label: secondaryActionLabel!,
          onPressed: onSecondaryAction,
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
