import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../../lib/molecules/app_type_tag/app_type_tag.dart';

void main() {
  group('AppTypeTag', () {
    group('Type Rendering Tests', () {
      testWidgets('Water type renders correctly', (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppTypeTag(type: PokemonType.water),
            ),
          ),
        );

        expect(find.text('Agua'), findsOneWidget);
        expect(find.byType(AppTypeTag), findsOneWidget);
      });

      testWidgets('Fire type renders correctly', (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppTypeTag(type: PokemonType.fire),
            ),
          ),
        );

        expect(find.text('Fuego'), findsOneWidget);
      });

      testWidgets('All 18 types render with correct labels',
          (WidgetTester tester) async {
        final types = PokemonType.values;
        final labels = [
          'Agua',
          'Dragón',
          'Eléctrico',
          'Hada',
          'Fantasma',
          'Fuego',
          'Hielo',
          'Planta',
          'Bicho',
          'Lucha',
          'Normal',
          'Siniestro',
          'Acero',
          'Veneno',
          'Psíquico',
          'Roca',
          'Tierra',
          'Volador',
        ];

        for (int i = 0; i < types.length; i++) {
          await tester.pumpWidget(
            MaterialApp(
              home: Scaffold(
                body: AppTypeTag(type: types[i]),
              ),
            ),
          );

          expect(find.text(labels[i]), findsOneWidget);
        }
      });
    });

    group('Size Tests', () {
      testWidgets('Small size renders with correct height',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppTypeTag(
                type: PokemonType.fire,
                size: TypeTagSize.small,
              ),
            ),
          ),
        );

        final container = find.byType(Container).first;
        expect(
          tester.getSize(container).height,
          28,
        );
      });

      testWidgets('Medium size renders with correct height',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppTypeTag(
                type: PokemonType.fire,
                size: TypeTagSize.medium,
              ),
            ),
          ),
        );

        final container = find.byType(Container).first;
        expect(
          tester.getSize(container).height,
          36,
        );
      });

      testWidgets('Large size renders with correct height',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppTypeTag(
                type: PokemonType.fire,
                size: TypeTagSize.large,
              ),
            ),
          ),
        );

        final container = find.byType(Container).first;
        expect(
          tester.getSize(container).height,
          44,
        );
      });

      testWidgets('Small to large sizes render consistently',
          (WidgetTester tester) async {
        final sizes = [TypeTagSize.small, TypeTagSize.medium, TypeTagSize.large];
        final heights = [28.0, 36.0, 44.0];

        for (int i = 0; i < sizes.length; i++) {
          await tester.pumpWidget(
            MaterialApp(
              home: Scaffold(
                body: AppTypeTag(
                  type: PokemonType.water,
                  size: sizes[i],
                ),
              ),
            ),
          );

          final container = find.byType(Container).first;
          expect(
            tester.getSize(container).height,
            heights[i],
          );
        }
      });
    });

    group('Color Tests', () {
      testWidgets('Water type has correct background color',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppTypeTag(type: PokemonType.water),
            ),
          ),
        );

        final container = find.byType(Container).first;
        final widget = tester.widget<Container>(container);
        final decoration = widget.decoration as BoxDecoration;

        expect(decoration.color, PokemonType.water.backgroundColor);
      });

      testWidgets('Fire type has correct background color',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppTypeTag(type: PokemonType.fire),
            ),
          ),
        );

        final container = find.byType(Container).first;
        final widget = tester.widget<Container>(container);
        final decoration = widget.decoration as BoxDecoration;

        expect(decoration.color, PokemonType.fire.backgroundColor);
      });

      testWidgets('All types have different background colors',
          (WidgetTester tester) async {
        final colors = <Color>{};

        for (final type in PokemonType.values) {
          colors.add(type.backgroundColor);
        }

        expect(colors.length, PokemonType.values.length);
      });

      testWidgets('Text color is always white', (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppTypeTag(type: PokemonType.grass),
            ),
          ),
        );

        final text = find.byType(Text);
        final widget = tester.widget<Text>(text);

        expect(widget.style?.color, Colors.white);
      });
    });

    group('Full Width Tests', () {
      testWidgets('fullWidth=false renders min width', (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Center(
                child: AppTypeTag(
                  type: PokemonType.electric,
                  fullWidth: false,
                ),
              ),
            ),
          ),
        );

        expect(find.byType(AppTypeTag), findsOneWidget);
      });

      testWidgets('fullWidth=true expands to full width',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Padding(
                padding: const EdgeInsets.all(16),
                child: AppTypeTag(
                  type: PokemonType.electric,
                  fullWidth: true,
                ),
              ),
            ),
          ),
        );

        expect(find.byType(AppTypeTag), findsOneWidget);
      });
    });

    group('Widget Structure Tests', () {
      testWidgets('Contains Row with Icon and Text',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppTypeTag(type: PokemonType.dragon),
            ),
          ),
        );

        expect(find.byType(Row), findsOneWidget);
        expect(find.byType(Text), findsOneWidget);
      });

      testWidgets('Has rounded border radius', (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppTypeTag(type: PokemonType.psychic),
            ),
          ),
        );

        final container = find.byType(Container).first;
        final widget = tester.widget<Container>(container);
        final decoration = widget.decoration as BoxDecoration;

        expect(decoration.borderRadius, isNotNull);
      });

      testWidgets('Text has correct weight and letter spacing',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppTypeTag(type: PokemonType.grass),
            ),
          ),
        );

        final text = find.byType(Text);
        final widget = tester.widget<Text>(text);

        expect(widget.style?.fontWeight, FontWeight.w600);
        expect(widget.style?.letterSpacing, 0.5);
      });
    });

    group('Extension Tests', () {
      test('PokemonTypeExtension labels are correct', () {
        expect(PokemonType.water.label, 'Agua');
        expect(PokemonType.dragon.label, 'Dragón');
        expect(PokemonType.electric.label, 'Eléctrico');
        expect(PokemonType.fairy.label, 'Hada');
        expect(PokemonType.ghost.label, 'Fantasma');
        expect(PokemonType.fire.label, 'Fuego');
        expect(PokemonType.ice.label, 'Hielo');
        expect(PokemonType.grass.label, 'Planta');
        expect(PokemonType.bug.label, 'Bicho');
        expect(PokemonType.fighting.label, 'Lucha');
        expect(PokemonType.normal.label, 'Normal');
        expect(PokemonType.dark.label, 'Siniestro');
        expect(PokemonType.steel.label, 'Acero');
        expect(PokemonType.poison.label, 'Veneno');
        expect(PokemonType.psychic.label, 'Psíquico');
        expect(PokemonType.rock.label, 'Roca');
        expect(PokemonType.ground.label, 'Tierra');
        expect(PokemonType.flying.label, 'Volador');
      });

      test('PokemonTypeExtension SVG assets are correct', () {
        expect(PokemonType.water.svgAsset, 'assets/elements/Typewater.svg');
        expect(PokemonType.fire.svgAsset, 'assets/elements/Typefire.svg');
        expect(PokemonType.grass.svgAsset, 'assets/elements/Typegrass.svg');
      });

      test('TypeTagSizeExtension heights are correct', () {
        expect(TypeTagSize.small.height, 28);
        expect(TypeTagSize.medium.height, 36);
        expect(TypeTagSize.large.height, 44);
      });

      test('TypeTagSizeExtension font sizes are correct', () {
        expect(TypeTagSize.small.fontSize, 12);
        expect(TypeTagSize.medium.fontSize, 14);
        expect(TypeTagSize.large.fontSize, 16);
      });
    });

    group('Combined Functionality Tests', () {
      testWidgets('Multiple types render different colors',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Column(
                children: [
                  AppTypeTag(type: PokemonType.fire),
                  AppTypeTag(type: PokemonType.water),
                  AppTypeTag(type: PokemonType.grass),
                ],
              ),
            ),
          ),
        );

        expect(find.text('Fuego'), findsOneWidget);
        expect(find.text('Agua'), findsOneWidget);
        expect(find.text('Planta'), findsOneWidget);
      });

      testWidgets('Different sizes in same view render correctly',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Column(
                children: [
                  AppTypeTag(
                    type: PokemonType.electric,
                    size: TypeTagSize.small,
                  ),
                  AppTypeTag(
                    type: PokemonType.electric,
                    size: TypeTagSize.medium,
                  ),
                  AppTypeTag(
                    type: PokemonType.electric,
                    size: TypeTagSize.large,
                  ),
                ],
              ),
            ),
          ),
        );

        expect(find.byType(AppTypeTag), findsWidgets);
      });
    });
  });
}
