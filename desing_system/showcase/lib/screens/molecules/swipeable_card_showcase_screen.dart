import 'package:desing_system/atoms/app_button/app_button.dart';
import 'package:desing_system/atoms/app_button/models/app_button_ui_model.dart';
import 'package:desing_system/atoms/app_button/utils/enum.dart';
import 'package:desing_system/molecules/app_card/app_card.dart';
import 'package:desing_system/molecules/app_card/models/app_card_ui_model.dart';
import 'package:desing_system/molecules/app_card/models/swipe_action_ui_model.dart';
import 'package:desing_system/molecules/app_type_tag/app_type_tag.dart';
import 'package:flutter/material.dart';

/// Pantalla que demuestra el uso de las cards con swipe actions
class SwipeableCardShowcaseScreen extends StatefulWidget {
  const SwipeableCardShowcaseScreen({super.key});

  @override
  State<SwipeableCardShowcaseScreen> createState() => _SwipeableCardShowcaseScreenState();
}

class _SwipeableCardShowcaseScreenState extends State<SwipeableCardShowcaseScreen> {
  final Map<String, bool> _favorites = {
    'bulbasaur': true,
    'ivysaur': false,
    'charmander': true,
    'squirtle': false,
  };

  final Map<String, bool> _deleted = {
    'bulbasaur': false,
    'ivysaur': false,
    'charmander': false,
    'squirtle': false,
  };

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Swipeable Card Showcase'),
        backgroundColor: const Color(0xFF1E88E5),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Descripción
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Swipeable Cards',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    '👈 Desliza las cards a la izquierda para revelar acciones.\n'
                    'Puedes configurar diferentes tipos de acciones: eliminar, archivar, favorito, compartir o personalizada.',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Card con acción de eliminar (delete)
            _buildSectionTitle('Delete Action'),
            const SizedBox(height: 12),
            if (!_deleted['bulbasaur']!) ...[
              AppCard(
                uiModel: AppCardUiModel(
                  pokemonName: 'Bulbasaur',
                  pokemonNumber: 1,
                  primaryType: PokemonType.grass,
                  secondaryType: PokemonType.poison,
                  imagePath: 'assets/ilustration/PokemonBulbasaur.png',
                  backgroundColor: const Color(0xFF78C850),
                  isFavorite: _favorites['bulbasaur']!,
                  size: CardSize.medium,
                ),
                onFavoriteChanged: (value) {
                  setState(() => _favorites['bulbasaur'] = value);
                },
                onTap: () => _showSnackBar('Bulbasaur card tapped'),
                swipeAction: SwipeActionUiModel.delete(
                  label: 'Eliminar',
                  onAction: () {
                    setState(() => _deleted['bulbasaur'] = true);
                    _showSnackBar('Bulbasaur eliminado');
                  },
                ),
              ),
            ] else ...[
              _buildDeletedPlaceholder('Bulbasaur fue eliminado', () {
                setState(() => _deleted['bulbasaur'] = false);
              }),
            ],
            const SizedBox(height: 24),

            // Card con acción de archivar (archive)
            _buildSectionTitle('Archive Action'),
            const SizedBox(height: 12),
            if (!_deleted['ivysaur']!) ...[
              AppCard(
                uiModel: AppCardUiModel(
                  pokemonName: 'Ivysaur',
                  pokemonNumber: 2,
                  primaryType: PokemonType.grass,
                  secondaryType: PokemonType.poison,
                  imagePath: 'assets/ilustration/PokemonIvysaur.png',
                  backgroundColor: const Color(0xFF78C850),
                  isFavorite: _favorites['ivysaur']!,
                  size: CardSize.medium,
                ),
                onFavoriteChanged: (value) {
                  setState(() => _favorites['ivysaur'] = value);
                },
                onTap: () => _showSnackBar('Ivysaur card tapped'),
                swipeAction: SwipeActionUiModel.archive(
                  label: 'Archivar',
                  onAction: () {
                    setState(() => _deleted['ivysaur'] = true);
                    _showSnackBar('Ivysaur archivado');
                  },
                ),
              ),
            ] else ...[
              _buildDeletedPlaceholder('Ivysaur fue archivado', () {
                setState(() => _deleted['ivysaur'] = false);
              }),
            ],
            const SizedBox(height: 24),

            // Card con acción de favorito (favorite)
            _buildSectionTitle('Favorite Action'),
            const SizedBox(height: 12),
            AppCard(
              uiModel: AppCardUiModel(
                pokemonName: 'Charmander',
                pokemonNumber: 4,
                primaryType: PokemonType.fire,
                imagePath: 'assets/ilustration/PokemonCharmander.png',
                backgroundColor: const Color(0xFFF08030),
                isFavorite: _favorites['charmander']!,
                size: CardSize.medium,
              ),
              onFavoriteChanged: (value) {
                setState(() => _favorites['charmander'] = value);
              },
              onTap: () => _showSnackBar('Charmander card tapped'),
              swipeAction: SwipeActionUiModel.favorite(
                label: 'Favorito',
                onAction: () {
                  setState(() => _favorites['charmander'] = !_favorites['charmander']!);
                  _showSnackBar(
                    _favorites['charmander']!
                        ? 'Charmander agregado a favoritos'
                        : 'Charmander removido de favoritos',
                  );
                },
              ),
            ),
            const SizedBox(height: 24),

            // Card con acción personalizada (custom)
            _buildSectionTitle('Custom Action'),
            const SizedBox(height: 12),
            AppCard(
              uiModel: AppCardUiModel(
                pokemonName: 'Squirtle',
                pokemonNumber: 7,
                primaryType: PokemonType.water,
                imagePath: 'assets/ilustration/PokemonSquirtle.png',
                backgroundColor: const Color(0xFF6890F0),
                isFavorite: _favorites['squirtle']!,
                size: CardSize.medium,
              ),
              onFavoriteChanged: (value) {
                setState(() => _favorites['squirtle'] = value);
              },
              onTap: () => _showSnackBar('Squirtle card tapped'),
              swipeAction: SwipeActionUiModel.custom(
                backgroundColor: const Color(0xFF9C27B0),
                icon: Icons.info_outline,
                label: 'Info',
                onAction: () {
                  _showSnackBar('Mostrando información de Squirtle');
                },
              ),
            ),
            const SizedBox(height: 24),

            // Card sin swipe action para comparación
            _buildSectionTitle('Card Without Swipe (Normal)'),
            const SizedBox(height: 12),
            AppCard(
              uiModel: AppCardUiModel(
                pokemonName: 'Pikachu',
                pokemonNumber: 25,
                primaryType: PokemonType.electric,
                imagePath: 'assets/ilustration/PokemonPikachu.png',
                backgroundColor: const Color(0xFFF8D030),
                isFavorite: true,
                size: CardSize.medium,
              ),
              onFavoriteChanged: (value) {},
              onTap: () => _showSnackBar('Pikachu card tapped'),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildDeletedPlaceholder(String message, VoidCallback onUndo) {
    return Container(
      width: 140,
      height: 200,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade400, width: 2),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.check_circle_outline, size: 40, color: Colors.grey.shade600),
          const SizedBox(height: 12),
          Text(
            message,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey.shade700,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 12),
          AppButton(
            uiModel: AppButtonUiModel(
              label: 'Deshacer',
              size: ButtonSize.small,
              type: ButtonType.secondary,
            ),
            onPressed: onUndo,
          ),
        ],
      ),
    );
  }
}
