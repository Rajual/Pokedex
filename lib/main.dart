import 'package:flutter/material.dart';
import 'package:pokedex/core/design_system/exports.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokédex',
      theme: AppTheme.lightTheme,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokédex - Design System Demo'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // AppButton Examples
            const Text(
              'AppButton Component',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                AppButton(
                  label: 'Primary',
                  onPressed: () {},
                ),
                AppButton(
                  label: 'Secondary',
                  type: ButtonType.secondary,
                  onPressed: () {},
                ),
                AppButton(
                  label: 'Tertiary',
                  type: ButtonType.tertiary,
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                AppButton(
                  label: 'Loading',
                  isLoading: true,
                  onPressed: () {},
                ),
                AppButton(
                  label: 'Disabled',
                  isEnabled: false,
                  onPressed: () {},
                ),
                AppButton(
                  label: 'With Icon',
                  leadingIcon: Icons.favorite,
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(height: 32),

            // Pokémon Gallery with PNG images
            const Text(
              'Pokémon Gallery',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            GridView.count(
              crossAxisCount: 3,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              childAspectRatio: 0.8,
              children: [
                _PokemonCard('assets/ilustration/PokemonCharizard.png', 'Charizard'),
                _PokemonCard('assets/ilustration/PokemonPikachu.png', 'Pikachu'),
                _PokemonCard('assets/ilustration/PokemonSquirtle.png', 'Squirtle'),
                _PokemonCard('assets/ilustration/PokemonVenusaur.png', 'Venusaur'),
                _PokemonCard('assets/ilustration/PokemonBlastoise.png', 'Blastoise'),
                _PokemonCard('assets/ilustration/PokemonMew.png', 'Mew'),
                _PokemonCard('assets/ilustration/PokemonLucario.png', 'Lucario'),
                _PokemonCard('assets/ilustration/PokemonRayquaza.png', 'Rayquaza'),
                _PokemonCard('assets/ilustration/PokemonZoroark.png', 'Zoroark'),
              ],
            ),
            const SizedBox(height: 32),

            // Type Elements
            const Text(
              'Pokémon Type Elements',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _TypeBadge('assets/elements/Typefire.svg', 'Fire'),
                _TypeBadge('assets/elements/Typewater.svg', 'Water'),
                _TypeBadge('assets/elements/Typegrass.svg', 'Grass'),
                _TypeBadge('assets/elements/Typeelectric.svg', 'Electric'),
                _TypeBadge('assets/elements/Typeground.svg', 'Ground'),
                _TypeBadge('assets/elements/Typerock.svg', 'Rock'),
                _TypeBadge('assets/elements/Typedragon.svg', 'Dragon'),
                _TypeBadge('assets/elements/Typedark.svg', 'Dark'),
                _TypeBadge('assets/elements/Typefairy.svg', 'Fairy'),
                _TypeBadge('assets/elements/Typepsychic.svg', 'Psychic'),
                _TypeBadge('assets/elements/Typebug.svg', 'Bug'),
                _TypeBadge('assets/elements/Typeflying.svg', 'Flying'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _PokemonCard extends StatelessWidget {
  final String assetPath;
  final String name;

  const _PokemonCard(this.assetPath, this.name);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            assetPath,
            width: 120,
            height: 120,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          name,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}

class _TypeBadge extends StatelessWidget {
  final String assetPath;
  final String label;

  const _TypeBadge(this.assetPath, this.label);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppSvg(
            assetPath,
            size: SvgSize.small,
          ),
          const SizedBox(width: 8),
          Text(
            label,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
