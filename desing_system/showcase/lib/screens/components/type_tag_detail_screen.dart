import 'package:flutter/material.dart';
import 'package:desing_system/desing_system.dart';

class TypeTagDetailScreen extends StatelessWidget {
  const TypeTagDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Type Tag'),
        backgroundColor: AppColors.primary,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildSectionTitle(context, 'All Pokemon Types'),
          _buildComponentCard(
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _buildTypeTag(PokemonType.normal, 'Normal'),
                _buildTypeTag(PokemonType.fire, 'Fire'),
                _buildTypeTag(PokemonType.water, 'Water'),
                _buildTypeTag(PokemonType.electric, 'Electric'),
                _buildTypeTag(PokemonType.grass, 'Grass'),
                _buildTypeTag(PokemonType.ice, 'Ice'),
                _buildTypeTag(PokemonType.fighting, 'Fighting'),
                _buildTypeTag(PokemonType.poison, 'Poison'),
                _buildTypeTag(PokemonType.ground, 'Ground'),
                _buildTypeTag(PokemonType.flying, 'Flying'),
                _buildTypeTag(PokemonType.psychic, 'Psychic'),
                _buildTypeTag(PokemonType.bug, 'Bug'),
                _buildTypeTag(PokemonType.rock, 'Rock'),
                _buildTypeTag(PokemonType.ghost, 'Ghost'),
                _buildTypeTag(PokemonType.dragon, 'Dragon'),
                _buildTypeTag(PokemonType.dark, 'Dark'),
                _buildTypeTag(PokemonType.steel, 'Steel'),
                _buildTypeTag(PokemonType.fairy, 'Fairy'),
              ],
            ),
            codeSnippet: '''
// All available Pokemon types
AppTypeTag(type: PokemonType.normal)
AppTypeTag(type: PokemonType.fire)
AppTypeTag(type: PokemonType.water)
AppTypeTag(type: PokemonType.electric)
AppTypeTag(type: PokemonType.grass)
AppTypeTag(type: PokemonType.ice)
AppTypeTag(type: PokemonType.fighting)
AppTypeTag(type: PokemonType.poison)
AppTypeTag(type: PokemonType.ground)
AppTypeTag(type: PokemonType.flying)
AppTypeTag(type: PokemonType.psychic)
AppTypeTag(type: PokemonType.bug)
AppTypeTag(type: PokemonType.rock)
AppTypeTag(type: PokemonType.ghost)
AppTypeTag(type: PokemonType.dragon)
AppTypeTag(type: PokemonType.dark)
AppTypeTag(type: PokemonType.steel)
AppTypeTag(type: PokemonType.fairy)''',
          ),

          _buildSectionTitle(context, 'Different Sizes'),
          _buildComponentCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Small Size:', style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  runSpacing: 4,
                  children: [
                    AppTypeTag(type: PokemonType.fire, size: TypeTagSize.small),
                    AppTypeTag(type: PokemonType.water, size: TypeTagSize.small),
                    AppTypeTag(type: PokemonType.grass, size: TypeTagSize.small),
                  ],
                ),
                const SizedBox(height: 16),
                const Text('Medium Size:', style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  runSpacing: 4,
                  children: [
                    AppTypeTag(type: PokemonType.fire, size: TypeTagSize.medium),
                    AppTypeTag(type: PokemonType.water, size: TypeTagSize.medium),
                    AppTypeTag(type: PokemonType.grass, size: TypeTagSize.medium),
                  ],
                ),
                const SizedBox(height: 16),
                const Text('Large Size:', style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  runSpacing: 4,
                  children: [
                    AppTypeTag(type: PokemonType.fire, size: TypeTagSize.large),
                    AppTypeTag(type: PokemonType.water, size: TypeTagSize.large),
                    AppTypeTag(type: PokemonType.grass, size: TypeTagSize.large),
                  ],
                ),
              ],
            ),
            codeSnippet: '''
// Small size
AppTypeTag(
  type: PokemonType.fire,
  size: TypeTagSize.small,
)

// Medium size
AppTypeTag(
  type: PokemonType.fire,
  size: TypeTagSize.medium,
)

// Large size
AppTypeTag(
  type: PokemonType.fire,
  size: TypeTagSize.large,
)''',
          ),

          _buildSectionTitle(context, 'Type Effectiveness Examples'),
          _buildComponentCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Fire Type Weaknesses:', style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  runSpacing: 4,
                  children: [
                    AppTypeTag(type: PokemonType.water, size: TypeTagSize.medium),
                    AppTypeTag(type: PokemonType.ground, size: TypeTagSize.medium),
                    AppTypeTag(type: PokemonType.rock, size: TypeTagSize.medium),
                  ],
                ),
                const SizedBox(height: 16),
                const Text('Water Type Strengths:', style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  runSpacing: 4,
                  children: [
                    AppTypeTag(type: PokemonType.fire, size: TypeTagSize.medium),
                    AppTypeTag(type: PokemonType.ground, size: TypeTagSize.medium),
                    AppTypeTag(type: PokemonType.rock, size: TypeTagSize.medium),
                  ],
                ),
                const SizedBox(height: 16),
                const Text('Electric Type Immunities:', style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  runSpacing: 4,
                  children: [
                    AppTypeTag(type: PokemonType.ground, size: TypeTagSize.medium),
                  ],
                ),
              ],
            ),
            codeSnippet: '''
// Use type tags to show type matchups
// Fire is weak to Water, Ground, Rock
AppTypeTag(type: PokemonType.water)
AppTypeTag(type: PokemonType.ground)
AppTypeTag(type: PokemonType.rock)

// Water is strong against Fire, Ground, Rock
AppTypeTag(type: PokemonType.fire)
AppTypeTag(type: PokemonType.ground)
AppTypeTag(type: PokemonType.rock)

// Electric is immune to Ground
AppTypeTag(type: PokemonType.ground)''',
          ),

          _buildSectionTitle(context, 'Dual Types'),
          _buildComponentCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Common Dual Types:', style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                _buildDualTypeExample('Charizard', PokemonType.fire, PokemonType.flying),
                const SizedBox(height: 8),
                _buildDualTypeExample('Venusaur', PokemonType.grass, PokemonType.poison),
                const SizedBox(height: 8),
                _buildDualTypeExample('Blastoise', PokemonType.water, null),
                const SizedBox(height: 8),
                _buildDualTypeExample('Pikachu', PokemonType.electric, null),
              ],
            ),
            codeSnippet: '''
// Dual types in Pokemon
Row(
  children: [
    AppTypeTag(type: PokemonType.fire),
    SizedBox(width: 4),
    AppTypeTag(type: PokemonType.flying),
  ],
)

// Single types
AppTypeTag(type: PokemonType.water)

// Note: PokemonType.none can be used as secondary type
// when Pokemon has only one type''',
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
                    'AppTypeTag Component Notes:',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    '• Supports all 18 Pokemon types\n'
                    '• Automatic color coding for each type\n'
                    '• Three sizes: small, medium, large\n'
                    '• Consistent typography and spacing\n'
                    '• Perfect for type matchups and Pokemon info\n'
                    '• Can be used in lists, cards, or standalone\n'
                    '• Includes PokemonType.none for single-type Pokemon',
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

  Widget _buildTypeTag(PokemonType type, String label) {
    return Column(
      children: [
        AppTypeTag(type: type, size: TypeTagSize.medium),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 10)),
      ],
    );
  }

  Widget _buildDualTypeExample(String pokemonName, PokemonType primary, PokemonType? secondary) {
    return Row(
      children: [
        Text('$pokemonName:', style: const TextStyle(fontSize: 14)),
        const SizedBox(width: 8),
        AppTypeTag(type: primary, size: TypeTagSize.small),
        if (secondary != null) ...[
          const SizedBox(width: 4),
          AppTypeTag(type: secondary, size: TypeTagSize.small),
        ],
      ],
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