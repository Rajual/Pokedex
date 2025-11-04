import 'package:desing_system/desing_system.dart';
import 'package:flutter/material.dart';

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
                AppButton.fromProperties(
                  label: 'Primary',
                  onPressed: () {},
                ),
                AppButton.fromProperties(
                  label: 'Secondary',
                  type: ButtonType.secondary,
                  onPressed: () {},
                ),
                AppButton.fromProperties(
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
                AppButton.fromProperties(
                  label: 'Loading',
                  isLoading: true,
                  onPressed: () {},
                ),
                AppButton.fromProperties(
                  label: 'Disabled',
                  isEnabled: false,
                  onPressed: () {},
                ),
                AppButton.fromProperties(
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
                    AppFavoriteTag.fromProperties(
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
                    AppFavoriteTag.fromProperties(
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
                    AppFavoriteTag.fromProperties(
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
                    AppFavoriteTag.fromProperties(
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
                    AppFavoriteTag.fromProperties(
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
                    AppFavoriteTag.fromProperties(
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
                  AppImage.fromProperties(
                    'assets/ilustration/PokemonCharizard.png',
                    size: AppImageSize.small,
                    showShadow: true,
                  ),
                  const SizedBox(width: 8),
                  AppImage.fromProperties(
                    'assets/ilustration/PokemonPikachu.png',
                    size: AppImageSize.small,
                    showShadow: true,
                  ),
                  const SizedBox(width: 8),
                  AppImage.fromProperties(
                    'assets/ilustration/PokemonSquirtle.png',
                    size: AppImageSize.small,
                    showShadow: true,
                  ),
                  const SizedBox(width: 8),
                  AppImage.fromProperties(
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
                AppImage.fromProperties(
                  'assets/ilustration/PokemonCharizard.png',
                  size: AppImageSize.medium,
                  showShadow: true,
                ),
                AppImage.fromProperties(
                  'assets/ilustration/PokemonPikachu.png',
                  size: AppImageSize.medium,
                  showShadow: true,
                ),
                AppImage.fromProperties(
                  'assets/ilustration/PokemonSquirtle.png',
                  size: AppImageSize.medium,
                  showShadow: true,
                ),
                AppImage.fromProperties(
                  'assets/ilustration/PokemonVenusaur.png',
                  size: AppImageSize.medium,
                  showShadow: true,
                ),
                AppImage.fromProperties(
                  'assets/ilustration/PokemonBlastoise.png',
                  size: AppImageSize.medium,
                  showShadow: true,
                ),
                AppImage.fromProperties(
                  'assets/ilustration/PokemonMew.png',
                  size: AppImageSize.medium,
                  showShadow: true,
                ),
                AppImage.fromProperties(
                  'assets/ilustration/PokemonLucario.png',
                  size: AppImageSize.medium,
                  showShadow: true,
                ),
                AppImage.fromProperties(
                  'assets/ilustration/PokemonRayquaza.png',
                  size: AppImageSize.medium,
                  showShadow: true,
                ),
                AppImage.fromProperties(
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
                  AppImage.fromProperties(
                    'assets/ilustration/PokemonCharizard.png',
                    size: AppImageSize.large,
                    borderRadius: 12,
                  ),
                  const SizedBox(width: 8),
                  AppImage.fromProperties(
                    'assets/ilustration/PokemonPikachu.png',
                    size: AppImageSize.large,
                    borderRadius: 12,
                  ),
                  const SizedBox(width: 8),
                  AppImage.fromProperties(
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
                AppTypeTag.fromUiModel(
                  uiModel: AppTypeTagUiModel(
                    type: PokemonType.fire,
                    size: TypeTagSize.small,
                  ),
                ),
                AppTypeTag.fromUiModel(
                  uiModel: AppTypeTagUiModel(
                    type: PokemonType.water,
                    size: TypeTagSize.small,
                  ),
                ),
                AppTypeTag.fromUiModel(
                  uiModel: AppTypeTagUiModel(
                    type: PokemonType.grass,
                    size: TypeTagSize.small,
                  ),
                ),
                AppTypeTag.fromUiModel(
                  uiModel: AppTypeTagUiModel(
                    type: PokemonType.electric,
                    size: TypeTagSize.small,
                  ),
                ),
                AppTypeTag.fromUiModel(
                  uiModel: AppTypeTagUiModel(
                    type: PokemonType.ice,
                    size: TypeTagSize.small,
                  ),
                ),
                AppTypeTag.fromUiModel(
                  uiModel: AppTypeTagUiModel(
                    type: PokemonType.flying,
                    size: TypeTagSize.small,
                  ),
                ),
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
                AppTypeTag.fromUiModel(
                  uiModel: AppTypeTagUiModel(
                    type: PokemonType.fire,
                  ),
                ),
                AppTypeTag.fromUiModel(
                  uiModel: AppTypeTagUiModel(
                    type: PokemonType.water,
                  ),
                ),
                AppTypeTag.fromUiModel(
                  uiModel: AppTypeTagUiModel(
                    type: PokemonType.grass,
                  ),
                ),
                AppTypeTag.fromUiModel(
                  uiModel: AppTypeTagUiModel(
                    type: PokemonType.electric,
                  ),
                ),
                AppTypeTag.fromUiModel(
                  uiModel: AppTypeTagUiModel(
                    type: PokemonType.dragon,
                  ),
                ),
                AppTypeTag.fromUiModel(
                  uiModel: AppTypeTagUiModel(
                    type: PokemonType.psychic,
                  ),
                ),
                AppTypeTag.fromUiModel(
                  uiModel: AppTypeTagUiModel(
                    type: PokemonType.fighting,
                  ),
                ),
                AppTypeTag.fromUiModel(
                  uiModel: AppTypeTagUiModel(
                    type: PokemonType.dark,
                  ),
                ),
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
                AppTypeTag.fromUiModel(
                  uiModel: AppTypeTagUiModel(
                    type: PokemonType.bug,
                    size: TypeTagSize.large,
                  ),
                ),
                AppTypeTag.fromUiModel(
                  uiModel: AppTypeTagUiModel(
                    type: PokemonType.rock,
                    size: TypeTagSize.large,
                  ),
                ),
                AppTypeTag.fromUiModel(
                  uiModel: AppTypeTagUiModel(
                    type: PokemonType.ground,
                    size: TypeTagSize.large,
                  ),
                ),
                AppTypeTag.fromUiModel(
                  uiModel: AppTypeTagUiModel(
                    type: PokemonType.poison,
                    size: TypeTagSize.large,
                  ),
                ),
                AppTypeTag.fromUiModel(
                  uiModel: AppTypeTagUiModel(
                    type: PokemonType.ghost,
                    size: TypeTagSize.large,
                  ),
                ),
                AppTypeTag.fromUiModel(
                  uiModel: AppTypeTagUiModel(
                    type: PokemonType.steel,
                    size: TypeTagSize.large,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              'Full Width',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            AppTypeTag.fromUiModel(
              uiModel: AppTypeTagUiModel(
                type: PokemonType.fairy,
                fullWidth: true,
              ),
            ),
            const SizedBox(height: 8),
            AppTypeTag.fromUiModel(
              uiModel: AppTypeTagUiModel(
                type: PokemonType.normal,
                fullWidth: true,
              ),
            ),
            const SizedBox(height: 32),

            // AppCard Component
            const Text(
              'AppCard Component',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'Different Sizes',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  AppCard.fromProperties(
                    pokemonName: 'Bulbasaur',
                    pokemonNumber: 1,
                    primaryType: PokemonType.grass,
                    secondaryType: PokemonType.poison,
                    imagePath: 'assets/ilustration/PokemonBulbasaur.png',
                    backgroundColor: const Color(0xFF78C850),
                    isFavorite: false,
                    onFavoriteChanged: (value) {
                      setState(() => isFavorite = value);
                    },
                    size: CardSize.small,
                    style: CardStyle.elevated,
                  ),
                  const SizedBox(width: 8),
                  AppCard.fromProperties(
                    pokemonName: 'Bulbasaur',
                    pokemonNumber: 1,
                    primaryType: PokemonType.grass,
                    secondaryType: PokemonType.poison,
                    imagePath: 'assets/ilustration/PokemonBulbasaur.png',
                    backgroundColor: const Color(0xFF78C850),
                    isFavorite: isFavorite,
                    onFavoriteChanged: (value) {
                      setState(() => isFavorite = value);
                    },
                    size: CardSize.medium,
                    style: CardStyle.elevated,
                  ),
                  const SizedBox(width: 8),
                  AppCard.fromProperties(
                    pokemonName: 'Bulbasaur',
                    pokemonNumber: 1,
                    primaryType: PokemonType.grass,
                    secondaryType: PokemonType.poison,
                    imagePath: 'assets/ilustration/PokemonBulbasaur.png',
                    backgroundColor: const Color(0xFF78C850),
                    isFavorite: false,
                    onFavoriteChanged: (value) {
                      setState(() => isFavorite = value);
                    },
                    size: CardSize.large,
                    style: CardStyle.elevated,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Different Types',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  AppCard.fromProperties(
                    pokemonName: 'Charmeleon',
                    pokemonNumber: 5,
                    primaryType: PokemonType.fire,
                    imagePath: 'assets/ilustration/PokemonCharmeleon.png',
                    backgroundColor: const Color(0xFFFD7D24),
                    isFavorite: false,
                    onFavoriteChanged: (_) {},
                    size: CardSize.medium,
                    style: CardStyle.elevated,
                  ),
                  const SizedBox(width: 8),
                  AppCard.fromProperties(
                    pokemonName: 'Squirtle',
                    pokemonNumber: 7,
                    primaryType: PokemonType.water,
                    imagePath: 'assets/ilustration/PokemonSquirtle.png',
                    backgroundColor: const Color(0xFF6B9BD1),
                    isFavorite: true,
                    onFavoriteChanged: (_) {},
                    size: CardSize.medium,
                    style: CardStyle.elevated,
                  ),
                  const SizedBox(width: 8),
                  AppCard.fromProperties(
                    pokemonName: 'Pikachu',
                    pokemonNumber: 25,
                    primaryType: PokemonType.electric,
                    imagePath: 'assets/ilustration/PokemonPikachu.png',
                    backgroundColor: const Color(0xFFF9D030),
                    isFavorite: false,
                    onFavoriteChanged: (_) {},
                    size: CardSize.medium,
                    style: CardStyle.elevated,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Different Styles',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  AppCard.fromProperties(
                    pokemonName: 'Bulbasaur',
                    pokemonNumber: 1,
                    primaryType: PokemonType.grass,
                    imagePath: 'assets/ilustration/PokemonBulbasaur.png',
                    backgroundColor: const Color(0xFF78C850),
                    isFavorite: false,
                    onFavoriteChanged: (_) {},
                    size: CardSize.medium,
                    style: CardStyle.elevated,
                  ),
                  const SizedBox(width: 8),
                  AppCard.fromProperties(
                    pokemonName: 'Bulbasaur',
                    pokemonNumber: 1,
                    primaryType: PokemonType.grass,
                    imagePath: 'assets/ilustration/PokemonBulbasaur.png',
                    backgroundColor: const Color(0xFF78C850),
                    isFavorite: false,
                    onFavoriteChanged: (_) {},
                    size: CardSize.medium,
                    style: CardStyle.outlined,
                  ),
                  const SizedBox(width: 8),
                  AppCard.fromProperties(
                    pokemonName: 'Bulbasaur',
                    pokemonNumber: 1,
                    primaryType: PokemonType.grass,
                    imagePath: 'assets/ilustration/PokemonBulbasaur.png',
                    backgroundColor: const Color(0xFF78C850),
                    isFavorite: false,
                    onFavoriteChanged: (_) {},
                    size: CardSize.medium,
                    style: CardStyle.filled,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
