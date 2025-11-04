import 'package:desing_system/organisms/pokemon_list_view/models/pokemon_list_view_ui_model.dart';
import 'package:desing_system/organisms/pokemon_list_view/pokemon_list_view.dart';
import 'package:desing_system/templates/empty_state_template/models/empty_state_template_ui_model.dart';
import 'package:desing_system/templates/loading_template/models/loading_template_ui_model.dart';
import 'package:desing_system/templates/loading_template/loading_template.dart';
import 'package:desing_system/molecules/skeleton/skeleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:desing_system/desing_system.dart';
import 'package:pokedex/app/config/localizations.dart';
import 'package:pokedex/features/listing/presentation/presenter/listing_presenter.dart';
import 'package:pokedex/features/listing/domain/entities/pokemon_list_item.dart';

/// Screen that displays a searchable and filterable Pokemon list
/// using design system components
class ListingScreen extends ConsumerStatefulWidget {
  const ListingScreen({super.key});

  @override
  ConsumerState<ListingScreen> createState() => _ListingScreenState();
}

/// Skeleton widget for loading UI model (localizations)
class _LoadingSkeleton extends StatelessWidget {
  const _LoadingSkeleton();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Skeleton(width: 120, height: 24),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search bar skeleton
              Container(
                height: 48,
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: AppColors.gray100,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 16),
                    Skeleton(width: 24, height: 24),
                    const SizedBox(width: 12),
                    Expanded(child: Skeleton(width: double.infinity, height: 16)),
                  ],
                ),
              ),

              // Pokemon cards skeleton
              Expanded(
                child: ListView.builder(
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: AppColors.gray200),
                      ),
                      child: Row(
                        children: [
                          SkeletonAvatar(size: 48),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Skeleton(width: double.infinity, height: 16),
                                const SizedBox(height: 4),
                                Skeleton(width: 80, height: 14),
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    Skeleton(width: 60, height: 20, borderRadius: 10),
                                    const SizedBox(width: 8),
                                    Skeleton(width: 50, height: 20, borderRadius: 10),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ListingScreenState extends ConsumerState<ListingScreen> {
  @override
  void initState() {
    super.initState();
    // Load initial data when screen opens
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(pokemonListProvider.notifier).loadPokemon();
    });
  }

  @override
  Widget build(BuildContext context) {
    final localizations = MyAppLocalizations.of(context);
    final pokemonAsync = ref.watch(filteredPokemonProvider);
    final filterState = ref.watch(filterProvider);

    // Show skeleton while UI model (localizations) is loading
    if (localizations == null) {
      return const _LoadingSkeleton();
    }

    return pokemonAsync.when(
      loading: () => LoadingTemplate(
        uiModel: LoadingTemplateUiModel(
          title: localizations.getListingTitle(),
          subtitle: localizations.getListingLoading(),
          layoutType: LoadingLayoutType.cards,
          itemCount: 6,
        ),
      ),
      error: (error, stack) => _buildErrorContent(error.toString(), localizations),
      data: (data) => _buildSuccessContent(data, localizations, filterState),
    );
  }

  Widget _buildSuccessContent(
    List<PokemonListItem> pokemon,
    MyAppLocalizations? localizations,
    FilterState filterState,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: Text(localizations?.getListingTitle() ?? 'Pokémon List'),
        actions: [
          if (filterState.hasActiveFilters)
            Container(
              margin: const EdgeInsets.only(right: 8),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                '${filterState.selectedTypes.length}',
                style: const TextStyle(
                  color: AppColors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          IconButton(
            icon: Icon(
              Icons.filter_list,
              color: filterState.hasActiveFilters ? AppColors.primary : null,
            ),
            onPressed: () => _showFilterBottomSheet(context, localizations),
          ),
        ],
      ),
      body: _buildPokemonList(pokemon, localizations, filterState),
    );
  }

  Widget _buildErrorContent(
    String error,
    MyAppLocalizations? localizations,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: Text(localizations?.getListingTitle() ?? 'Pokémon List'),
      ),
      body: EmptyStateTemplate(
        uiModel: EmptyStateTemplateUiModel(
          imagePath: 'assets/error_icon.png', // TODO: Add proper error icon
          title: localizations?.getListingError() ?? 'Failed to load Pokémon',
          description: error,
          actionLabel: localizations?.getListingRetry() ?? 'Retry',
          onAction: () => ref.read(pokemonListProvider.notifier).loadPokemon(),
        ),
      ),
    );
  }

  Widget _buildPokemonList(
    List<PokemonListItem> pokemon,
    MyAppLocalizations? localizations,
    FilterState filterState,
  ) {
    // Convert domain entities to design system Pokemon objects
    final designSystemPokemon = pokemon.map(_mapToDesignSystemPokemon).toList();

    return PokemonListView(
      uiModel: PokemonListViewUiModel(
        searchPlaceholder: localizations?.getListingSearchPlaceholder() ?? 'Search Pokémon...',
        cardSize: CardSize.medium,
        showSearchBar: true,
        isSearching: false,
      ),
      pokemonList: designSystemPokemon,
      onFavoriteChanged: (index, isFavorite) {
        // TODO: Handle favorite changes
      },
      onSearchChanged: (query) {
        // TODO: Implement search functionality
      },
    );
  }

  Pokemon _mapToDesignSystemPokemon(PokemonListItem item) {
    return Pokemon(
      name: item.name,
      number: item.id,
      primaryType: _mapStringToPokemonType(item.primaryType),
      types: [
        _mapStringToPokemonType(item.primaryType),
        if (item.secondaryType != null) _mapStringToPokemonType(item.secondaryType!),
      ],
      imagePath: item.imageUrl,
      backgroundColor: _getTypeColor(item.primaryType),
    );
  }

  PokemonType _mapStringToPokemonType(String type) {
    switch (type.toLowerCase()) {
      case 'fire':
        return PokemonType.fire;
      case 'water':
        return PokemonType.water;
      case 'grass':
        return PokemonType.grass;
      case 'electric':
        return PokemonType.electric;
      case 'ice':
        return PokemonType.ice;
      case 'fighting':
        return PokemonType.fighting;
      case 'poison':
        return PokemonType.poison;
      case 'ground':
        return PokemonType.ground;
      case 'flying':
        return PokemonType.flying;
      case 'psychic':
        return PokemonType.psychic;
      case 'bug':
        return PokemonType.bug;
      case 'rock':
        return PokemonType.rock;
      case 'ghost':
        return PokemonType.ghost;
      case 'dragon':
        return PokemonType.dragon;
      case 'dark':
        return PokemonType.dark;
      case 'steel':
        return PokemonType.steel;
      case 'fairy':
        return PokemonType.fairy;
      case 'normal':
      default:
        return PokemonType.normal;
    }
  }

  Color _getTypeColor(String type) {
    switch (type.toLowerCase()) {
      case 'fire':
        return const Color(0xFFFF9B9B);
      case 'water':
        return const Color(0xFF9BD9FF);
      case 'grass':
        return const Color(0xFF9BFF9B);
      case 'electric':
        return const Color(0xFFFFEB9B);
      case 'ice':
        return const Color(0xFFD9F2FF);
      case 'fighting':
        return const Color(0xFFFFD1A3);
      case 'poison':
        return const Color(0xFFE1B3FF);
      case 'ground':
        return const Color(0xFFFFD699);
      case 'flying':
        return const Color(0xFFB3D9FF);
      case 'psychic':
        return const Color(0xFFFFB3D9);
      case 'bug':
        return const Color(0xFFD9FFB3);
      case 'rock':
        return const Color(0xFFFFD9B3);
      case 'ghost':
        return const Color(0xFFE1B3FF);
      case 'dragon':
        return const Color(0xFFB3C9FF);
      case 'dark':
        return const Color(0xFFD9D9D9);
      case 'steel':
        return const Color(0xFFB3D9FF);
      case 'fairy':
        return const Color(0xFFFFB3E6);
      case 'normal':
      default:
        return const Color(0xFFE6E6E6);
    }
  }



  void _showFilterBottomSheet(
    BuildContext context,
    MyAppLocalizations? localizations,
  ) {
    final typeFilters = localizations?.getListingTypeFilters() ?? [];
    final filterNotifier = ref.read(filterProvider.notifier);

    final sections = [
      FilterSection(
        title: localizations?.getListingFilterTitle() ?? 'Filter by Type',
        options: typeFilters.map((type) {
          final typeValue = type['value'] as String;
          return FilterOption(
            id: typeValue,
            label: type['name'] as String,
            isSelected: filterNotifier.isTypeSelected(typeValue),
          );
        }).toList(),
      ),
    ];

    FilterBottomSheet.show(
      context: context,
      title: localizations?.getListingFilterTitle() ?? 'Filter by Type',
      sections: sections,
      onApply: (selectedFilters) {
        // selectedFilters is Map<String, List<String>> where:
        // - Key: section title (e.g., "Filter by Type")
        // - Value: list of selected option IDs (e.g., ["fire", "water", "grass"])
        
        // Extract all selected type IDs from all sections
        final selectedTypeIds = <String>{};
        for (var entry in selectedFilters.entries) {
          selectedTypeIds.addAll(entry.value);
        }

        // Update filter state
        filterNotifier.setSelectedTypes(selectedTypeIds);

        // Force update of filtered list
        ref.read(filteredPokemonProvider.notifier).updateFilters();
      },
    );
  }
}