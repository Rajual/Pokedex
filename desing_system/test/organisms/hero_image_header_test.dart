import 'package:desing_system/desing_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('HeroImageHeader', () {
    group('Rendering Tests', () {
      testWidgets('should render HeroImageHeader with basic properties',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: CustomScrollView(
                slivers: [
                  HeroImageHeader(
                    uiModel: HeroImageHeaderUiModel(
                      imageUrl: 'https://example.com/image.png',
                      heroTag: 'test-hero',
                      backgroundColor: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );

        expect(find.byType(HeroImageHeader), findsOneWidget);
        expect(find.byType(SliverAppBar), findsOneWidget);
      });

      testWidgets('should display back button by default',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: CustomScrollView(
                slivers: [
                  HeroImageHeader(
                    uiModel: HeroImageHeaderUiModel(
                      imageUrl: 'https://example.com/image.png',
                      heroTag: 'test-hero',
                    ),
                  ),
                ],
              ),
            ),
          ),
        );

        expect(find.byIcon(Icons.arrow_back), findsOneWidget);
      });

      testWidgets('should not display back button when showBackButton is false',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: CustomScrollView(
                slivers: [
                  HeroImageHeader(
                    uiModel: HeroImageHeaderUiModel(
                      imageUrl: 'https://example.com/image.png',
                      heroTag: 'test-hero',
                      showBackButton: false,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );

        expect(find.byIcon(Icons.arrow_back), findsNothing);
      });

      testWidgets('should display custom back button icon',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: CustomScrollView(
                slivers: [
                  HeroImageHeader(
                    uiModel: HeroImageHeaderUiModel(
                      imageUrl: 'https://example.com/image.png',
                      heroTag: 'test-hero',
                      backButtonIcon: Icons.close,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );

        expect(find.byIcon(Icons.close), findsOneWidget);
        expect(find.byIcon(Icons.arrow_back), findsNothing);
      });
    });

    group('Actions Tests', () {
      testWidgets('should display custom actions',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: CustomScrollView(
                slivers: [
                  HeroImageHeader(
                    uiModel: HeroImageHeaderUiModel(
                      imageUrl: 'https://example.com/image.png',
                      heroTag: 'test-hero',
                      actions: [
                        IconButton(
                          icon: const Icon(Icons.favorite),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );

        expect(find.byIcon(Icons.favorite), findsOneWidget);
      });

      testWidgets('should display multiple actions',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: CustomScrollView(
                slivers: [
                  HeroImageHeader(
                    uiModel: HeroImageHeaderUiModel(
                      imageUrl: 'https://example.com/image.png',
                      heroTag: 'test-hero',
                      actions: [
                        IconButton(
                          icon: const Icon(Icons.favorite),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: const Icon(Icons.share),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );

        expect(find.byIcon(Icons.favorite), findsOneWidget);
        expect(find.byIcon(Icons.share), findsOneWidget);
      });
    });

    group('Callback Tests', () {
      testWidgets('should call onBack when back button is pressed',
          (WidgetTester tester) async {
        bool wasPressed = false;

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: CustomScrollView(
                slivers: [
                  HeroImageHeader(
                    uiModel: HeroImageHeaderUiModel(
                      imageUrl: 'https://example.com/image.png',
                      heroTag: 'test-hero',
                      onBack: () => wasPressed = true,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );

        await tester.tap(find.byIcon(Icons.arrow_back));
        await tester.pump();

        expect(wasPressed, isTrue);
      });
    });

    group('Decoration Tests', () {
      testWidgets('should show decoration by default',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: CustomScrollView(
                slivers: [
                  HeroImageHeader(
                    uiModel: HeroImageHeaderUiModel(
                      imageUrl: 'https://example.com/image.png',
                      heroTag: 'test-hero',
                    ),
                  ),
                ],
              ),
            ),
          ),
        );

        // Decoration is a Positioned > Container
        expect(find.byType(Positioned), findsWidgets);
      });

      testWidgets('should not show decoration when showDecoration is false',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: CustomScrollView(
                slivers: [
                  HeroImageHeader(
                    uiModel: HeroImageHeaderUiModel(
                      imageUrl: 'https://example.com/image.png',
                      heroTag: 'test-hero',
                      showDecoration: false,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );

        // Count Positioned widgets - should be less when decoration is disabled
        final positionedCount = tester.widgetList(find.byType(Positioned)).length;
        expect(positionedCount, equals(1)); // Only one from FlexibleSpaceBar, no decoration
      });
    });

    group('Hero Tests', () {
      testWidgets('should wrap image in Hero widget',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: CustomScrollView(
                slivers: [
                  HeroImageHeader(
                    uiModel: HeroImageHeaderUiModel(
                      imageUrl: 'https://example.com/image.png',
                      heroTag: 'test-hero-tag',
                    ),
                  ),
                ],
              ),
            ),
          ),
        );

        final heroFinder = find.byType(Hero);
        expect(heroFinder, findsOneWidget);

        final Hero hero = tester.widget(heroFinder);
        expect(hero.tag, equals('test-hero-tag'));
      });
    });

    group('Background Color Tests', () {
      testWidgets('should use custom background color',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: CustomScrollView(
                slivers: [
                  HeroImageHeader(
                    uiModel: HeroImageHeaderUiModel(
                      imageUrl: 'https://example.com/image.png',
                      heroTag: 'test-hero',
                      backgroundColor: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );

        final sliverAppBar = tester.widget<SliverAppBar>(
          find.byType(SliverAppBar),
        );
        expect(sliverAppBar.backgroundColor, equals(Colors.green));
      });
    });

    group('Pinned Tests', () {
      testWidgets('should be pinned by default',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: CustomScrollView(
                slivers: [
                  HeroImageHeader(
                    uiModel: HeroImageHeaderUiModel(
                      imageUrl: 'https://example.com/image.png',
                      heroTag: 'test-hero',
                    ),
                  ),
                ],
              ),
            ),
          ),
        );

        final sliverAppBar = tester.widget<SliverAppBar>(
          find.byType(SliverAppBar),
        );
        expect(sliverAppBar.pinned, isTrue);
      });

      testWidgets('should respect pinned configuration',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: CustomScrollView(
                slivers: [
                  HeroImageHeader(
                    uiModel: HeroImageHeaderUiModel(
                      imageUrl: 'https://example.com/image.png',
                      heroTag: 'test-hero',
                      pinned: false,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );

        final sliverAppBar = tester.widget<SliverAppBar>(
          find.byType(SliverAppBar),
        );
        expect(sliverAppBar.pinned, isFalse);
      });
    });
  });

  group('HeroImageHeaderUiModel', () {
    test('should create model with required fields', () {
      final model = HeroImageHeaderUiModel(
        imageUrl: 'https://example.com/image.png',
        heroTag: 'test-hero',
      );

      expect(model.imageUrl, equals('https://example.com/image.png'));
      expect(model.heroTag, equals('test-hero'));
      expect(model.backgroundColor, equals(Colors.blue));
      expect(model.expandedHeightFraction, equals(0.4));
      expect(model.pinned, isTrue);
      expect(model.showBackButton, isTrue);
      expect(model.showDecoration, isTrue);
    });

    test('should create copy with updated values', () {
      final original = HeroImageHeaderUiModel(
        imageUrl: 'https://example.com/image.png',
        heroTag: 'test-hero',
      );

      final copy = original.copyWith(
        backgroundColor: Colors.red,
        pinned: false,
      );

      expect(copy.imageUrl, equals('https://example.com/image.png'));
      expect(copy.backgroundColor, equals(Colors.red));
      expect(copy.pinned, isFalse);
    });

    test('should throw assertion error for invalid expandedHeightFraction', () {
      expect(
        () => HeroImageHeaderUiModel(
          imageUrl: 'https://example.com/image.png',
          heroTag: 'test-hero',
          expandedHeightFraction: 1.5,
        ),
        throwsA(isA<AssertionError>()),
      );

      expect(
        () => HeroImageHeaderUiModel(
          imageUrl: 'https://example.com/image.png',
          heroTag: 'test-hero',
          expandedHeightFraction: -0.1,
        ),
        throwsA(isA<AssertionError>()),
      );
    });

    test('should throw assertion error for invalid imageWidthFraction', () {
      expect(
        () => HeroImageHeaderUiModel(
          imageUrl: 'https://example.com/image.png',
          heroTag: 'test-hero',
          imageWidthFraction: 1.5,
        ),
        throwsA(isA<AssertionError>()),
      );
    });

    test('should throw assertion error for invalid decorationOpacity', () {
      expect(
        () => HeroImageHeaderUiModel(
          imageUrl: 'https://example.com/image.png',
          heroTag: 'test-hero',
          decorationOpacity: 1.5,
        ),
        throwsA(isA<AssertionError>()),
      );
    });
  });

  group('Enums', () {
    test('DecorationSize should have correct values', () {
      expect(DecorationSize.values.length, equals(3));
      expect(DecorationSize.small.size, equals(150.0));
      expect(DecorationSize.medium.size, equals(200.0));
      expect(DecorationSize.large.size, equals(250.0));
    });

    test('CircleDecorationPosition should have correct values', () {
      expect(CircleDecorationPosition.values.length, equals(4));
      
      final topRight = CircleDecorationPosition.topRight.getPosition();
      expect(topRight['right'], equals(-50.0));
      expect(topRight['top'], equals(-50.0));

      final bottomLeft = CircleDecorationPosition.bottomLeft.getPosition();
      expect(bottomLeft['left'], equals(-50.0));
      expect(bottomLeft['bottom'], equals(-50.0));
    });
  });
}
