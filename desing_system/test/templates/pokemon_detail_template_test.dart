import 'package:desing_system/desing_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('PokemonDetailTemplate', () {
    late PokemonDetailTemplateUiModel testUiModel;

    setUp(() {
      testUiModel = const PokemonDetailTemplateUiModel(
        number: '001',
        name: 'Bulbasaur',
        imageUrl: 'https://test.com/image.png',
        types: [PokemonType.grass, PokemonType.poison],
        description: 'Test description',
        weight: '6,9 kg',
        height: '0,7 m',
        category: 'SEMILLA',
        ability: 'Espesura',
        malePercentage: 87.5,
        femalePercentage: 12.5,
        weaknesses: [PokemonType.fire, PokemonType.psychic],
        primaryColor: Colors.green,
        isFavorite: false,
      );
    });

    group('Rendering Tests', () {
      testWidgets('should render PokemonDetailTemplate with basic structure',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: PokemonDetailTemplate(uiModel: testUiModel),
          ),
        );

        expect(find.byType(CustomScrollView), findsOneWidget);
        expect(find.byType(SliverAppBar), findsOneWidget);
      });

      testWidgets('should display Pokemon name and number',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: PokemonDetailTemplate(uiModel: testUiModel),
          ),
        );
        
        // Wait for initial frame
        await tester.pump();

        // Scroll down to make content visible
        await tester.drag(find.byType(CustomScrollView), const Offset(0, -200));
        await tester.pump();

        expect(find.text('Bulbasaur'), findsOneWidget);
        expect(find.textContaining('001'), findsOneWidget);
      });

      testWidgets('should display Pokemon description',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: PokemonDetailTemplate(uiModel: testUiModel),
          ),
        );

        expect(find.text('Test description'), findsOneWidget);
      });

      testWidgets('should display all type tags',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: PokemonDetailTemplate(uiModel: testUiModel),
          ),
        );

        // Should find 2 type tags (grass and poison)
        expect(
            find.byWidgetPredicate((widget) =>
                widget is AppTypeTag &&
                (widget.type == PokemonType.grass ||
                    widget.type == PokemonType.poison)),
            findsNWidgets(2));
      });

      testWidgets('should display stats section',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: PokemonDetailTemplate(uiModel: testUiModel),
          ),
        );

        // Wait for initial frame
        await tester.pump();

        // Scroll down to make stats visible
        await tester.drag(find.byType(CustomScrollView), const Offset(0, -300));
        await tester.pump();

        expect(find.textContaining('kg'), findsOneWidget);
        expect(find.textContaining('m'), findsOneWidget);
        expect(find.text('SEMILLA'), findsOneWidget);
        expect(find.text('Espesura'), findsOneWidget);
      });

      testWidgets('should display gender section',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: PokemonDetailTemplate(uiModel: testUiModel),
          ),
        );

        // Wait for initial frame
        await tester.pump();

        // Scroll down to make gender section visible
        await tester.drag(find.byType(CustomScrollView), const Offset(0, -400));
        await tester.pump();

        expect(find.text('87.5%'), findsOneWidget);
        expect(find.text('12.5%'), findsOneWidget);
      });

      testWidgets('should display weaknesses section',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: PokemonDetailTemplate(uiModel: testUiModel),
          ),
        );

        expect(find.text('Debilidades'), findsOneWidget);
        // Should find 2 weakness tags
        expect(
            find.byWidgetPredicate((widget) =>
                widget is AppTypeTag &&
                (widget.type == PokemonType.fire ||
                    widget.type == PokemonType.psychic)),
            findsNWidgets(2));
      });

      testWidgets('should display favorite tag',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: PokemonDetailTemplate(uiModel: testUiModel),
          ),
        );

        expect(find.byType(AppFavoriteTag), findsOneWidget);
      });
    });

    group('Interaction Tests', () {
      testWidgets('should call onBack when back button is pressed',
          (WidgetTester tester) async {
        bool backCalled = false;

        await tester.pumpWidget(
          MaterialApp(
            home: PokemonDetailTemplate(
              uiModel: testUiModel.copyWith(
                onBack: () => backCalled = true,
              ),
            ),
          ),
        );

        // Wait for initial frame
        await tester.pump();

        // Find and tap back button
        final backButton = find.byType(IconButton).first;
        await tester.tap(backButton);
        await tester.pump();

        expect(backCalled, isTrue);
      });

      testWidgets('should toggle favorite when favorite button is pressed',
          (WidgetTester tester) async {
        bool favoriteToggled = false;

        await tester.pumpWidget(
          MaterialApp(
            home: PokemonDetailTemplate(
              uiModel: testUiModel.copyWith(
                onFavoriteToggle: () => favoriteToggled = true,
              ),
            ),
          ),
        );

        // Wait for initial frame
        await tester.pump();

        // Find AppFavoriteTag and tap it using warnIfMissed: false
        final favoriteButton = find.byType(AppFavoriteTag);
        await tester.tap(favoriteButton, warnIfMissed: false);
        await tester.pump();

        expect(favoriteToggled, isTrue);
      });

      testWidgets('should be scrollable', (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: PokemonDetailTemplate(uiModel: testUiModel),
          ),
        );

        // Wait for initial frame
        await tester.pump();

        // Try scrolling down
        await tester.drag(find.byType(CustomScrollView), const Offset(0, -300));
        await tester.pump();

        // Should not crash
        expect(find.byType(CustomScrollView), findsOneWidget);
      });
    });

    group('Gender Bar Tests', () {
      testWidgets('should display correct gender percentages',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: PokemonDetailTemplate(uiModel: testUiModel),
          ),
        );

        expect(find.text('87.5%'), findsOneWidget);
        expect(find.text('12.5%'), findsOneWidget);
      });

      testWidgets('should handle 50/50 gender ratio',
          (WidgetTester tester) async {
        final equalGenderModel = testUiModel.copyWith(
          malePercentage: 50.0,
          femalePercentage: 50.0,
        );

        await tester.pumpWidget(
          MaterialApp(
            home: PokemonDetailTemplate(uiModel: equalGenderModel),
          ),
        );

        expect(find.text('50.0%'), findsNWidgets(2));
      });

      testWidgets('should handle 100% male', (WidgetTester tester) async {
        final allMaleModel = testUiModel.copyWith(
          malePercentage: 100.0,
          femalePercentage: 0.0,
        );

        await tester.pumpWidget(
          MaterialApp(
            home: PokemonDetailTemplate(uiModel: allMaleModel),
          ),
        );

        expect(find.text('100.0%'), findsOneWidget);
        // 0.0% should not be displayed when percentage is 0
        expect(find.text('0.0%'), findsNothing);
      });
    });

    group('Type and Weakness Tests', () {
      testWidgets('should handle single type Pokemon',
          (WidgetTester tester) async {
        final singleTypeModel = testUiModel.copyWith(
          types: [PokemonType.electric],
        );

        await tester.pumpWidget(
          MaterialApp(
            home: PokemonDetailTemplate(uiModel: singleTypeModel),
          ),
        );

        expect(
            find.byWidgetPredicate(
                (widget) => widget is AppTypeTag && widget.type == PokemonType.electric),
            findsOneWidget);
      });

      testWidgets('should handle many weaknesses',
          (WidgetTester tester) async {
        final manyWeaknessesModel = testUiModel.copyWith(
          weaknesses: [
            PokemonType.fire,
            PokemonType.water,
            PokemonType.electric,
            PokemonType.ice,
            PokemonType.rock,
          ],
        );

        await tester.pumpWidget(
          MaterialApp(
            home: PokemonDetailTemplate(uiModel: manyWeaknessesModel),
          ),
        );

        // Should wrap multiple weakness tags
        expect(find.byType(AppTypeTag), findsAtLeastNWidgets(5));
      });

      testWidgets('should display types with correct size',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: PokemonDetailTemplate(uiModel: testUiModel),
          ),
        );

        // Find type tags (grass and poison) with medium size
        final typeTags = tester.widgetList<AppTypeTag>(
          find.byWidgetPredicate((widget) =>
              widget is AppTypeTag &&
              (widget.type == PokemonType.grass ||
                  widget.type == PokemonType.poison)),
        );

        for (final tag in typeTags) {
          expect(tag.size, equals(TypeTagSize.medium));
        }
      });

      testWidgets('should display weaknesses with correct size',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: PokemonDetailTemplate(uiModel: testUiModel),
          ),
        );

        // Find weakness tags (fire and psychic) with small size
        final weaknessTags = tester.widgetList<AppTypeTag>(
          find.byWidgetPredicate((widget) =>
              widget is AppTypeTag &&
              (widget.type == PokemonType.fire ||
                  widget.type == PokemonType.psychic)),
        );

        for (final tag in weaknessTags) {
          expect(tag.size, equals(TypeTagSize.small));
        }
      });
    });

    group('Hero Animation Tests', () {
      testWidgets('should have Hero widget for image',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: PokemonDetailTemplate(uiModel: testUiModel),
          ),
        );

        expect(find.byType(Hero), findsOneWidget);
      });
    });

    group('Favorite State Tests', () {
      testWidgets('should display correct favorite state when false',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: PokemonDetailTemplate(
              uiModel: testUiModel.copyWith(isFavorite: false),
            ),
          ),
        );

        final favoriteTag =
            tester.widget<AppFavoriteTag>(find.byType(AppFavoriteTag));
        expect(favoriteTag.uiModel.isFavorite, isFalse);
      });

      testWidgets('should display correct favorite state when true',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: PokemonDetailTemplate(
              uiModel: testUiModel.copyWith(isFavorite: true),
            ),
          ),
        );

        final favoriteTag =
            tester.widget<AppFavoriteTag>(find.byType(AppFavoriteTag));
        expect(favoriteTag.uiModel.isFavorite, isTrue);
      });
    });
  });

  group('PokemonDetailTemplateUiModel', () {
    test('should create model with all required fields', () {
      const model = PokemonDetailTemplateUiModel(
        number: '001',
        name: 'Bulbasaur',
        imageUrl: 'https://test.com/image.png',
        types: [PokemonType.grass],
        description: 'Test description',
        weight: '6,9 kg',
        height: '0,7 m',
        category: 'SEMILLA',
        ability: 'Espesura',
        malePercentage: 87.5,
        femalePercentage: 12.5,
        weaknesses: [PokemonType.fire],
        primaryColor: Colors.green,
      );

      expect(model.number, equals('001'));
      expect(model.name, equals('Bulbasaur'));
      expect(model.isFavorite, isFalse);
    });

    test('should create copy with updated values', () {
      const original = PokemonDetailTemplateUiModel(
        number: '001',
        name: 'Bulbasaur',
        imageUrl: 'https://test.com/image.png',
        types: [PokemonType.grass],
        description: 'Test description',
        weight: '6,9 kg',
        height: '0,7 m',
        category: 'SEMILLA',
        ability: 'Espesura',
        malePercentage: 87.5,
        femalePercentage: 12.5,
        weaknesses: [PokemonType.fire],
        primaryColor: Colors.green,
        isFavorite: false,
      );

      final copy = original.copyWith(
        isFavorite: true,
        name: 'Updated Name',
      );

      expect(copy.isFavorite, isTrue);
      expect(copy.name, equals('Updated Name'));
      expect(copy.number, equals('001')); // Should keep original value
    });
  });
}
