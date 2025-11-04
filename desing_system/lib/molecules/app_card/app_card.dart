import 'package:flutter/material.dart';
import '../../atoms/app_favorite_tag/app_favorite_tag.dart';
import '../../atoms/app_favorite_tag/models/app_favorite_tag_ui_model.dart';
import '../../atoms/app_favorite_tag/utils/favorite_tag_enums.dart';
import '../../atoms/app_image/app_image.dart';
import '../../atoms/app_image/models/app_image_ui_model.dart';
import '../app_type_tag/app_type_tag.dart';
import 'models/app_card_ui_model.dart';

/// Card component that displays a Pokemon with:
/// - Background with gradient or solid color
/// - Pokemon image
/// - Pokedex number
/// - Pokemon name
/// - Type tags (primary and secondary)
/// - Favorite button
///
/// Example:
/// ```dart
/// AppCard(
///   uiModel: AppCardUiModel(
///     pokemonName: 'Bulbasaur',
///     pokemonNumber: 1,
///     primaryType: PokemonType.grass,
///     secondaryType: PokemonType.poison,
///     imagePath: 'assets/ilustration/PokemonBulbasaur.png',
///     backgroundColor: Color(0xFF78C850),
///     isFavorite: true,
///   ),
///   onFavoriteChanged: (value) {
///     setState(() => isFavorite = value);
///   },
///   onTap: () => print('Card tapped'),
/// )
/// ```
class AppCard extends StatelessWidget {
  final AppCardUiModel uiModel;

  /// Callback quando o favorito muda
  final Function(bool) onFavoriteChanged;

  /// Callback ao tocar no card
  final VoidCallback? onTap;

  const AppCard({
    required this.uiModel,
    required this.onFavoriteChanged,
    this.onTap,
    super.key,
  });

  /// Factory constructor for backward compatibility
  factory AppCard.fromProperties({
    required String pokemonName,
    required int pokemonNumber,
    required PokemonType primaryType,
    required String imagePath,
    required Color backgroundColor,
    required bool isFavorite,
    required Function(bool) onFavoriteChanged,
    PokemonType? secondaryType,
    CardSize size = CardSize.medium,
    CardStyle style = CardStyle.elevated,
    CardElevation elevation = CardElevation.medium,
    VoidCallback? onTap,
    bool isEnabled = true,
    bool showPokemonNumber = true,
    Key? key,
  }) {
    return AppCard(
      uiModel: AppCardUiModel(
        pokemonName: pokemonName,
        pokemonNumber: pokemonNumber,
        primaryType: primaryType,
        secondaryType: secondaryType,
        imagePath: imagePath,
        backgroundColor: backgroundColor,
        isFavorite: isFavorite,
        size: size,
        style: style,
        elevation: elevation,
        isEnabled: isEnabled,
        showPokemonNumber: showPokemonNumber,
      ),
      onFavoriteChanged: onFavoriteChanged,
      onTap: onTap,
      key: key,
    );
  }

  @override
  Widget build(BuildContext context) {
    final cardWidth = uiModel.size.width;
    final cardHeight = uiModel.size.height;
    final padding = uiModel.size.padding;
    final borderRadius = uiModel.size.borderRadius;

    // Format Pokemon number
    final pokemonNumberStr = uiModel.pokemonNumber.toString().padLeft(4, '0');

    // Build the card content
    Widget cardContent = Container(
      width: cardWidth,
      height: cardHeight,
      decoration: BoxDecoration(
        color: uiModel.backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
        border: uiModel.style == CardStyle.outlined
            ? Border.all(color: uiModel.backgroundColor.withOpacity(0.5), width: 2)
            : null,
      ),
      child: Padding(
        padding: EdgeInsets.all(padding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top row: Number and Favorite button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Pokemon number
                if (uiModel.showPokemonNumber)
                  Expanded(
                    child: Text(
                      'Nº$pokemonNumberStr',
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: Colors.white70,
                            fontWeight: FontWeight.w500,
                            fontSize: 10,
                          ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                // Favorite button
                SizedBox(
                  width: 32,
                  height: 32,
                  child: AppFavoriteTag.fromProperties(
                    isFavorite: uiModel.isFavorite,
                    onFavoriteChanged: onFavoriteChanged,
                    size: FavoriteTagSize.small,
                    style: FavoriteTagStyle.outlined,
                    activeColor: Colors.white,
                    inactiveColor: Colors.white70,
                    enableAnimation: true,
                    isEnabled: uiModel.isEnabled,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            // Pokemon image
            Expanded(
              flex: 2,
              child: Center(
                child: AppImage(
                  uiModel: AppImageUiModel(
                    assetPath: uiModel.imagePath,
                    size: AppImageSize.medium,
                    fit: AppImageFit.contain,
                    showShadow: false,
                    backgroundColor: Colors.transparent,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 4),
            // Bottom section: Name and Types
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Pokemon name
                  Text(
                    uiModel.pokemonName,
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: padding / 4),
                  // Type tags
                  Flexible(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Wrap(
                        spacing: 4,
                        runSpacing: 2,
                        children: [
                          AppTypeTag(
                            type: uiModel.primaryType,
                            size: TypeTagSize.small,
                          ),
                          if (uiModel.secondaryType != null)
                            AppTypeTag(
                              type: uiModel.secondaryType!,
                              size: TypeTagSize.small,
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

    // Apply onTap and elevation styling
    if (uiModel.style == CardStyle.elevated) {
      cardContent = Material(
        elevation: uiModel.elevation.value,
        borderRadius: BorderRadius.circular(borderRadius),
        child: cardContent,
      );
    }

    // Wrap with GestureDetector if onTap is provided
    if (onTap != null && uiModel.isEnabled) {
      cardContent = GestureDetector(
        onTap: onTap,
        child: cardContent,
      );
    }

    return cardContent;
  }
}
