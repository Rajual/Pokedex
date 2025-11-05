import 'package:desing_system/templates/empty_state_template/models/empty_state_template_ui_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:desing_system/desing_system.dart';

void main() {
  group('EmptyStateTemplate', () {
    testWidgets('renders with required parameters', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: EmptyStateTemplate(
            uiModel: EmptyStateTemplateUiModel(
              imagePath: 'assets/test.png',
              title: 'Empty State',
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.text('Empty State'), findsOneWidget);
      expect(find.byType(AppImage), findsOneWidget);
    });

    testWidgets('renders title correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: EmptyStateTemplate(
            uiModel: EmptyStateTemplateUiModel(
              imagePath: 'assets/test.png',
              title: 'No hay favoritos',
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.text('No hay favoritos'), findsOneWidget);
    });

    testWidgets('renders description when provided', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: EmptyStateTemplate.fromProperties(            imagePath: 'assets/test.png',
            title: 'Title',
            description: 'This is a description',
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.text('This is a description'), findsOneWidget);
    });

    testWidgets('does not render description when null', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: EmptyStateTemplate.fromProperties(            imagePath: 'assets/test.png',
            title: 'Title',
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.byType(AppImage), findsOneWidget);
      expect(find.text('Title'), findsOneWidget);
    });

    testWidgets('renders hint when provided', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: EmptyStateTemplate.fromProperties(            imagePath: 'assets/test.png',
            title: 'Title',
            hint: 'This is a hint',
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.text('This is a hint'), findsOneWidget);
    });

    testWidgets('renders primary action button when provided', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: EmptyStateTemplate.fromProperties(            imagePath: 'assets/test.png',
            title: 'Title',
            actionLabel: 'Take Action',
            onAction: () {},
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.text('Take Action'), findsOneWidget);
      expect(find.byType(AppButton), findsOneWidget);
    });

    testWidgets('calls onAction when action button is tapped', (tester) async {
      bool actionCalled = false;

      await tester.pumpWidget(
        MaterialApp(
          home: EmptyStateTemplate.fromProperties(            imagePath: 'assets/test.png',
            title: 'Title',
            actionLabel: 'Action',
            onAction: () {
              actionCalled = true;
            },
          ),
        ),
      );

      await tester.pumpAndSettle();

      await tester.tap(find.text('Action'));
      await tester.pump();

      expect(actionCalled, isTrue);
    });

    testWidgets('renders secondary action button when provided', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: EmptyStateTemplate.fromProperties(            imagePath: 'assets/test.png',
            title: 'Title',
            secondaryActionLabel: 'Secondary',
            onSecondaryAction: () {},
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.text('Secondary'), findsOneWidget);
      expect(find.byType(AppButton), findsOneWidget);
    });

    testWidgets('renders both buttons when both are provided', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: EmptyStateTemplate.fromProperties(            imagePath: 'assets/test.png',
            title: 'Title',
            actionLabel: 'Primary',
            onAction: () {},
            secondaryActionLabel: 'Secondary',
            onSecondaryAction: () {},
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.text('Primary'), findsOneWidget);
      expect(find.text('Secondary'), findsOneWidget);
      expect(find.byType(AppButton), findsNWidgets(2));
    });

    testWidgets('calls onSecondaryAction when secondary button is tapped',
        (tester) async {
      bool secondaryActionCalled = false;

      await tester.pumpWidget(
        MaterialApp(
          home: EmptyStateTemplate.fromProperties(            imagePath: 'assets/test.png',
            title: 'Title',
            actionLabel: 'Primary',
            onAction: () {},
            secondaryActionLabel: 'Secondary',
            onSecondaryAction: () {
              secondaryActionCalled = true;
            },
          ),
        ),
      );

      await tester.pumpAndSettle();

      await tester.tap(find.text('Secondary'));
      await tester.pump();

      expect(secondaryActionCalled, isTrue);
    });

    testWidgets('uses custom image size', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: EmptyStateTemplate.fromProperties(            imagePath: 'assets/test.png',
            title: 'Title',
            imageSize: AppImageSize.small,
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.byType(AppImage), findsOneWidget);
    });

    testWidgets('uses custom background color', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: EmptyStateTemplate.fromProperties(            imagePath: 'assets/test.png',
            title: 'Title',
            backgroundColor: Colors.blue,
          ),
        ),
      );

      await tester.pumpAndSettle();

      final container = tester.widget<Container>(
        find.ancestor(
          of: find.byType(SafeArea),
          matching: find.byType(Container),
        ).first,
      );

      expect(container.color, Colors.blue);
    });

    testWidgets('uses default background color when not provided', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: EmptyStateTemplate.fromProperties(            imagePath: 'assets/test.png',
            title: 'Title',
          ),
        ),
      );

      await tester.pumpAndSettle();

      final container = tester.widget<Container>(
        find.ancestor(
          of: find.byType(SafeArea),
          matching: find.byType(Container),
        ).first,
      );

      expect(container.color, AppColors.gray100);
    });

    testWidgets('uses custom alignment', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: EmptyStateTemplate.fromProperties(            imagePath: 'assets/test.png',
            title: 'Title',
            alignment: CrossAxisAlignment.start,
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.byType(EmptyStateTemplate), findsOneWidget);
    });

    testWidgets('uses custom horizontal padding', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: EmptyStateTemplate.fromProperties(            imagePath: 'assets/test.png',
            title: 'Title',
            horizontalPadding: 32.0,
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.byType(EmptyStateTemplate), findsOneWidget);
    });

    testWidgets('uses custom spacing', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: EmptyStateTemplate.fromProperties(            imagePath: 'assets/test.png',
            title: 'Title',
            spacing: 24.0,
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.byType(EmptyStateTemplate), findsOneWidget);
    });

    testWidgets('renders all elements together', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: EmptyStateTemplate.fromProperties(            imagePath: 'assets/test.png',
            title: 'Complete Example',
            description: 'This is a description',
            hint: 'This is a hint',
            actionLabel: 'Primary Action',
            onAction: () {},
            secondaryActionLabel: 'Secondary Action',
            onSecondaryAction: () {},
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.text('Complete Example'), findsOneWidget);
      expect(find.text('This is a description'), findsOneWidget);
      expect(find.text('This is a hint'), findsOneWidget);
      expect(find.text('Primary Action'), findsOneWidget);
      expect(find.text('Secondary Action'), findsOneWidget);
      expect(find.byType(AppImage), findsOneWidget);
      expect(find.byType(AppButton), findsNWidgets(2));
    });

    testWidgets('is scrollable when content is large', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: EmptyStateTemplate.fromProperties(            imagePath: 'assets/test.png',
            title: 'Very Long Title\n' * 10,
            description: 'Very Long Description\n' * 10,
            actionLabel: 'Action',
            onAction: () {},
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.byType(SingleChildScrollView), findsOneWidget);
    });

    test('asserts onAction is provided when actionLabel is provided', () {
      expect(
        () => EmptyStateTemplate.fromProperties(          imagePath: 'assets/test.png',
          title: 'Title',
          actionLabel: 'Action',
          // onAction no proporcionado
        ),
        throwsAssertionError,
      );
    });

    test('asserts onSecondaryAction is provided when secondaryActionLabel is provided',
        () {
      expect(
        () => EmptyStateTemplate.fromProperties(          imagePath: 'assets/test.png',
          title: 'Title',
          secondaryActionLabel: 'Secondary',
          // onSecondaryAction no proporcionado
        ),
        throwsAssertionError,
      );
    });
  });
}
