import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:desing_system/molecules/app_card/exports.dart';
import 'package:desing_system/molecules/app_type_tag/app_type_tag.dart';

void main() {
  group('SwipeableCard Tests', () {
    testWidgets('SwipeableCard renders child correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SwipeableCard(
              child: Container(
                width: 100,
                height: 100,
                color: Colors.blue,
              ),
            ),
          ),
        ),
      );

      expect(find.byType(Container), findsOneWidget);
      expect(find.byType(SwipeableCard), findsOneWidget);
    });

    testWidgets('SwipeableCard without action renders child only', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SwipeableCard(
              swipeAction: null,
              child: Container(
                width: 100,
                height: 100,
                color: Colors.blue,
              ),
            ),
          ),
        ),
      );

      expect(find.byType(GestureDetector), findsNothing);
      expect(find.byType(Container), findsOneWidget);
    });

    testWidgets('SwipeableCard with action shows background on swipe', (WidgetTester tester) async {
      bool actionCalled = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: SwipeableCard(
                swipeAction: SwipeActionUiModel.delete(
                  onAction: () => actionCalled = true,
                ),
                child: Container(
                  width: 140,
                  height: 200,
                  color: Colors.blue,
                ),
              ),
            ),
          ),
        ),
      );

      // Verify GestureDetector is present
      expect(find.byType(GestureDetector), findsOneWidget);

      // Find the SwipeableCard
      final swipeableFinder = find.byType(SwipeableCard);
      expect(swipeableFinder, findsOneWidget);

      // Simulate horizontal drag to the left
      await tester.drag(swipeableFinder, const Offset(-100, 0));
      await tester.pump();

      // Verify action was not called yet (not enough distance)
      expect(actionCalled, false);
    });

    testWidgets('SwipeableCard triggers action on sufficient swipe', (WidgetTester tester) async {
      bool actionCalled = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: SwipeableCard(
                swipeAction: SwipeActionUiModel.delete(
                  threshold: 0.3,
                  onAction: () => actionCalled = true,
                ),
                child: Container(
                  width: 140,
                  height: 200,
                  color: Colors.blue,
                ),
              ),
            ),
          ),
        ),
      );

      final swipeableFinder = find.byType(SwipeableCard);

      // Drag more than threshold (30% of 140 = 42px)
      await tester.drag(swipeableFinder, const Offset(-100, 0));
      await tester.pump();
      
      // Wait for forward animation
      await tester.pump(const Duration(milliseconds: 300));

      // Action should be called after animation completes
      expect(actionCalled, true);

      // Wait for the reset animation to complete
      await tester.pump(const Duration(milliseconds: 300));
      await tester.pump(const Duration(milliseconds: 300));
    });

    testWidgets('SwipeableCard does not respond when disabled', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: SwipeableCard(
                isEnabled: false,
                swipeAction: SwipeActionUiModel.delete(
                  onAction: () {},
                ),
                child: Container(
                  width: 140,
                  height: 200,
                  color: Colors.blue,
                ),
              ),
            ),
          ),
        ),
      );

      // Should render as plain child without swipe functionality
      expect(find.byType(Container), findsOneWidget);
    });
  });

  group('SwipeActionUiModel Tests', () {
    test('SwipeActionUiModel.delete creates correct model', () {
      final action = SwipeActionUiModel.delete(
        label: 'Delete',
        onAction: () {},
      );

      expect(action.type, SwipeActionType.delete);
      expect(action.icon, Icons.delete_outline);
      expect(action.label, 'Delete');
      expect(action.iconColor, Colors.white);
      expect(action.threshold, 0.4);
    });

    test('SwipeActionUiModel.archive creates correct model', () {
      final action = SwipeActionUiModel.archive(
        label: 'Archive',
      );

      expect(action.type, SwipeActionType.archive);
      expect(action.icon, Icons.archive_outlined);
      expect(action.label, 'Archive');
    });

    test('SwipeActionUiModel.favorite creates correct model', () {
      final action = SwipeActionUiModel.favorite();

      expect(action.type, SwipeActionType.favorite);
      expect(action.icon, Icons.star_outline);
    });

    test('SwipeActionUiModel.custom creates correct model', () {
      final action = SwipeActionUiModel.custom(
        backgroundColor: Colors.purple,
        icon: Icons.info,
        iconColor: Colors.yellow,
        threshold: 0.5,
      );

      expect(action.type, SwipeActionType.custom);
      expect(action.backgroundColor, Colors.purple);
      expect(action.icon, Icons.info);
      expect(action.iconColor, Colors.yellow);
      expect(action.threshold, 0.5);
    });

    test('SwipeActionUiModel validates threshold', () {
      expect(
        () => SwipeActionUiModel.delete(threshold: -0.1),
        throwsAssertionError,
      );

      expect(
        () => SwipeActionUiModel.delete(threshold: 1.1),
        throwsAssertionError,
      );
    });
  });

  group('AppCard with Swipe Integration Tests', () {
    testWidgets('AppCard with swipe action renders correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: AppCard(
                uiModel: AppCardUiModel(
                  pokemonName: 'Bulbasaur',
                  pokemonNumber: 1,
                  primaryType: PokemonType.grass,
                  imagePath: 'assets/ilustration/PokemonBulbasaur.png',
                  backgroundColor: const Color(0xFF78C850),
                  isFavorite: false,
                ),
                onFavoriteChanged: (value) {},
                swipeAction: SwipeActionUiModel.delete(
                  onAction: () {},
                ),
              ),
            ),
          ),
        ),
      );

      expect(find.byType(AppCard), findsOneWidget);
      expect(find.byType(SwipeableCard), findsOneWidget);
      expect(find.text('Bulbasaur'), findsOneWidget);
    });

    testWidgets('AppCard without swipe action works normally', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: AppCard(
                uiModel: AppCardUiModel(
                  pokemonName: 'Bulbasaur',
                  pokemonNumber: 1,
                  primaryType: PokemonType.grass,
                  imagePath: 'assets/ilustration/PokemonBulbasaur.png',
                  backgroundColor: const Color(0xFF78C850),
                  isFavorite: false,
                ),
                onFavoriteChanged: (value) {},
              ),
            ),
          ),
        ),
      );

      expect(find.byType(AppCard), findsOneWidget);
      expect(find.text('Bulbasaur'), findsOneWidget);
    });

    testWidgets('AppCard preserves tap functionality with swipe', (WidgetTester tester) async {
      bool cardTapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: AppCard(
                uiModel: AppCardUiModel(
                  pokemonName: 'Bulbasaur',
                  pokemonNumber: 1,
                  primaryType: PokemonType.grass,
                  imagePath: 'assets/ilustration/PokemonBulbasaur.png',
                  backgroundColor: const Color(0xFF78C850),
                  isFavorite: false,
                ),
                onFavoriteChanged: (value) {},
                onTap: () => cardTapped = true,
                swipeAction: SwipeActionUiModel.delete(),
              ),
            ),
          ),
        ),
      );

      // Tap the card
      await tester.tap(find.byType(AppCard));
      await tester.pump();

      expect(cardTapped, true);
    });
  });
}
