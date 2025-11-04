import 'package:flutter/material.dart';
import 'package:desing_system/desing_system.dart';

class CardDetailScreen extends StatefulWidget {
  const CardDetailScreen({super.key});

  @override
  State<CardDetailScreen> createState() => _CardDetailScreenState();
}

class _CardDetailScreenState extends State<CardDetailScreen> {
  bool _isCardFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Card'),
        backgroundColor: AppColors.primary,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildSectionTitle(context, 'Basic Card'),
          _buildComponentCard(
            child: AppCard.fromProperties(
              pokemonName: 'Pikachu',
              pokemonNumber: 25,
              primaryType: PokemonType.electric,
              secondaryType: PokemonType.normal,
              imagePath: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/25.png',
              backgroundColor: const Color(0xFFF7D02C),
              isFavorite: _isCardFavorite,
              onFavoriteChanged: (value) => setState(() => _isCardFavorite = value),
              size: CardSize.medium,
              style: CardStyle.elevated,
            ),
            codeSnippet: '''
AppCard(
  pokemonName: 'Pikachu',
  pokemonNumber: 25,
  primaryType: PokemonType.electric,
  secondaryType: PokemonType.normal,
  imagePath: 'assets/pokemon/pikachu.png',
  backgroundColor: Color(0xFFF7D02C),
  isFavorite: isFavorite,
  onFavoriteChanged: (value) => setState(() => isFavorite = value),
  size: CardSize.medium,
  style: CardStyle.elevated,
)''',
          ),

          _buildSectionTitle(context, 'Different Sizes'),
          _buildComponentCard(
            child: Row(
              children: [
                Expanded(
                  child: AppCard.fromProperties(
                    pokemonName: 'Charmander',
                    pokemonNumber: 4,
                    primaryType: PokemonType.fire,
                    imagePath: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/4.png',
                    backgroundColor: const Color(0xFFEA5D60),
                    isFavorite: false,
                    onFavoriteChanged: (value) {},
                    size: CardSize.small,
                    style: CardStyle.elevated,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: AppCard.fromProperties(
                    pokemonName: 'Squirtle',
                    pokemonNumber: 7,
                    primaryType: PokemonType.water,
                    imagePath: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/7.png',
                    backgroundColor: const Color(0xFF6390F0),
                    isFavorite: true,
                    onFavoriteChanged: (value) {},
                    size: CardSize.small,
                    style: CardStyle.elevated,
                  ),
                ),
              ],
            ),
            codeSnippet: '''
// Small size
AppCard(
  // ... other properties
  size: CardSize.small,
)

// Medium size (default)
AppCard(
  // ... other properties
  size: CardSize.medium,
)

// Large size
AppCard(
  // ... other properties
  size: CardSize.large,
)''',
          ),

          _buildSectionTitle(context, 'Card Styles'),
          _buildComponentCard(
            child: Column(
              children: [
                AppCard.fromProperties(
                  pokemonName: 'Bulbasaur',
                  pokemonNumber: 1,
                  primaryType: PokemonType.grass,
                  secondaryType: PokemonType.poison,
                  imagePath: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png',
                  backgroundColor: const Color(0xFF78C850),
                  isFavorite: true,
                  onFavoriteChanged: (value) {},
                  size: CardSize.medium,
                  style: CardStyle.elevated,
                ),
                const SizedBox(height: 16),
                AppCard.fromProperties(
                  pokemonName: 'Charizard',
                  pokemonNumber: 6,
                  primaryType: PokemonType.fire,
                  secondaryType: PokemonType.flying,
                  imagePath: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/6.png',
                  backgroundColor: const Color(0xFFEA5D60),
                  isFavorite: false,
                  onFavoriteChanged: (value) {},
                  size: CardSize.medium,
                  style: CardStyle.outlined,
                ),
              ],
            ),
            codeSnippet: '''
// Elevated style (default)
AppCard(
  // ... other properties
  style: CardStyle.elevated,
)

// Outlined style
AppCard(
  // ... other properties
  style: CardStyle.outlined,
)''',
          ),

          _buildSectionTitle(context, 'Different Elevations'),
          _buildComponentCard(
            child: Column(
              children: [
                AppCard.fromProperties(
                  pokemonName: 'Mew',
                  pokemonNumber: 151,
                  primaryType: PokemonType.psychic,
                  imagePath: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/151.png',
                  backgroundColor: const Color(0xFFF85888),
                  isFavorite: false,
                  onFavoriteChanged: (value) {},
                  size: CardSize.medium,
                  style: CardStyle.elevated,
                  elevation: CardElevation.low,
                ),
                const SizedBox(height: 16),
                AppCard.fromProperties(
                  pokemonName: 'Rayquaza',
                  pokemonNumber: 384,
                  primaryType: PokemonType.dragon,
                  secondaryType: PokemonType.flying,
                  imagePath: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/384.png',
                  backgroundColor: const Color(0xFF7038F8),
                  isFavorite: true,
                  onFavoriteChanged: (value) {},
                  size: CardSize.medium,
                  style: CardStyle.elevated,
                  elevation: CardElevation.high,
                ),
              ],
            ),
            codeSnippet: '''
// Low elevation
AppCard(
  // ... other properties
  elevation: CardElevation.low,
)

// Medium elevation (default)
AppCard(
  // ... other properties
  elevation: CardElevation.medium,
)

// High elevation
AppCard(
  // ... other properties
  elevation: CardElevation.high,
)''',
          ),

          _buildSectionTitle(context, 'Without Pokemon Number'),
          _buildComponentCard(
            child: AppCard.fromProperties(
              pokemonName: 'Eevee',
              pokemonNumber: 133,
              primaryType: PokemonType.normal,
              imagePath: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/133.png',
              backgroundColor: const Color(0xFFA8A878),
              isFavorite: false,
              onFavoriteChanged: (value) {},
              size: CardSize.medium,
              style: CardStyle.elevated,
              showPokemonNumber: false,
            ),
            codeSnippet: '''
AppCard(
  // ... other properties
  showPokemonNumber: false, // Hide the Pokédex number
)''',
          ),

          _buildSectionTitle(context, 'Disabled State'),
          _buildComponentCard(
            child: AppCard.fromProperties(
              pokemonName: 'Jigglypuff',
              pokemonNumber: 39,
              primaryType: PokemonType.normal,
              secondaryType: PokemonType.fairy,
              imagePath: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/39.png',
              backgroundColor: const Color(0xFFF85888),
              isFavorite: false,
              onFavoriteChanged: (value) {},
              size: CardSize.medium,
              style: CardStyle.elevated,
              isEnabled: false,
            ),
            codeSnippet: '''
AppCard(
  // ... other properties
  isEnabled: false, // Disables interactions
)''',
          ),

          _buildSectionTitle(context, 'Usage Notes'),
          Card(
            margin: const EdgeInsets.only(bottom: 16.0),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'AppCard Component Notes:',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    '• Displays Pokemon with image, name, number, and types\n'
                    '• Supports favorite toggle functionality\n'
                    '• Three sizes: small, medium, large\n'
                    '• Two styles: elevated and outlined\n'
                    '• Three elevation levels: low, medium, high\n'
                    '• Optional Pokédex number display\n'
                    '• Can be disabled\n'
                    '• Supports tap gestures',
                    style: TextStyle(height: 1.5),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
      ),
    );
  }

  Widget _buildComponentCard({required Widget child, required String codeSnippet}) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            child,
            const SizedBox(height: 16),
            ExpansionTile(
              title: const Text('View Code'),
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Text(
                    codeSnippet,
                    style: const TextStyle(
                      fontFamily: 'monospace',
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}