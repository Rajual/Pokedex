import 'package:flutter/material.dart';
import '../app_favorite_tag/app_favorite_tag.dart';
import '../app_favorite_tag/utils/favorite_tag_enums.dart';
import '../app_image/app_image.dart';
import '../../molecules/app_type_tag/app_type_tag.dart';
import 'card_enums.dart';

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
///   pokemonName: 'Bulbasaur',
///   pokemonNumber: 1,
///   primaryType: PokemonType.grass,
///   secondaryType: PokemonType.poison,
///   imagePath: 'assets/ilustration/PokemonBulbasaur.png',
///   backgroundColor: Color(0xFF78C850),
///   isFavorite: true,
///   onFavoriteChanged: (value) {
///     setState(() => isFavorite = value);
///   },
/// )
/// ```
class AppCard extends StatelessWidget {
  /// Nome do Pokémon
  final String pokemonName;

  /// Número da Pokédex
  final int pokemonNumber;

  /// Tipo primário
  final PokemonType primaryType;

  /// Tipo secundário (opcional)
  final PokemonType? secondaryType;

  /// Caminho da imagem do Pokémon
  final String imagePath;

  /// Cor de fundo do card
  final Color backgroundColor;

  /// Se está marcado como favorito
  final bool isFavorite;

  /// Callback quando o favorito muda
  final Function(bool) onFavoriteChanged;

  /// Tamaño do card
  final CardSize size;

  /// Estilo do card
  final CardStyle style;

  /// Elevação do card
  final CardElevation elevation;

  /// Callback ao tocar no card
  final VoidCallback? onTap;

  /// Se o card está habilitado
  final bool isEnabled;

  /// Mostrar número da Pokédex
  final bool showPokemonNumber;

  const AppCard({
    required this.pokemonName,
    required this.pokemonNumber,
    required this.primaryType,
    required this.imagePath,
    required this.backgroundColor,
    required this.isFavorite,
    required this.onFavoriteChanged,
    this.secondaryType,
    this.size = CardSize.medium,
    this.style = CardStyle.elevated,
    this.elevation = CardElevation.medium,
    this.onTap,
    this.isEnabled = true,
    this.showPokemonNumber = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cardWidth = size.width;
    final cardHeight = size.height;
    final padding = size.padding;
    final borderRadius = size.borderRadius;

    // Format Pokemon number
    final pokemonNumberStr = pokemonNumber.toString().padLeft(4, '0');

    // Build the card content
    Widget cardContent = Container(
      width: cardWidth,
      height: cardHeight,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
        border: style == CardStyle.outlined
            ? Border.all(color: backgroundColor.withOpacity(0.5), width: 2)
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
                if (showPokemonNumber)
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
                  child: AppFavoriteTag(
                    isFavorite: isFavorite,
                    onFavoriteChanged: onFavoriteChanged,
                    size: FavoriteTagSize.small,
                    style: FavoriteTagStyle.outlined,
                    activeColor: Colors.white,
                    inactiveColor: Colors.white70,
                    enableAnimation: true,
                    isEnabled: isEnabled,
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
                  imagePath,
                  size: AppImageSize.medium,
                  fit: AppImageFit.contain,
                  showShadow: false,
                  backgroundColor: Colors.transparent,
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
                    pokemonName,
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
                            type: primaryType,
                            size: TypeTagSize.small,
                          ),
                          if (secondaryType != null)
                            AppTypeTag(
                              type: secondaryType!,
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
    if (style == CardStyle.elevated) {
      cardContent = Material(
        elevation: elevation.value,
        borderRadius: BorderRadius.circular(borderRadius),
        child: cardContent,
      );
    }

    // Wrap with GestureDetector if onTap is provided
    if (onTap != null && isEnabled) {
      cardContent = GestureDetector(
        onTap: onTap,
        child: cardContent,
      );
    }

    return cardContent;
  }
}
