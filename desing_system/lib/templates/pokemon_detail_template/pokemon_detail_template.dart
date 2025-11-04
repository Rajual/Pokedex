import 'package:flutter/material.dart';
import '../../atoms/app_favorite_tag/app_favorite_tag.dart';
import '../../atoms/app_favorite_tag/models/app_favorite_tag_ui_model.dart';
import '../../atoms/app_favorite_tag/utils/favorite_tag_enums.dart';
import '../../atoms/stat_card/models/stat_card_ui_model.dart';
import '../../atoms/stat_card/stat_card.dart';
import '../../molecules/app_type_tag/app_type_tag.dart';
import '../../molecules/gender_bar/gender_bar.dart';
import '../../molecules/gender_bar/models/gender_bar_ui_model.dart';
import '../../organisms/hero_image_header/hero_image_header.dart';
import '../../organisms/hero_image_header/models/hero_image_header_ui_model.dart';
import '../../organisms/hero_image_header/utils/hero_image_header_enums.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_dimensions.dart';
import 'models/pokemon_detail_template_ui_model.dart';

/// Template para mostrar el detalle completo de un Pokémon
///
/// Reutiliza:
/// - HeroImageHeader: Para el header con imagen hero y decoraciones
/// - AppFavoriteTag: Para el botón de favorito
/// - AppTypeTag: Para mostrar tipos y debilidades
/// - StatCard: Para mostrar estadísticas (peso, altura, categoría, habilidad)
/// - GenderBar: Para mostrar distribución de género
///
/// Ejemplo de uso:
/// ```dart
/// PokemonDetailTemplate(
///   uiModel: PokemonDetailTemplateUiModel(
///     number: '001',
///     name: 'Bulbasaur',
///     imageUrl: 'https://...',
///     types: [PokemonType.grass, PokemonType.poison],
///     description: 'Tiene una semilla de planta...',
///     weight: '6,9 kg',
///     height: '0,7 m',
///     category: 'SEMILLA',
///     ability: 'Espesura',
///     malePercentage: 87.5,
///     femalePercentage: 12.5,
///     weaknesses: [PokemonType.fire, PokemonType.psychic],
///     primaryColor: Colors.green,
///     isFavorite: false,
///     onFavoriteToggle: () {},
///     onBack: () {},
///   ),
/// )
/// ```
class PokemonDetailTemplate extends StatelessWidget {
  /// UI Model configuration
  final PokemonDetailTemplateUiModel uiModel;

  const PokemonDetailTemplate({
    super.key,
    required this.uiModel,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // Header con imagen del Pokémon usando HeroImageHeader
          HeroImageHeader(
            uiModel: HeroImageHeaderUiModel(
              imageUrl: uiModel.imageUrl,
              heroTag: 'pokemon-${uiModel.number}',
              backgroundColor: uiModel.primaryColor,
              expandedHeightFraction: 0.4,
              showBackButton: true,
              onBack: uiModel.onBack,
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: AppDimensions.md),
                  child: AppFavoriteTag(
                    uiModel: AppFavoriteTagUiModel(
                      isFavorite: uiModel.isFavorite,
                      size: FavoriteTagSize.large,
                      style: FavoriteTagStyle.floating,
                    ),
                    onFavoriteChanged: (_) {
                      uiModel.onFavoriteToggle?.call();
                    },
                  ),
                ),
              ],
              showDecoration: true,
              decorationPosition: CircleDecorationPosition.topRight,
            ),
          ),

          // Contenido principal
          SliverToBoxAdapter(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(AppDimensions.xl),
                  topRight: Radius.circular(AppDimensions.xl),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(AppDimensions.lg),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Nombre y número
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          uiModel.name,
                          style: theme.textTheme.headlineLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Nº${uiModel.number}',
                          style: theme.textTheme.titleLarge?.copyWith(
                            color: AppColors.gray500,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: AppDimensions.md),

                    // Types
                    Wrap(
                      spacing: AppDimensions.sm,
                      children: uiModel.types
                          .map((type) => AppTypeTag(
                                type: type,
                                size: TypeTagSize.medium,
                              ))
                          .toList(),
                    ),

                    const SizedBox(height: AppDimensions.lg),

                    // Descripción
                    Text(
                      uiModel.description,
                      style: theme.textTheme.bodyLarge?.copyWith(
                        color: AppColors.gray700,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: AppDimensions.xl),

                    // Stats Grid
                    Row(
                      children: [
                        Expanded(
                          child: StatCard(
                            uiModel: StatCardUiModel(
                              icon: Icons.monitor_weight_outlined,
                              label: 'PESO',
                              value: uiModel.weight,
                            ),
                          ),
                        ),
                        const SizedBox(width: AppDimensions.md),
                        Expanded(
                          child: StatCard(
                            uiModel: StatCardUiModel(
                              icon: Icons.height,
                              label: 'ALTURA',
                              value: uiModel.height,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: AppDimensions.md),

                    Row(
                      children: [
                        Expanded(
                          child: StatCard(
                            uiModel: StatCardUiModel(
                              icon: Icons.category_outlined,
                              label: 'CATEGORÍA',
                              value: uiModel.category,
                            ),
                          ),
                        ),
                        const SizedBox(width: AppDimensions.md),
                        Expanded(
                          child: StatCard(
                            uiModel: StatCardUiModel(
                              icon: Icons.flash_on_outlined,
                              label: 'HABILIDAD',
                              value: uiModel.ability,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: AppDimensions.xl),

                    // Género
                    GenderBar(
                      uiModel: GenderBarUiModel(
                        malePercentage: uiModel.malePercentage,
                        femalePercentage: uiModel.femalePercentage,
                        title: 'GÉNERO',
                      ),
                    ),

                    const SizedBox(height: AppDimensions.xl),

                    // Debilidades
                    _buildWeaknessesSection(theme),

                    const SizedBox(height: AppDimensions.xl),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWeaknessesSection(ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Debilidades',
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: AppDimensions.md),
        Wrap(
          spacing: AppDimensions.sm,
          runSpacing: AppDimensions.sm,
          children: uiModel.weaknesses
              .map((weakness) => AppTypeTag(
                    type: weakness,
                    size: TypeTagSize.small,
                  ))
              .toList(),
        ),
      ],
    );
  }
}
