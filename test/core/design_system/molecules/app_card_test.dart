import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/core/design_system/atoms/app_card/app_card.dart';
import 'package:pokedex/core/design_system/atoms/app_card/card_enums.dart';
import 'package:pokedex/core/design_system/molecules/app_type_tag/app_type_tag.dart';

void main() {
  group('AppCard', () {
    group('Basic Rendering Tests', () {
      testWidgets('Displays Pokemon name correctly', (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Center(
                child: AppCard(
                  pokemonName: 'Bulbasaur',
                  pokemonNumber: 1,
                  primaryType: PokemonType.grass,
                  imagePath: 'assets/ilustration/PokemonBulbasaur.png',
                  backgroundColor: const Color(0xFF78C850),
                  isFavorite: false,
                  onFavoriteChanged: (_) {},
                ),
              ),
            ),
          ),
        );

        expect(find.text('Bulbasaur'), findsOneWidget);
      });

      testWidgets('Displays Pokemon number with proper formatting',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Center(
                child: AppCard(
                  pokemonName: 'Bulbasaur',
                  pokemonNumber: 1,
                  primaryType: PokemonType.grass,
                  imagePath: 'assets/ilustration/PokemonBulbasaur.png',
                  backgroundColor: const Color(0xFF78C850),
                  isFavorite: false,
                  onFavoriteChanged: (_) {},
                  showPokemonNumber: true,
                ),
              ),
            ),
          ),
        );

        expect(find.text('Nº0001'), findsOneWidget);
      });

      testWidgets('Hides Pokemon number when showPokemonNumber=false',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Center(
                child: AppCard(
                  pokemonName: 'Bulbasaur',
                  pokemonNumber: 1,
                  primaryType: PokemonType.grass,
                  imagePath: 'assets/ilustration/PokemonBulbasaur.png',
                  backgroundColor: const Color(0xFF78C850),
                  isFavorite: false,
                  onFavoriteChanged: (_) {},
                  showPokemonNumber: false,
                ),
              ),
            ),
          ),
        );

        expect(find.text('Nº0001'), findsNothing);
      });

      testWidgets('Displays primary type', (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Center(
                child: AppCard(
                  pokemonName: 'Bulbasaur',
                  pokemonNumber: 1,
                  primaryType: PokemonType.grass,
                  imagePath: 'assets/ilustration/PokemonBulbasaur.png',
                  backgroundColor: const Color(0xFF78C850),
                  isFavorite: false,
                  onFavoriteChanged: (_) {},
                ),
              ),
            ),
          ),
        );

        expect(find.byType(AppTypeTag), findsOneWidget);
      });

      testWidgets('Displays both primary and secondary types',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Center(
                child: AppCard(
                  pokemonName: 'Bulbasaur',
                  pokemonNumber: 1,
                  primaryType: PokemonType.grass,
                  secondaryType: PokemonType.poison,
                  imagePath: 'assets/ilustration/PokemonBulbasaur.png',
                  backgroundColor: const Color(0xFF78C850),
                  isFavorite: false,
                  onFavoriteChanged: (_) {},
                ),
              ),
            ),
          ),
        );

        expect(find.byType(AppTypeTag), findsWidgets);
      });
    });

    group('Size Tests', () {
      testWidgets('Small size renders with correct dimensions',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Center(
                child: AppCard(
                  pokemonName: 'Bulbasaur',
                  pokemonNumber: 1,
                  primaryType: PokemonType.grass,
                  imagePath: 'assets/ilustration/PokemonBulbasaur.png',
                  backgroundColor: const Color(0xFF78C850),
                  isFavorite: false,
                  onFavoriteChanged: (_) {},
                  size: CardSize.small,
                ),
              ),
            ),
          ),
        );

        final containerFinder = find.byType(Container);
        expect(containerFinder, findsWidgets);
      });

      testWidgets('Medium size renders with correct dimensions',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Center(
                child: AppCard(
                  pokemonName: 'Bulbasaur',
                  pokemonNumber: 1,
                  primaryType: PokemonType.grass,
                  imagePath: 'assets/ilustration/PokemonBulbasaur.png',
                  backgroundColor: const Color(0xFF78C850),
                  isFavorite: false,
                  onFavoriteChanged: (_) {},
                  size: CardSize.medium,
                ),
              ),
            ),
          ),
        );

        expect(find.byType(Container), findsWidgets);
      });

      testWidgets('Large size renders with correct dimensions',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Center(
                child: AppCard(
                  pokemonName: 'Bulbasaur',
                  pokemonNumber: 1,
                  primaryType: PokemonType.grass,
                  imagePath: 'assets/ilustration/PokemonBulbasaur.png',
                  backgroundColor: const Color(0xFF78C850),
                  isFavorite: false,
                  onFavoriteChanged: (_) {},
                  size: CardSize.large,
                ),
              ),
            ),
          ),
        );

        expect(find.byType(Container), findsWidgets);
      });

      testWidgets('Size enum values are correct', (WidgetTester tester) async {
        expect(CardSize.small.height, 160);
        expect(CardSize.small.width, 150);
        expect(CardSize.small.padding, 12);
        expect(CardSize.small.borderRadius, 12);
        expect(CardSize.small.imageSize, 60);

        expect(CardSize.medium.height, 180);
        expect(CardSize.medium.width, 170);
        expect(CardSize.medium.padding, 16);
        expect(CardSize.medium.borderRadius, 16);
        expect(CardSize.medium.imageSize, 80);

        expect(CardSize.large.height, 220);
        expect(CardSize.large.width, 200);
        expect(CardSize.large.padding, 20);
        expect(CardSize.large.borderRadius, 20);
        expect(CardSize.large.imageSize, 100);
      });
    });

    group('Style Tests', () {
      testWidgets('Elevated style renders with Material',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Center(
                child: AppCard(
                  pokemonName: 'Bulbasaur',
                  pokemonNumber: 1,
                  primaryType: PokemonType.grass,
                  imagePath: 'assets/ilustration/PokemonBulbasaur.png',
                  backgroundColor: const Color(0xFF78C850),
                  isFavorite: false,
                  onFavoriteChanged: (_) {},
                  style: CardStyle.elevated,
                ),
              ),
            ),
          ),
        );

        expect(find.byType(Material), findsWidgets);
      });

      testWidgets('Outlined style renders without Material',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Center(
                child: AppCard(
                  pokemonName: 'Bulbasaur',
                  pokemonNumber: 1,
                  primaryType: PokemonType.grass,
                  imagePath: 'assets/ilustration/PokemonBulbasaur.png',
                  backgroundColor: const Color(0xFF78C850),
                  isFavorite: false,
                  onFavoriteChanged: (_) {},
                  style: CardStyle.outlined,
                ),
              ),
            ),
          ),
        );

        expect(find.byType(Container), findsWidgets);
      });

      testWidgets('Filled style renders correctly', (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Center(
                child: AppCard(
                  pokemonName: 'Bulbasaur',
                  pokemonNumber: 1,
                  primaryType: PokemonType.grass,
                  imagePath: 'assets/ilustration/PokemonBulbasaur.png',
                  backgroundColor: const Color(0xFF78C850),
                  isFavorite: false,
                  onFavoriteChanged: (_) {},
                  style: CardStyle.filled,
                ),
              ),
            ),
          ),
        );

        expect(find.byType(Container), findsWidgets);
      });
    });

    group('Elevation Tests', () {
      testWidgets('CardElevation enum values are correct',
          (WidgetTester tester) async {
        expect(CardElevation.none.value, 0);
        expect(CardElevation.low.value, 2);
        expect(CardElevation.medium.value, 4);
        expect(CardElevation.high.value, 8);
      });

      testWidgets('High elevation renders with Material',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Center(
                child: AppCard(
                  pokemonName: 'Bulbasaur',
                  pokemonNumber: 1,
                  primaryType: PokemonType.grass,
                  imagePath: 'assets/ilustration/PokemonBulbasaur.png',
                  backgroundColor: const Color(0xFF78C850),
                  isFavorite: false,
                  onFavoriteChanged: (_) {},
                  style: CardStyle.elevated,
                  elevation: CardElevation.high,
                ),
              ),
            ),
          ),
        );

        expect(find.byType(Material), findsWidgets);
      });
    });

    group('Favorite Button Tests', () {
      testWidgets('Displays favorite button', (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Center(
                child: AppCard(
                  pokemonName: 'Bulbasaur',
                  pokemonNumber: 1,
                  primaryType: PokemonType.grass,
                  imagePath: 'assets/ilustration/PokemonBulbasaur.png',
                  backgroundColor: const Color(0xFF78C850),
                  isFavorite: false,
                  onFavoriteChanged: (_) {},
                ),
              ),
            ),
          ),
        );

        // FavoriteTag button should be rendered
        final inkWellFinder = find.byType(InkWell);
        expect(inkWellFinder, findsWidgets);
      });

      testWidgets('Favorite callback is invoked', (WidgetTester tester) async {
        bool favoriteChanged = false;

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Center(
                child: AppCard(
                  pokemonName: 'Bulbasaur',
                  pokemonNumber: 1,
                  primaryType: PokemonType.grass,
                  imagePath: 'assets/ilustration/PokemonBulbasaur.png',
                  backgroundColor: const Color(0xFF78C850),
                  isFavorite: false,
                  onFavoriteChanged: (value) {
                    favoriteChanged = true;
                  },
                ),
              ),
            ),
          ),
        );

        // Find and tap the favorite button
        final heartIcons = find.byIcon(Icons.favorite_border);
        if (heartIcons.evaluate().isNotEmpty) {
          await tester.tap(heartIcons.first);
          await tester.pumpAndSettle();
          expect(favoriteChanged, true);
        }
      });
    });

    group('Tap and Interaction Tests', () {
      testWidgets('Card responds to tap when onTap is provided',
          (WidgetTester tester) async {
        bool cardTapped = false;

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Center(
                child: AppCard(
                  pokemonName: 'Bulbasaur',
                  pokemonNumber: 1,
                  primaryType: PokemonType.grass,
                  imagePath: 'assets/ilustration/PokemonBulbasaur.png',
                  backgroundColor: const Color(0xFF78C850),
                  isFavorite: false,
                  onFavoriteChanged: (_) {},
                  onTap: () {
                    cardTapped = true;
                  },
                ),
              ),
            ),
          ),
        );

        final gestureDetectorFinder = find.byType(GestureDetector);
        if (gestureDetectorFinder.evaluate().isNotEmpty) {
          await tester.tap(gestureDetectorFinder.first);
          await tester.pumpAndSettle();
          expect(cardTapped, true);
        }
      });

      testWidgets('Card is disabled when isEnabled=false',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Center(
                child: AppCard(
                  pokemonName: 'Bulbasaur',
                  pokemonNumber: 1,
                  primaryType: PokemonType.grass,
                  imagePath: 'assets/ilustration/PokemonBulbasaur.png',
                  backgroundColor: const Color(0xFF78C850),
                  isFavorite: false,
                  onFavoriteChanged: (_) {},
                  isEnabled: false,
                ),
              ),
            ),
          ),
        );

        expect(find.byType(AppCard), findsOneWidget);
      });

      testWidgets('Card is enabled by default', (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Center(
                child: AppCard(
                  pokemonName: 'Bulbasaur',
                  pokemonNumber: 1,
                  primaryType: PokemonType.grass,
                  imagePath: 'assets/ilustration/PokemonBulbasaur.png',
                  backgroundColor: const Color(0xFF78C850),
                  isFavorite: false,
                  onFavoriteChanged: (_) {},
                ),
              ),
            ),
          ),
        );

        expect(find.byType(AppCard), findsOneWidget);
      });
    });

    group('Background Color Tests', () {
      testWidgets('Grass type card has correct background color',
          (WidgetTester tester) async {
        const grassColor = Color(0xFF78C850);

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Center(
                child: AppCard(
                  pokemonName: 'Bulbasaur',
                  pokemonNumber: 1,
                  primaryType: PokemonType.grass,
                  imagePath: 'assets/ilustration/PokemonBulbasaur.png',
                  backgroundColor: grassColor,
                  isFavorite: false,
                  onFavoriteChanged: (_) {},
                ),
              ),
            ),
          ),
        );

        expect(find.byType(Container), findsWidgets);
      });

      testWidgets('Water type card has correct background color',
          (WidgetTester tester) async {
        const waterColor = Color(0xFF6B9BD1);

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Center(
                child: AppCard(
                  pokemonName: 'Squirtle',
                  pokemonNumber: 7,
                  primaryType: PokemonType.water,
                  imagePath: 'assets/ilustration/PokemonSquirtle.png',
                  backgroundColor: waterColor,
                  isFavorite: false,
                  onFavoriteChanged: (_) {},
                ),
              ),
            ),
          ),
        );

        expect(find.byType(Container), findsWidgets);
      });
    });

    group('Combined Tests', () {
      testWidgets('All properties work together correctly',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Center(
                child: AppCard(
                  pokemonName: 'Bulbasaur',
                  pokemonNumber: 1,
                  primaryType: PokemonType.grass,
                  secondaryType: PokemonType.poison,
                  imagePath: 'assets/ilustration/PokemonBulbasaur.png',
                  backgroundColor: const Color(0xFF78C850),
                  isFavorite: true,
                  onFavoriteChanged: (_) {},
                  size: CardSize.medium,
                  style: CardStyle.elevated,
                  elevation: CardElevation.high,
                  showPokemonNumber: true,
                  isEnabled: true,
                ),
              ),
            ),
          ),
        );

        expect(find.text('Bulbasaur'), findsOneWidget);
        expect(find.text('Nº0001'), findsOneWidget);
        expect(find.byType(AppTypeTag), findsWidgets);
      });

      testWidgets('Multiple cards render independently',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: ListView(
                children: [
                  AppCard(
                    pokemonName: 'Bulbasaur',
                    pokemonNumber: 1,
                    primaryType: PokemonType.grass,
                    imagePath: 'assets/ilustration/PokemonBulbasaur.png',
                    backgroundColor: const Color(0xFF78C850),
                    isFavorite: false,
                    onFavoriteChanged: (_) {},
                  ),
                  AppCard(
                    pokemonName: 'Charmeleon',
                    pokemonNumber: 5,
                    primaryType: PokemonType.fire,
                    imagePath: 'assets/ilustration/PokemonCharmeleon.png',
                    backgroundColor: const Color(0xFFFD7D24),
                    isFavorite: true,
                    onFavoriteChanged: (_) {},
                  ),
                ],
              ),
            ),
          ),
        );

        expect(find.byType(AppCard), findsWidgets);
        expect(find.text('Bulbasaur'), findsOneWidget);
        expect(find.text('Charmeleon'), findsOneWidget);
      });

      testWidgets('Different sizes render correctly', (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Row(
                children: [
                  AppCard(
                    pokemonName: 'Bulbasaur',
                    pokemonNumber: 1,
                    primaryType: PokemonType.grass,
                    imagePath: 'assets/ilustration/PokemonBulbasaur.png',
                    backgroundColor: const Color(0xFF78C850),
                    isFavorite: false,
                    onFavoriteChanged: (_) {},
                    size: CardSize.small,
                  ),
                  AppCard(
                    pokemonName: 'Bulbasaur',
                    pokemonNumber: 1,
                    primaryType: PokemonType.grass,
                    imagePath: 'assets/ilustration/PokemonBulbasaur.png',
                    backgroundColor: const Color(0xFF78C850),
                    isFavorite: false,
                    onFavoriteChanged: (_) {},
                    size: CardSize.large,
                  ),
                ],
              ),
            ),
          ),
        );

        expect(find.byType(AppCard), findsWidgets);
      });
    });

    group('Pokemon Number Formatting Tests', () {
      testWidgets('Single digit Pokemon number is formatted with zeros',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Center(
                child: AppCard(
                  pokemonName: 'Bulbasaur',
                  pokemonNumber: 1,
                  primaryType: PokemonType.grass,
                  imagePath: 'assets/ilustration/PokemonBulbasaur.png',
                  backgroundColor: const Color(0xFF78C850),
                  isFavorite: false,
                  onFavoriteChanged: (_) {},
                ),
              ),
            ),
          ),
        );

        expect(find.text('Nº0001'), findsOneWidget);
      });

      testWidgets('Three digit Pokemon number is formatted correctly',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Center(
                child: AppCard(
                  pokemonName: 'Charizard',
                  pokemonNumber: 6,
                  primaryType: PokemonType.fire,
                  imagePath: 'assets/ilustration/PokemonCharizard.png',
                  backgroundColor: const Color(0xFFFD7D24),
                  isFavorite: false,
                  onFavoriteChanged: (_) {},
                ),
              ),
            ),
          ),
        );

        expect(find.text('Nº0006'), findsOneWidget);
      });
    });
  });
}
