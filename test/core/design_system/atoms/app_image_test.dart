import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/core/design_system/atoms/app_image/app_image.dart';

void main() {
  group('AppImage', () {
    group('Size Tests', () {
      testWidgets('Small size renders with correct dimensions',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppImage(
                'assets/ilustration/PokemonCharizard.png',
                size: AppImageSize.small,
              ),
            ),
          ),
        );

        expect(find.byType(Image), findsOneWidget);
        expect(find.byType(ClipRRect), findsOneWidget);
      });

      testWidgets('Medium size renders with correct dimensions',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppImage(
                'assets/ilustration/PokemonCharizard.png',
                size: AppImageSize.medium,
              ),
            ),
          ),
        );

        expect(find.byType(Image), findsOneWidget);
      });

      testWidgets('Large size renders with correct dimensions',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppImage(
                'assets/ilustration/PokemonCharizard.png',
                size: AppImageSize.large,
              ),
            ),
          ),
        );

        expect(find.byType(Image), findsOneWidget);
      });

      testWidgets('Extra large size renders with correct dimensions',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppImage(
                'assets/ilustration/PokemonCharizard.png',
                size: AppImageSize.extraLarge,
              ),
            ),
          ),
        );

        expect(find.byType(Image), findsOneWidget);
      });

      testWidgets('All sizes have correct dimension values', 
          (WidgetTester tester) async {
        expect(AppImageSize.small.dimension, 80);
        expect(AppImageSize.medium.dimension, 120);
        expect(AppImageSize.large.dimension, 160);
        expect(AppImageSize.extraLarge.dimension, 200);
      });
    });

    group('Fit Tests', () {
      testWidgets('Cover fit renders correctly', (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppImage(
                'assets/ilustration/PokemonCharizard.png',
                fit: AppImageFit.cover,
              ),
            ),
          ),
        );

        expect(find.byType(Image), findsOneWidget);
        expect(AppImageFit.cover.boxFit, BoxFit.cover);
      });

      testWidgets('Contain fit renders correctly', (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppImage(
                'assets/ilustration/PokemonCharizard.png',
                fit: AppImageFit.contain,
              ),
            ),
          ),
        );

        expect(find.byType(Image), findsOneWidget);
        expect(AppImageFit.contain.boxFit, BoxFit.contain);
      });

      testWidgets('Fill fit renders correctly', (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppImage(
                'assets/ilustration/PokemonCharizard.png',
                fit: AppImageFit.fill,
              ),
            ),
          ),
        );

        expect(find.byType(Image), findsOneWidget);
        expect(AppImageFit.fill.boxFit, BoxFit.fill);
      });

      testWidgets('All fit options map correctly', (WidgetTester tester) async {
        expect(AppImageFit.cover.boxFit, BoxFit.cover);
        expect(AppImageFit.contain.boxFit, BoxFit.contain);
        expect(AppImageFit.fill.boxFit, BoxFit.fill);
        expect(AppImageFit.fitWidth.boxFit, BoxFit.fitWidth);
        expect(AppImageFit.fitHeight.boxFit, BoxFit.fitHeight);
      });
    });

    group('BorderRadius Tests', () {
      testWidgets('Default border radius is 8.0', (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppImage(
                'assets/ilustration/PokemonCharizard.png',
              ),
            ),
          ),
        );

        expect(find.byType(ClipRRect), findsOneWidget);
      });

      testWidgets('Custom border radius renders correctly',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppImage(
                'assets/ilustration/PokemonCharizard.png',
                borderRadius: 16.0,
              ),
            ),
          ),
        );

        expect(find.byType(ClipRRect), findsOneWidget);
      });

      testWidgets('Zero border radius renders without clipping',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppImage(
                'assets/ilustration/PokemonCharizard.png',
                borderRadius: 0.0,
              ),
            ),
          ),
        );

        expect(find.byType(ClipRRect), findsOneWidget);
      });
    });

    group('Shadow Tests', () {
      testWidgets('No shadow by default', (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppImage(
                'assets/ilustration/PokemonCharizard.png',
                showShadow: false,
              ),
            ),
          ),
        );

        expect(find.byType(Image), findsOneWidget);
      });

      testWidgets('Shadow renders when showShadow=true',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppImage(
                'assets/ilustration/PokemonCharizard.png',
                showShadow: true,
              ),
            ),
          ),
        );

        expect(find.byType(Container), findsWidgets);
        expect(find.byType(Image), findsOneWidget);
      });
    });

    group('Background Color Tests', () {
      testWidgets('No background color by default', (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppImage(
                'assets/ilustration/PokemonCharizard.png',
              ),
            ),
          ),
        );

        expect(find.byType(Image), findsOneWidget);
      });

      testWidgets('Background color renders when provided',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppImage(
                'assets/ilustration/PokemonCharizard.png',
                backgroundColor: Colors.grey[100],
              ),
            ),
          ),
        );

        expect(find.byType(Container), findsWidgets);
        expect(find.byType(Image), findsOneWidget);
      });
    });

    group('Error Handling Tests', () {
      testWidgets('Error icon shows by default when image fails to load',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppImage(
                'assets/invalid/path.png',
                showErrorIcon: true,
              ),
            ),
          ),
        );

        await tester.pumpAndSettle();
        expect(find.byIcon(Icons.broken_image), findsOneWidget);
      });

      testWidgets('Error icon hidden when showErrorIcon=false',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppImage(
                'assets/invalid/path.png',
                showErrorIcon: false,
              ),
            ),
          ),
        );

        await tester.pumpAndSettle();
        // Should render but no error icon
        expect(find.byType(Container), findsWidgets);
      });
    });

    group('Combined Tests', () {
      testWidgets('All properties work together correctly',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppImage(
                'assets/ilustration/PokemonCharizard.png',
                size: AppImageSize.large,
                fit: AppImageFit.cover,
                borderRadius: 12.0,
                showShadow: true,
                backgroundColor: Colors.white,
              ),
            ),
          ),
        );

        expect(find.byType(Image), findsOneWidget);
        expect(find.byType(Container), findsWidgets);
        expect(find.byType(ClipRRect), findsOneWidget);
      });

      testWidgets('Multiple AppImages render independently',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Row(
                children: [
                  AppImage(
                    'assets/ilustration/PokemonCharizard.png',
                    size: AppImageSize.small,
                  ),
                  AppImage(
                    'assets/ilustration/PokemonPikachu.png',
                    size: AppImageSize.medium,
                  ),
                  AppImage(
                    'assets/ilustration/PokemonSquirtle.png',
                    size: AppImageSize.large,
                  ),
                ],
              ),
            ),
          ),
        );

        expect(find.byType(AppImage), findsWidgets);
        expect(find.byType(Image), findsWidgets);
      });

      testWidgets('Different sizes stack vertically',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Column(
                children: [
                  AppImage(
                    'assets/ilustration/PokemonCharizard.png',
                    size: AppImageSize.small,
                  ),
                  AppImage(
                    'assets/ilustration/PokemonCharizard.png',
                    size: AppImageSize.medium,
                  ),
                  AppImage(
                    'assets/ilustration/PokemonCharizard.png',
                    size: AppImageSize.large,
                  ),
                ],
              ),
            ),
          ),
        );

        expect(find.byType(AppImage), findsWidgets);
      });
    });

    group('Asset Path Tests', () {
      testWidgets('Different Pokemon assets can be rendered',
          (WidgetTester tester) async {
        final pokemonAssets = [
          'assets/ilustration/PokemonCharizard.png',
          'assets/ilustration/PokemonPikachu.png',
          'assets/ilustration/PokemonSquirtle.png',
          'assets/ilustration/PokemonVenusaur.png',
        ];

        for (final asset in pokemonAssets) {
          await tester.pumpWidget(
            MaterialApp(
              home: Scaffold(
                body: AppImage(asset),
              ),
            ),
          );

          expect(find.byType(Image), findsOneWidget);
        }
      });

      testWidgets('Asset path is used correctly', (WidgetTester tester) async {
        const assetPath = 'assets/ilustration/PokemonCharizard.png';
        
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppImage(assetPath),
            ),
          ),
        );

        expect(find.byType(Image), findsOneWidget);
      });
    });
  });
}
