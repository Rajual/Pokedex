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

            // Type Elements with AppTypeTag
            const Text(
              'Pokémon Type Elements',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'Small Size',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                AppTypeTag(type: PokemonType.fire, size: TypeTagSize.small),
                AppTypeTag(type: PokemonType.water, size: TypeTagSize.small),
                AppTypeTag(type: PokemonType.grass, size: TypeTagSize.small),
                AppTypeTag(type: PokemonType.electric, size: TypeTagSize.small),
                AppTypeTag(type: PokemonType.ice, size: TypeTagSize.small),
                AppTypeTag(type: PokemonType.flying, size: TypeTagSize.small),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              'Medium Size (Default)',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                AppTypeTag(type: PokemonType.fire),
                AppTypeTag(type: PokemonType.water),
                AppTypeTag(type: PokemonType.grass),
                AppTypeTag(type: PokemonType.electric),
                AppTypeTag(type: PokemonType.dragon),
                AppTypeTag(type: PokemonType.psychic),
                AppTypeTag(type: PokemonType.fighting),
                AppTypeTag(type: PokemonType.dark),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              'Large Size',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                AppTypeTag(type: PokemonType.bug, size: TypeTagSize.large),
                AppTypeTag(type: PokemonType.rock, size: TypeTagSize.large),
                AppTypeTag(type: PokemonType.ground, size: TypeTagSize.large),
                AppTypeTag(type: PokemonType.poison, size: TypeTagSize.large),
                AppTypeTag(type: PokemonType.ghost, size: TypeTagSize.large),
                AppTypeTag(type: PokemonType.steel, size: TypeTagSize.large),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              'Full Width',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            AppTypeTag(type: PokemonType.fairy, fullWidth: true),
            const SizedBox(height: 8),
            AppTypeTag(type: PokemonType.normal, fullWidth: true),
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
