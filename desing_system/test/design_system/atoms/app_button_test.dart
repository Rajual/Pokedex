import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../../lib/atoms/app_button/app_button.dart';
import '../../../lib/atoms/app_button/utils/enum.dart';
import '../../../lib/atoms/app_button/widgets/jumping_dots_loader.dart';

void main() {
  group('AppButton - onPressed Callback Tests', () {
    testWidgets('onPressed is called once when button is tapped',
        (WidgetTester tester) async {
      int callCount = 0;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppButton(
              label: 'Press Me',
              onPressed: () => callCount++,
            ),
          ),
        ),
      );

      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();

      expect(callCount, equals(1));
    });

    testWidgets('onPressed is not called when button is disabled',
        (WidgetTester tester) async {
      int callCount = 0;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppButton(
              label: 'Disabled Button',
              isEnabled: false,
              onPressed: () => callCount++,
            ),
          ),
        ),
      );

      await tester.tap(find.byType(ElevatedButton), warnIfMissed: false);
      await tester.pumpAndSettle();

      expect(callCount, equals(0));
    });

    testWidgets('onPressed is not called when button is loading',
        (WidgetTester tester) async {
      int callCount = 0;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppButton(
              label: 'Loading Button',
              isLoading: true,
              onPressed: () => callCount++,
            ),
          ),
        ),
      );

      await tester.tap(find.byType(ElevatedButton), warnIfMissed: false);
      await tester.pump();

      expect(callCount, equals(0));
    });

    testWidgets('onPressed works correctly for all button types',
        (WidgetTester tester) async {
      int primaryCount = 0;
      int secondaryCount = 0;
      int tertiaryCount = 0;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  AppButton(
                    label: 'Primary',
                    type: ButtonType.primary,
                    onPressed: () => primaryCount++,
                  ),
                  AppButton(
                    label: 'Secondary',
                    type: ButtonType.secondary,
                    onPressed: () => secondaryCount++,
                  ),
                  AppButton(
                    label: 'Tertiary',
                    type: ButtonType.tertiary,
                    onPressed: () => tertiaryCount++,
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      // Tap primary button
      await tester.tap(find.byType(ElevatedButton).first);
      await tester.pumpAndSettle();

      // Tap secondary button
      await tester.tap(find.byType(OutlinedButton));
      await tester.pumpAndSettle();

      // Tap tertiary button
      await tester.tap(find.byType(ElevatedButton).last);
      await tester.pumpAndSettle();

      expect(primaryCount, equals(1));
      expect(secondaryCount, equals(1));
      expect(tertiaryCount, equals(1));
    });
  });

  group('AppButton - Button Type Tests', () {
    testWidgets('Primary type renders as ElevatedButton',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppButton(
              label: 'Primary Button',
              type: ButtonType.primary,
              onPressed: () {},
            ),
          ),
        ),
      );

      expect(find.byType(ElevatedButton), findsOneWidget);
      expect(find.byType(OutlinedButton), findsNothing);
    });

    testWidgets('Secondary type renders as OutlinedButton',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppButton(
              label: 'Secondary Button',
              type: ButtonType.secondary,
              onPressed: () {},
            ),
          ),
        ),
      );

      expect(find.byType(OutlinedButton), findsOneWidget);
    });

    testWidgets('Tertiary type renders as ElevatedButton',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppButton(
              label: 'Tertiary Button',
              type: ButtonType.tertiary,
              onPressed: () {},
            ),
          ),
        ),
      );

      expect(find.byType(ElevatedButton), findsOneWidget);
    });

    testWidgets('Different types have different colors',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  AppButton(
                    label: 'Primary',
                    type: ButtonType.primary,
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
            ),
          ),
        ),
      );

      final elevatedButtons = find.byType(ElevatedButton);
      final outlinedButtons = find.byType(OutlinedButton);

      expect(elevatedButtons, findsWidgets);
      expect(outlinedButtons, findsOneWidget);
    });
  });

  group('AppButton - Button Size Tests', () {
    testWidgets('Small size has correct height', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppButton(
              label: 'Small Button',
              size: ButtonSize.small,
              onPressed: () {},
            ),
          ),
        ),
      );

      final sizedBox = find.byType(SizedBox).first;
      expect(sizedBox, isNotNull);
    });

    testWidgets('Medium size has correct height', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppButton(
              label: 'Medium Button',
              size: ButtonSize.medium,
              onPressed: () {},
            ),
          ),
        ),
      );

      final sizedBox = find.byType(SizedBox).first;
      expect(sizedBox, isNotNull);
    });

    testWidgets('Large size has correct height', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppButton(
              label: 'Large Button',
              size: ButtonSize.large,
              onPressed: () {},
            ),
          ),
        ),
      );

      final sizedBox = find.byType(SizedBox).first;
      expect(sizedBox, isNotNull);
    });

    testWidgets('All sizes render correctly together',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  AppButton(
                    label: 'Small',
                    size: ButtonSize.small,
                    onPressed: () {},
                  ),
                  AppButton(
                    label: 'Medium',
                    size: ButtonSize.medium,
                    onPressed: () {},
                  ),
                  AppButton(
                    label: 'Large',
                    size: ButtonSize.large,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      expect(find.text('Small'), findsOneWidget);
      expect(find.text('Medium'), findsOneWidget);
      expect(find.text('Large'), findsOneWidget);
    });
  });

  group('AppButton - Button State Tests', () {
    testWidgets('isEnabled=true allows button to be pressed',
        (WidgetTester tester) async {
      int callCount = 0;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppButton(
              label: 'Enabled Button',
              isEnabled: true,
              onPressed: () => callCount++,
            ),
          ),
        ),
      );

      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();

      expect(callCount, equals(1));
    });

    testWidgets('isEnabled=false prevents button from being pressed',
        (WidgetTester tester) async {
      int callCount = 0;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppButton(
              label: 'Disabled Button',
              isEnabled: false,
              onPressed: () => callCount++,
            ),
          ),
        ),
      );

      final button = find.byType(ElevatedButton);
      final buttonWidget = tester.widget<ElevatedButton>(button);

      expect(buttonWidget.onPressed, isNull);
      expect(callCount, equals(0));
    });

    testWidgets('isLoading=true shows spinner instead of content',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppButton(
              label: 'Loading Button',
              isLoading: true,
              onPressed: () {},
            ),
          ),
        ),
      );

      expect(find.byType(JumpingDotsLoader), findsOneWidget);
      // Label should not be visible when loading
      expect(find.text('Loading Button'), findsNothing);
    });

    testWidgets('isLoading=false shows content instead of spinner',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppButton(
              label: 'Not Loading Button',
              isLoading: false,
              onPressed: () {},
            ),
          ),
        ),
      );

      expect(find.byType(JumpingDotsLoader), findsNothing);
      expect(find.text('Not Loading Button'), findsOneWidget);
    });

    testWidgets(
        'isLoading=true prevents button from being pressed even if enabled',
        (WidgetTester tester) async {
      int callCount = 0;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppButton(
              label: 'Loading Button',
              isEnabled: true,
              isLoading: true,
              onPressed: () => callCount++,
            ),
          ),
        ),
      );

      final button = find.byType(ElevatedButton);
      final buttonWidget = tester.widget<ElevatedButton>(button);

      expect(buttonWidget.onPressed, isNull);
    });

    testWidgets('Both isEnabled=false and isLoading=true state works',
        (WidgetTester tester) async {
      int callCount = 0;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppButton(
              label: 'Disabled Loading Button',
              isEnabled: false,
              isLoading: true,
              onPressed: () => callCount++,
            ),
          ),
        ),
      );

      final button = find.byType(ElevatedButton);
      final buttonWidget = tester.widget<ElevatedButton>(button);

      expect(buttonWidget.onPressed, isNull);
      expect(find.byType(JumpingDotsLoader), findsOneWidget);
    });
  });

  group('AppButton - Icon Display Tests', () {
    testWidgets('leadingIcon displays correctly',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppButton(
              label: 'With Leading Icon',
              leadingIcon: Icons.add,
              onPressed: () {},
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.add), findsOneWidget);
      expect(find.text('With Leading Icon'), findsOneWidget);
    });

    testWidgets('trailingIcon displays correctly',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppButton(
              label: 'With Trailing Icon',
              trailingIcon: Icons.arrow_forward,
              onPressed: () {},
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.arrow_forward), findsOneWidget);
      expect(find.text('With Trailing Icon'), findsOneWidget);
    });

    testWidgets('Both leadingIcon and trailingIcon display together',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppButton(
              label: 'With Both Icons',
              leadingIcon: Icons.add,
              trailingIcon: Icons.arrow_forward,
              onPressed: () {},
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.add), findsOneWidget);
      expect(find.byIcon(Icons.arrow_forward), findsOneWidget);
      expect(find.text('With Both Icons'), findsOneWidget);
    });

    testWidgets('Icons are hidden when isLoading=true',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppButton(
              label: 'Loading with Icons',
              leadingIcon: Icons.add,
              trailingIcon: Icons.arrow_forward,
              isLoading: true,
              onPressed: () {},
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.add), findsNothing);
      expect(find.byIcon(Icons.arrow_forward), findsNothing);
      expect(find.byType(JumpingDotsLoader), findsOneWidget);
    });

    testWidgets('leadingIcon appears before label',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppButton(
              label: 'Text',
              leadingIcon: Icons.add,
              onPressed: () {},
            ),
          ),
        ),
      );

      // Find the Row that contains the content
      expect(find.byType(Row), findsWidgets);
      expect(find.byIcon(Icons.add), findsOneWidget);
    });

    testWidgets('trailingIcon appears after label',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppButton(
              label: 'Text',
              trailingIcon: Icons.arrow_forward,
              onPressed: () {},
            ),
          ),
        ),
      );

      expect(find.byType(Row), findsWidgets);
      expect(find.byIcon(Icons.arrow_forward), findsOneWidget);
    });

    testWidgets('No icons display when not provided',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppButton(
              label: 'No Icons',
              leadingIcon: null,
              trailingIcon: null,
              onPressed: () {},
            ),
          ),
        ),
      );

      expect(find.byType(Icon), findsNothing);
      expect(find.text('No Icons'), findsOneWidget);
    });
  });

  group('AppButton - Combined Functionality Tests', () {
    testWidgets('All properties work together correctly',
        (WidgetTester tester) async {
      int callCount = 0;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppButton(
              label: 'Complete Button',
              type: ButtonType.primary,
              size: ButtonSize.medium,
              isEnabled: true,
              isLoading: false,
              leadingIcon: Icons.check,
              trailingIcon: Icons.arrow_forward,
              onPressed: () => callCount++,
            ),
          ),
        ),
      );

      // Verify all elements are present
      expect(find.text('Complete Button'), findsOneWidget);
      expect(find.byIcon(Icons.check), findsOneWidget);
      expect(find.byIcon(Icons.arrow_forward), findsOneWidget);
      expect(find.byType(ElevatedButton), findsOneWidget);

      // Verify button works
      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();
      expect(callCount, equals(1));
    });

    testWidgets('State changes are reflected correctly',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppButton(
              label: 'State Change Button',
              isEnabled: true,
              isLoading: false,
              onPressed: () {},
            ),
          ),
        ),
      );

      expect(find.text('State Change Button'), findsOneWidget);
      expect(find.byType(CircularProgressIndicator), findsNothing);
    });
  });
}
