import 'package:desing_system/desing_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('GenderBar', () {
    group('Rendering Tests', () {
      testWidgets('should render GenderBar with basic properties',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: GenderBar(
                uiModel: GenderBarUiModel(
                  malePercentage: 50.0,
                  femalePercentage: 50.0,
                ),
              ),
            ),
          ),
        );

        expect(find.byType(GenderBar), findsOneWidget);
        expect(find.text('50.0%'), findsNWidgets(2));
      });

      testWidgets('should display title when provided',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: GenderBar(
                uiModel: GenderBarUiModel(
                  malePercentage: 87.5,
                  femalePercentage: 12.5,
                  title: 'GÉNERO',
                ),
              ),
            ),
          ),
        );

        expect(find.text('GÉNERO'), findsOneWidget);
        expect(find.text('87.5%'), findsOneWidget);
        expect(find.text('12.5%'), findsOneWidget);
      });

      testWidgets('should display gender icons when showIcons is true',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: GenderBar(
                uiModel: GenderBarUiModel(
                  malePercentage: 50.0,
                  femalePercentage: 50.0,
                  showIcons: true,
                ),
              ),
            ),
          ),
        );

        expect(find.byIcon(Icons.male), findsOneWidget);
        expect(find.byIcon(Icons.female), findsOneWidget);
      });

      testWidgets('should not display gender icons when showIcons is false',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: GenderBar(
                uiModel: GenderBarUiModel(
                  malePercentage: 50.0,
                  femalePercentage: 50.0,
                  showIcons: false,
                ),
              ),
            ),
          ),
        );

        expect(find.byIcon(Icons.male), findsNothing);
        expect(find.byIcon(Icons.female), findsNothing);
      });
    });

    group('Variant Tests', () {
      testWidgets('should render detailed variant correctly',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: GenderBar(
                uiModel: GenderBarUiModel(
                  malePercentage: 75.0,
                  femalePercentage: 25.0,
                  variant: GenderBarVariant.detailed,
                ),
              ),
            ),
          ),
        );

        expect(find.byType(GenderBar), findsOneWidget);
        expect(find.text('75.0%'), findsOneWidget);
        expect(find.text('25.0%'), findsOneWidget);
      });

      testWidgets('should render simple variant correctly',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: GenderBar(
                uiModel: GenderBarUiModel(
                  malePercentage: 60.0,
                  femalePercentage: 40.0,
                  variant: GenderBarVariant.simple,
                ),
              ),
            ),
          ),
        );

        expect(find.byType(GenderBar), findsOneWidget);
        expect(find.text('60.0%'), findsOneWidget);
        expect(find.text('40.0%'), findsOneWidget);
      });

      testWidgets('should render compact variant without labels',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: GenderBar(
                uiModel: GenderBarUiModel(
                  malePercentage: 50.0,
                  femalePercentage: 50.0,
                  variant: GenderBarVariant.compact,
                ),
              ),
            ),
          ),
        );

        expect(find.byType(GenderBar), findsOneWidget);
        // Compact variant should not show labels
        expect(find.text('50.0%'), findsNothing);
      });
    });

    group('Size Tests', () {
      testWidgets('should render small size correctly',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: GenderBar(
                uiModel: GenderBarUiModel(
                  malePercentage: 50.0,
                  femalePercentage: 50.0,
                  size: GenderBarSize.small,
                ),
              ),
            ),
          ),
        );

        expect(find.byType(GenderBar), findsOneWidget);
      });

      testWidgets('should render medium size correctly',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: GenderBar(
                uiModel: GenderBarUiModel(
                  malePercentage: 50.0,
                  femalePercentage: 50.0,
                  size: GenderBarSize.medium,
                ),
              ),
            ),
          ),
        );

        expect(find.byType(GenderBar), findsOneWidget);
      });

      testWidgets('should render large size correctly',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: GenderBar(
                uiModel: GenderBarUiModel(
                  malePercentage: 50.0,
                  femalePercentage: 50.0,
                  size: GenderBarSize.large,
                ),
              ),
            ),
          ),
        );

        expect(find.byType(GenderBar), findsOneWidget);
      });
    });

    group('Special Cases Tests', () {
      testWidgets('should handle 100% male correctly',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: GenderBar(
                uiModel: GenderBarUiModel(
                  malePercentage: 100.0,
                  femalePercentage: 0.0,
                ),
              ),
            ),
          ),
        );

        expect(find.byType(GenderBar), findsOneWidget);
        expect(find.text('100.0%'), findsOneWidget);
        expect(find.text('0.0%'), findsNothing); // Should not show 0%
      });

      testWidgets('should handle 100% female correctly',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: GenderBar(
                uiModel: GenderBarUiModel(
                  malePercentage: 0.0,
                  femalePercentage: 100.0,
                ),
              ),
            ),
          ),
        );

        expect(find.byType(GenderBar), findsOneWidget);
        expect(find.text('100.0%'), findsOneWidget);
        expect(find.text('0.0%'), findsNothing); // Should not show 0%
      });

      testWidgets('should show error for genderless (0/0) as it is invalid',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: GenderBar(
                uiModel: GenderBarUiModel(
                  malePercentage: 0.0,
                  femalePercentage: 0.0,
                ),
              ),
            ),
          ),
        );

        expect(find.byType(GenderBar), findsOneWidget);
        // 0/0 is invalid (sum is not 100), should show error widget
        expect(find.byIcon(Icons.error_outline), findsOneWidget);
      });

      testWidgets('should show error when percentages do not sum to 100',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: GenderBar(
                uiModel: GenderBarUiModel(
                  malePercentage: 60.0,
                  femalePercentage: 30.0, // Sum is 90, not 100
                ),
              ),
            ),
          ),
        );

        expect(find.byType(GenderBar), findsOneWidget);
        expect(find.byIcon(Icons.error_outline), findsOneWidget);
        expect(find.textContaining('90.0%'), findsOneWidget);
      });
    });

    group('Percentage Tests', () {
      testWidgets('should display 87.5% / 12.5% correctly',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: GenderBar(
                uiModel: GenderBarUiModel(
                  malePercentage: 87.5,
                  femalePercentage: 12.5,
                ),
              ),
            ),
          ),
        );

        expect(find.text('87.5%'), findsOneWidget);
        expect(find.text('12.5%'), findsOneWidget);
      });

      testWidgets('should display 50% / 50% correctly',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: GenderBar(
                uiModel: GenderBarUiModel(
                  malePercentage: 50.0,
                  femalePercentage: 50.0,
                ),
              ),
            ),
          ),
        );

        expect(find.text('50.0%'), findsNWidgets(2));
      });

      testWidgets('should display 25% / 75% correctly',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: GenderBar(
                uiModel: GenderBarUiModel(
                  malePercentage: 25.0,
                  femalePercentage: 75.0,
                ),
              ),
            ),
          ),
        );

        expect(find.text('25.0%'), findsOneWidget);
        expect(find.text('75.0%'), findsOneWidget);
      });
    });

    group('Color Customization Tests', () {
      testWidgets('should apply custom male color',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: GenderBar(
                uiModel: GenderBarUiModel(
                  malePercentage: 50.0,
                  femalePercentage: 50.0,
                  maleColor: Colors.green,
                ),
              ),
            ),
          ),
        );

        expect(find.byType(GenderBar), findsOneWidget);
      });

      testWidgets('should apply custom female color',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: GenderBar(
                uiModel: GenderBarUiModel(
                  malePercentage: 50.0,
                  femalePercentage: 50.0,
                  femaleColor: Colors.purple,
                ),
              ),
            ),
          ),
        );

        expect(find.byType(GenderBar), findsOneWidget);
      });
    });
  });

  group('GenderBarUiModel', () {
    test('should create model with required fields', () {
      final model = GenderBarUiModel(
        malePercentage: 50.0,
        femalePercentage: 50.0,
      );

      expect(model.malePercentage, equals(50.0));
      expect(model.femalePercentage, equals(50.0));
      expect(model.variant, equals(GenderBarVariant.detailed));
      expect(model.size, equals(GenderBarSize.medium));
      expect(model.showIcons, isTrue);
      expect(model.showLabels, isTrue);
    });

    test('should validate percentages correctly', () {
      final validModel = GenderBarUiModel(
        malePercentage: 60.0,
        femalePercentage: 40.0,
      );
      expect(validModel.isValid, isTrue);

      final invalidModel = GenderBarUiModel(
        malePercentage: 60.0,
        femalePercentage: 30.0,
      );
      expect(invalidModel.isValid, isFalse);
    });

    test('should detect male-only correctly', () {
      final model = GenderBarUiModel(
        malePercentage: 100.0,
        femalePercentage: 0.0,
      );
      expect(model.isMaleOnly, isTrue);
      expect(model.isFemaleOnly, isFalse);
      expect(model.isGenderless, isFalse);
    });

    test('should detect female-only correctly', () {
      final model = GenderBarUiModel(
        malePercentage: 0.0,
        femalePercentage: 100.0,
      );
      expect(model.isMaleOnly, isFalse);
      expect(model.isFemaleOnly, isTrue);
      expect(model.isGenderless, isFalse);
    });

    test('should detect genderless correctly', () {
      final model = GenderBarUiModel(
        malePercentage: 0.0,
        femalePercentage: 0.0,
      );
      // When both are 0, both isMaleOnly and isFemaleOnly are true
      // because each checks if the OTHER percentage is 0
      expect(model.isMaleOnly, isTrue); // femalePercentage == 0
      expect(model.isFemaleOnly, isTrue); // malePercentage == 0
      expect(model.isGenderless, isTrue); // both == 0
      expect(model.isValid, isFalse); // 0/0 doesn't sum to 100
    });

    test('should calculate flex values correctly', () {
      final model = GenderBarUiModel(
        malePercentage: 87.5,
        femalePercentage: 12.5,
      );
      expect(model.maleFlexValue, equals(8750));
      expect(model.femaleFlexValue, equals(1250));
    });

    test('should create copy with updated values', () {
      final original = GenderBarUiModel(
        malePercentage: 50.0,
        femalePercentage: 50.0,
      );

      final copy = original.copyWith(
        malePercentage: 75.0,
        femalePercentage: 25.0,
        variant: GenderBarVariant.simple,
      );

      expect(copy.malePercentage, equals(75.0));
      expect(copy.femalePercentage, equals(25.0));
      expect(copy.variant, equals(GenderBarVariant.simple));
      expect(copy.size, equals(GenderBarSize.medium)); // Should keep original
    });

    test('should throw assertion error for invalid male percentage', () {
      expect(
        () => GenderBarUiModel(
          malePercentage: -10.0,
          femalePercentage: 50.0,
        ),
        throwsA(isA<AssertionError>()),
      );

      expect(
        () => GenderBarUiModel(
          malePercentage: 110.0,
          femalePercentage: 50.0,
        ),
        throwsA(isA<AssertionError>()),
      );
    });

    test('should throw assertion error for invalid female percentage', () {
      expect(
        () => GenderBarUiModel(
          malePercentage: 50.0,
          femalePercentage: -10.0,
        ),
        throwsA(isA<AssertionError>()),
      );

      expect(
        () => GenderBarUiModel(
          malePercentage: 50.0,
          femalePercentage: 110.0,
        ),
        throwsA(isA<AssertionError>()),
      );
    });
  });

  group('GenderBarVariant Enum', () {
    test('should have correct enum values', () {
      expect(GenderBarVariant.values.length, equals(3));
      expect(GenderBarVariant.values, contains(GenderBarVariant.detailed));
      expect(GenderBarVariant.values, contains(GenderBarVariant.simple));
      expect(GenderBarVariant.values, contains(GenderBarVariant.compact));
    });
  });

  group('GenderBarSize Enum', () {
    test('should have correct enum values', () {
      expect(GenderBarSize.values.length, equals(3));
      expect(GenderBarSize.values, contains(GenderBarSize.small));
      expect(GenderBarSize.values, contains(GenderBarSize.medium));
      expect(GenderBarSize.values, contains(GenderBarSize.large));
    });
  });
}
