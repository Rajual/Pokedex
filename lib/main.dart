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
  bool isFavorite = false;

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

            // AppFavoriteTag Component
            const Text(
              'AppFavoriteTag Component',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'Styles & Sizes',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    const Text('Filled', style: TextStyle(fontSize: 12)),
                    const SizedBox(height: 8),
                    AppFavoriteTag(
                      isFavorite: isFavorite,
                      onFavoriteChanged: (value) {
                        setState(() {
                          isFavorite = value;
                        });
                      },
                      size: FavoriteTagSize.medium,
                      style: FavoriteTagStyle.filled,
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Text('Outlined', style: TextStyle(fontSize: 12)),
                    const SizedBox(height: 8),
                    AppFavoriteTag(
                      isFavorite: isFavorite,
                      onFavoriteChanged: (value) {
                        setState(() {
                          isFavorite = value;
                        });
                      },
                      size: FavoriteTagSize.medium,
                      style: FavoriteTagStyle.outlined,
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Text('Floating', style: TextStyle(fontSize: 12)),
                    const SizedBox(height: 8),
                    AppFavoriteTag(
                      isFavorite: isFavorite,
                      onFavoriteChanged: (value) {
                        setState(() {
                          isFavorite = value;
                        });
                      },
                      size: FavoriteTagSize.medium,
                      style: FavoriteTagStyle.floating,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              'All Sizes',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    const Text('Small', style: TextStyle(fontSize: 12)),
                    const SizedBox(height: 8),
                    AppFavoriteTag(
                      isFavorite: isFavorite,
                      onFavoriteChanged: (value) {
                        setState(() {
                          isFavorite = value;
                        });
                      },
                      size: FavoriteTagSize.small,
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Text('Medium', style: TextStyle(fontSize: 12)),
                    const SizedBox(height: 8),
                    AppFavoriteTag(
                      isFavorite: isFavorite,
                      onFavoriteChanged: (value) {
                        setState(() {
                          isFavorite = value;
                        });
                      },
                      size: FavoriteTagSize.medium,
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Text('Large', style: TextStyle(fontSize: 12)),
                    const SizedBox(height: 8),
                    AppFavoriteTag(
                      isFavorite: isFavorite,
                      onFavoriteChanged: (value) {
                        setState(() {
                          isFavorite = value;
                        });
                      },
                      size: FavoriteTagSize.large,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 32),

            // Pokémon Gallery with AppImage
            const Text(
              'Pokémon Gallery',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'Small Size',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  AppImage(
                    'assets/ilustration/PokemonCharizard.png',
                    size: AppImageSize.small,
                    showShadow: true,
                  ),
                  const SizedBox(width: 8),
                  AppImage(
                    'assets/ilustration/PokemonPikachu.png',
                    size: AppImageSize.small,
                    showShadow: true,
                  ),
                  const SizedBox(width: 8),
                  AppImage(
                    'assets/ilustration/PokemonSquirtle.png',
                    size: AppImageSize.small,
                    showShadow: true,
                  ),
                  const SizedBox(width: 8),
                  AppImage(
                    'assets/ilustration/PokemonVenusaur.png',
                    size: AppImageSize.small,
                    showShadow: true,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Medium Size (Default)',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            GridView.count(
              crossAxisCount: 3,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              children: [
                AppImage(
                  'assets/ilustration/PokemonCharizard.png',
                  size: AppImageSize.medium,
                  showShadow: true,
                ),
                AppImage(
                  'assets/ilustration/PokemonPikachu.png',
                  size: AppImageSize.medium,
                  showShadow: true,
                ),
                AppImage(
                  'assets/ilustration/PokemonSquirtle.png',
                  size: AppImageSize.medium,
                  showShadow: true,
                ),
                AppImage(
                  'assets/ilustration/PokemonVenusaur.png',
                  size: AppImageSize.medium,
                  showShadow: true,
                ),
                AppImage(
                  'assets/ilustration/PokemonBlastoise.png',
                  size: AppImageSize.medium,
                  showShadow: true,
                ),
                AppImage(
                  'assets/ilustration/PokemonMew.png',
                  size: AppImageSize.medium,
                  showShadow: true,
                ),
                AppImage(
                  'assets/ilustration/PokemonLucario.png',
                  size: AppImageSize.medium,
                  showShadow: true,
                ),
                AppImage(
                  'assets/ilustration/PokemonRayquaza.png',
                  size: AppImageSize.medium,
                  showShadow: true,
                ),
                AppImage(
                  'assets/ilustration/PokemonZoroark.png',
                  size: AppImageSize.medium,
                  showShadow: true,
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              'Large Size',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  AppImage(
                    'assets/ilustration/PokemonCharizard.png',
                    size: AppImageSize.large,
                    borderRadius: 12,
                  ),
                  const SizedBox(width: 8),
                  AppImage(
                    'assets/ilustration/PokemonPikachu.png',
                    size: AppImageSize.large,
                    borderRadius: 12,
                  ),
                  const SizedBox(width: 8),
                  AppImage(
                    'assets/ilustration/PokemonSquirtle.png',
                    size: AppImageSize.large,
                    borderRadius: 12,
                  ),
                ],
              ),
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
