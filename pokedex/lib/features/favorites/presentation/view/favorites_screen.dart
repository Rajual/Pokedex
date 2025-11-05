import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:desing_system/templates/empty_state_template/models/empty_state_template_ui_model.dart';
import 'package:desing_system/templates/loading_template/loading_template.dart';
import 'package:desing_system/templates/loading_template/models/loading_template_ui_model.dart';
import 'package:desing_system/desing_system.dart';

import '../../../../core/common/result.dart';
import '../../domain/entities/favorites_entity.dart' ;
import '../../domain/repositories/favorites_repository.dart';
import '../presenter/favorites_presenter.dart';

/// Screen for displaying favorite Pokemon
class FavoritesScreen extends ConsumerStatefulWidget {
  const FavoritesScreen({super.key});

  @override
  ConsumerState<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends ConsumerState<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    // Watch the favorites state - will rebuild automatically when favorites change
    final favoritesState = ref.watch(favoritesNotifierProvider);
    
    if (favoritesState.isLoading) {
      return const Scaffold(
        body: LoadingTemplate(
          uiModel: LoadingTemplateUiModel(),
        ),
      );
    }

    if (favoritesState.error != null) {
      return _buildErrorContent(favoritesState.error!);
    }

    // Load full favorites data
    return FutureBuilder<Result<FavoritesData, FavoritesFailure>>(
      future: ref.read(favoritesPresenterProvider).loadFavorites(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Scaffold(
            body: LoadingTemplate(
              uiModel: LoadingTemplateUiModel(),
            ),
          );
        }

        return snapshot.data!.match(
          onSuccess: (data) => _buildFavoritesContent(data),
          onFailure: (error) => _buildErrorContent(error.toString()),
        );
      },
    );
  }

  Widget _buildFavoritesContent(FavoritesData data) {
    if (data.favorites.isEmpty) {
      return _buildEmptyState();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: data.favorites.length,
        itemBuilder: (context, index) {
          final favorite = data.favorites[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: _buildFavoriteCard(favorite),
          );
        },
      ),
    );
  }

  Widget _buildFavoriteCard(FavoritePokemon favorite) {
    // Convert domain PokemonType to design system PokemonType
    final primaryType = _convertToDesignSystemType(favorite.types.first);
    final secondaryType = favorite.types.length > 1
        ? _convertToDesignSystemType(favorite.types[1])
        : null;

    return AppCard(
      uiModel: AppCardUiModel(
        pokemonName: favorite.name,
        pokemonNumber: int.parse(favorite.number),
        primaryType: primaryType,
        secondaryType: secondaryType,
        imagePath: favorite.imageUrl,
        backgroundColor: _getBackgroundColor(primaryType),
        isFavorite: true, // Always true for favorites screen
      ),
      onFavoriteChanged: (isFavorite) async {
        if (!isFavorite) {
          final favoritesNotifier = ref.read(favoritesNotifierProvider.notifier);
          await favoritesNotifier.removeFromFavorites(favorite.id);
        }
      },
      onTap: () {
        // Navigate to detail screen
        Navigator.of(context).pushNamed('/details', arguments: favorite.id);
      },
      swipeAction: SwipeActionUiModel.delete(
        onAction: () async {
          final favoritesNotifier = ref.read(favoritesNotifierProvider.notifier);
          await favoritesNotifier.removeFromFavorites(favorite.id);
        },
      ),
    );
  }

  Widget _buildEmptyState() {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
        centerTitle: true,
      ),
      body: const EmptyStateTemplate(
        uiModel: EmptyStateTemplateUiModel(
          title: 'No favorites yet',
          description: 'Add Pokemon to your favorites by tapping the heart icon',
          imagePath: 'assets/icons/Heart.svg',
        ),
      ),
    );
  }

  Widget _buildErrorContent(String error) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Error: $error'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                ref.read(favoritesNotifierProvider.notifier).loadFavorites();
              },
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }



  // Helper method to convert domain PokemonType to design system PokemonType
  dynamic _convertToDesignSystemType(PokemonType type) {
    // Convert domain enum to design system enum by name
    switch (type) {
      case PokemonType.fire:
        return PokemonType.fire;
      case PokemonType.water:
        return PokemonType.water;
      case PokemonType.grass:
        return PokemonType.grass;
      case PokemonType.electric:
        return PokemonType.electric;
      case PokemonType.ice:
        return PokemonType.ice;
      case PokemonType.fighting:
        return PokemonType.fighting;
      case PokemonType.poison:
        return PokemonType.poison;
      case PokemonType.ground:
        return PokemonType.ground;
      case PokemonType.flying:
        return PokemonType.flying;
      case PokemonType.psychic:
        return PokemonType.psychic;
      case PokemonType.bug:
        return PokemonType.bug;
      case PokemonType.rock:
        return PokemonType.rock;
      case PokemonType.ghost:
        return PokemonType.ghost;
      case PokemonType.dragon:
        return PokemonType.dragon;
      case PokemonType.dark:
        return PokemonType.dark;
      case PokemonType.steel:
        return PokemonType.steel;
      case PokemonType.fairy:
        return PokemonType.fairy;
      case PokemonType.normal:
      return PokemonType.normal;
    }
  }

  Color _getBackgroundColor(dynamic type) {
    // Simple color mapping based on type
    switch (type) {
      case PokemonType.fire:
        return const Color(0xFFFF5722);
      case PokemonType.water:
        return const Color(0xFF2196F3);
      case PokemonType.grass:
        return const Color(0xFF4CAF50);
      case PokemonType.electric:
        return const Color(0xFFFFC107);
      default:
        return const Color(0xFF9E9E9E);
    }
  }
}