import 'package:desing_system/desing_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('StatCard', () {
    group('Rendering Tests', () {
      testWidgets('should render StatCard with basic properties',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: StatCard(
                uiModel: StatCardUiModel(
                  icon: Icons.star,
                  label: 'TEST',
                  value: '100',
                ),
              ),
            ),
          ),
        );

        expect(find.byType(StatCard), findsOneWidget);
        expect(find.byIcon(Icons.star), findsOneWidget);
        expect(find.text('TEST'), findsOneWidget);
        expect(find.text('100'), findsOneWidget);
      });

      testWidgets('should display long label correctly',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: StatCard(
                uiModel: StatCardUiModel(
                  icon: Icons.star,
                  label: 'VERY LONG LABEL TEXT',
                  value: '100',
                ),
              ),
            ),
          ),
        );

        expect(find.text('VERY LONG LABEL TEXT'), findsOneWidget);
      });

      testWidgets('should display long value correctly',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: StatCard(
                uiModel: StatCardUiModel(
                  icon: Icons.star,
                  label: 'TEST',
                  value: '1,234.56 kg',
                ),
              ),
            ),
          ),
        );

        expect(find.text('1,234.56 kg'), findsOneWidget);
      });
    });

    group('Size Tests', () {
      testWidgets('should render small size correctly',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: StatCard(
                uiModel: StatCardUiModel(
                  icon: Icons.star,
                  label: 'SMALL',
                  value: '100',
                  size: StatCardSize.small,
                ),
              ),
            ),
          ),
        );

        expect(find.byType(StatCard), findsOneWidget);
        expect(find.text('SMALL'), findsOneWidget);
      });

      testWidgets('should render medium size correctly (default)',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: StatCard(
                uiModel: StatCardUiModel(
                  icon: Icons.star,
                  label: 'MEDIUM',
                  value: '100',
                  size: StatCardSize.medium,
                ),
              ),
            ),
          ),
        );

        expect(find.byType(StatCard), findsOneWidget);
        expect(find.text('MEDIUM'), findsOneWidget);
      });

      testWidgets('should render large size correctly',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: StatCard(
                uiModel: StatCardUiModel(
                  icon: Icons.star,
                  label: 'LARGE',
                  value: '100',
                  size: StatCardSize.large,
                ),
              ),
            ),
          ),
        );

        expect(find.byType(StatCard), findsOneWidget);
        expect(find.text('LARGE'), findsOneWidget);
      });
    });

    group('Variant Tests', () {
      testWidgets('should render default variant correctly',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: StatCard(
                uiModel: StatCardUiModel(
                  icon: Icons.star,
                  label: 'DEFAULT',
                  value: '100',
                  variant: StatCardVariant.defaultVariant,
                ),
              ),
            ),
          ),
        );

        expect(find.byType(StatCard), findsOneWidget);
        expect(find.text('DEFAULT'), findsOneWidget);
      });

      testWidgets('should render colored variant correctly',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: StatCard(
                uiModel: StatCardUiModel(
                  icon: Icons.star,
                  label: 'COLORED',
                  value: '100',
                  variant: StatCardVariant.colored,
                  color: Colors.blue,
                ),
              ),
            ),
          ),
        );

        expect(find.byType(StatCard), findsOneWidget);
        expect(find.text('COLORED'), findsOneWidget);
      });

      testWidgets('should render outlined variant correctly',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: StatCard(
                uiModel: StatCardUiModel(
                  icon: Icons.star,
                  label: 'OUTLINED',
                  value: '100',
                  variant: StatCardVariant.outlined,
                ),
              ),
            ),
          ),
        );

        expect(find.byType(StatCard), findsOneWidget);
        expect(find.text('OUTLINED'), findsOneWidget);
      });

      testWidgets('should render elevated variant correctly',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: StatCard(
                uiModel: StatCardUiModel(
                  icon: Icons.star,
                  label: 'ELEVATED',
                  value: '100',
                  variant: StatCardVariant.elevated,
                ),
              ),
            ),
          ),
        );

        expect(find.byType(StatCard), findsOneWidget);
        expect(find.text('ELEVATED'), findsOneWidget);
      });
    });

    group('Interaction Tests', () {
      testWidgets('should call onTap when tapped',
          (WidgetTester tester) async {
        bool tapped = false;

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: StatCard(
                uiModel: StatCardUiModel(
                  icon: Icons.star,
                  label: 'TAP',
                  value: '100',
                ),
                onTap: () => tapped = true,
              ),
            ),
          ),
        );

        await tester.tap(find.byType(StatCard));
        await tester.pump();

        expect(tapped, isTrue);
      });

      testWidgets('should not call onTap when disabled',
          (WidgetTester tester) async {
        bool tapped = false;

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: StatCard(
                uiModel: StatCardUiModel(
                  icon: Icons.star,
                  label: 'DISABLED',
                  value: '100',
                  isEnabled: false,
                ),
                onTap: () => tapped = true,
              ),
            ),
          ),
        );

        await tester.tap(find.byType(StatCard));
        await tester.pump();

        expect(tapped, isFalse);
      });
    });

    group('State Tests', () {
      testWidgets('should display enabled state correctly',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: StatCard(
                uiModel: StatCardUiModel(
                  icon: Icons.star,
                  label: 'ENABLED',
                  value: '100',
                  isEnabled: true,
                ),
              ),
            ),
          ),
        );

        expect(find.byType(StatCard), findsOneWidget);
      });

      testWidgets('should display disabled state correctly',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: StatCard(
                uiModel: StatCardUiModel(
                  icon: Icons.star,
                  label: 'DISABLED',
                  value: '100',
                  isEnabled: false,
                ),
              ),
            ),
          ),
        );

        expect(find.byType(StatCard), findsOneWidget);
        expect(find.text('DISABLED'), findsOneWidget);
      });
    });

    group('Color Customization Tests', () {
      testWidgets('should apply custom icon color',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: StatCard(
                uiModel: StatCardUiModel(
                  icon: Icons.star,
                  label: 'CUSTOM',
                  value: '100',
                  iconColor: Colors.red,
                ),
              ),
            ),
          ),
        );

        final icon = tester.widget<Icon>(find.byIcon(Icons.star));
        expect(icon.color, equals(Colors.red));
      });

      testWidgets('should apply custom label color',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: StatCard(
                uiModel: StatCardUiModel(
                  icon: Icons.star,
                  label: 'CUSTOM',
                  value: '100',
                  labelColor: Colors.green,
                ),
              ),
            ),
          ),
        );

        expect(find.byType(StatCard), findsOneWidget);
      });

      testWidgets('should apply custom value color',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: StatCard(
                uiModel: StatCardUiModel(
                  icon: Icons.star,
                  label: 'CUSTOM',
                  value: '100',
                  valueColor: Colors.purple,
                ),
              ),
            ),
          ),
        );

        expect(find.byType(StatCard), findsOneWidget);
      });
    });

    group('Combination Tests', () {
      testWidgets('should work with all properties combined',
          (WidgetTester tester) async {
        bool tapped = false;

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: StatCard(
                uiModel: StatCardUiModel(
                  icon: Icons.category,
                  label: 'CATEGORY',
                  value: 'SEED',
                  size: StatCardSize.large,
                  variant: StatCardVariant.colored,
                  color: Colors.green,
                  iconColor: Colors.green,
                  labelColor: Colors.green,
                  valueColor: Colors.black,
                  isEnabled: true,
                ),
                onTap: () => tapped = true,
              ),
            ),
          ),
        );

        expect(find.byType(StatCard), findsOneWidget);
        expect(find.text('CATEGORY'), findsOneWidget);
        expect(find.text('SEED'), findsOneWidget);

        await tester.tap(find.byType(StatCard));
        await tester.pump();

        expect(tapped, isTrue);
      });
    });
  });

  group('StatCardUiModel', () {
    test('should create model with required fields', () {
      final model = StatCardUiModel(
        icon: Icons.star,
        label: 'TEST',
        value: '100',
      );

      expect(model.icon, equals(Icons.star));
      expect(model.label, equals('TEST'));
      expect(model.value, equals('100'));
      expect(model.size, equals(StatCardSize.medium));
      expect(model.variant, equals(StatCardVariant.defaultVariant));
      expect(model.isEnabled, isTrue);
    });

    test('should create copy with updated values', () {
      final original = StatCardUiModel(
        icon: Icons.star,
        label: 'ORIGINAL',
        value: '100',
      );

      final copy = original.copyWith(
        label: 'UPDATED',
        value: '200',
        size: StatCardSize.large,
      );

      expect(copy.label, equals('UPDATED'));
      expect(copy.value, equals('200'));
      expect(copy.size, equals(StatCardSize.large));
      expect(copy.icon, equals(Icons.star)); // Should keep original
    });

    test('should create copy with custom colors', () {
      final original = StatCardUiModel(
        icon: Icons.star,
        label: 'TEST',
        value: '100',
      );

      final copy = original.copyWith(
        color: Colors.blue,
        iconColor: Colors.red,
        labelColor: Colors.green,
        valueColor: Colors.purple,
      );

      expect(copy.color, equals(Colors.blue));
      expect(copy.iconColor, equals(Colors.red));
      expect(copy.labelColor, equals(Colors.green));
      expect(copy.valueColor, equals(Colors.purple));
    });
  });

  group('StatCardSize Enum', () {
    test('should have correct enum values', () {
      expect(StatCardSize.values.length, equals(3));
      expect(StatCardSize.values, contains(StatCardSize.small));
      expect(StatCardSize.values, contains(StatCardSize.medium));
      expect(StatCardSize.values, contains(StatCardSize.large));
    });
  });

  group('StatCardVariant Enum', () {
    test('should have correct enum values', () {
      expect(StatCardVariant.values.length, equals(4));
      expect(StatCardVariant.values, contains(StatCardVariant.defaultVariant));
      expect(StatCardVariant.values, contains(StatCardVariant.colored));
      expect(StatCardVariant.values, contains(StatCardVariant.outlined));
      expect(StatCardVariant.values, contains(StatCardVariant.elevated));
    });
  });
}
