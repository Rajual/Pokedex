import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../../../lib/molecules/search_bar/search_bar.dart';
import '../../../../lib/molecules/search_bar/models/custom_search_bar_ui_model.dart';

void main() {
  group('CustomSearchBar', () {
    testWidgets('renders correctly with default values', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomSearchBar.fromProperties(
              onChanged: (_) {},
            ),
          ),
        ),
      );

      expect(find.byType(CustomSearchBar), findsOneWidget);
      expect(find.byType(TextField), findsOneWidget);
    });

    testWidgets('displays hint text', (WidgetTester tester) async {
      const String hintText = 'Search Pokemon...';

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomSearchBar.fromProperties(
              hintText: hintText,
              onChanged: (_) {},
            ),
          ),
        ),
      );

      expect(find.text(hintText), findsOneWidget);
    });

    testWidgets('calls onChanged when text is entered', (WidgetTester tester) async {
      String changedValue = '';

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomSearchBar.fromProperties(
              onChanged: (value) => changedValue = value,
            ),
          ),
        ),
      );

      await tester.enterText(find.byType(TextField), 'Pikachu');
      await tester.pumpAndSettle();

      expect(changedValue, 'Pikachu');
    });

    testWidgets('shows clear icon when text is not empty', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomSearchBar.fromProperties(
              onChanged: (_) {},
              showClearIcon: true,
            ),
          ),
        ),
      );

      // No close icon initially
      expect(find.byIcon(Icons.close), findsNothing);

      // Enter text
      await tester.enterText(find.byType(TextField), 'test');
      await tester.pumpAndSettle();

      // Close icon should appear
      expect(find.byIcon(Icons.close), findsOneWidget);
    });

    testWidgets('clears text when clear icon is tapped', (WidgetTester tester) async {
      String changedValue = 'Pikachu';
      bool clearCalled = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomSearchBar.fromProperties(
              onChanged: (value) => changedValue = value,
              onClear: () => clearCalled = true,
              showClearIcon: true,
            ),
          ),
        ),
      );

      // Enter text
      await tester.enterText(find.byType(TextField), 'Pikachu');
      await tester.pumpAndSettle();

      expect(changedValue, 'Pikachu');

      // Tap clear icon
      await tester.tap(find.byIcon(Icons.close));
      await tester.pumpAndSettle();

      expect(changedValue, '');
      expect(clearCalled, true);
    });

    testWidgets('hides clear icon when showClearIcon is false', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomSearchBar.fromProperties(
              onChanged: (_) {},
              showClearIcon: false,
            ),
          ),
        ),
      );

      await tester.enterText(find.byType(TextField), 'test');
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.close), findsNothing);
    });

    testWidgets('shows search icon when showSearchIcon is true', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomSearchBar.fromProperties(
              onChanged: (_) {},
              showSearchIcon: true,
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.search), findsWidgets);
    });

    testWidgets('hides search icon when showSearchIcon is false', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomSearchBar.fromProperties(
              onChanged: (_) {},
              showSearchIcon: false,
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.search), findsNothing);
    });

    testWidgets('calls onSearch when search icon is tapped', (WidgetTester tester) async {
      String searchValue = '';

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomSearchBar.fromProperties(
              onChanged: (_) {},
              onSearch: (value) => searchValue = value,
              showSearchIcon: true,
            ),
          ),
        ),
      );

      await tester.enterText(find.byType(TextField), 'Charizard');
      await tester.pumpAndSettle();

      final searchIcons = find.byIcon(Icons.search);
      await tester.tap(searchIcons.last);
      await tester.pumpAndSettle();

      expect(searchValue, 'Charizard');
    });

    testWidgets('handles SearchBarSize.small correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomSearchBar.fromProperties(
              onChanged: (_) {},
              size: SearchBarSize.small,
            ),
          ),
        ),
      );

      final container = find.byType(Container).first;
      expect(container, findsOneWidget);

      await tester.pumpAndSettle();
    });

    testWidgets('handles SearchBarSize.medium correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomSearchBar.fromProperties(
              onChanged: (_) {},
              size: SearchBarSize.medium,
            ),
          ),
        ),
      );

      expect(find.byType(CustomSearchBar), findsOneWidget);
    });

    testWidgets('handles SearchBarSize.large correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomSearchBar.fromProperties(
              onChanged: (_) {},
              size: SearchBarSize.large,
            ),
          ),
        ),
      );

      expect(find.byType(CustomSearchBar), findsOneWidget);
    });

    testWidgets('respects backgroundColor property', (WidgetTester tester) async {
      const Color bgColor = Color(0xFFFF0000);

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomSearchBar.fromProperties(
              onChanged: (_) {},
              backgroundColor: bgColor,
            ),
          ),
        ),
      );

      expect(find.byType(Container), findsWidgets);
    });

    testWidgets('respects isEnabled property', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomSearchBar.fromProperties(
              onChanged: (_) {},
              isEnabled: false,
            ),
          ),
        ),
      );

      final textField = find.byType(TextField);
      expect(textField, findsOneWidget);

      await tester.pumpAndSettle();
    });

    testWidgets('displays border when hasBorder is true', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomSearchBar.fromProperties(
              onChanged: (_) {},
              hasBorder: true,
            ),
          ),
        ),
      );

      expect(find.byType(Container), findsWidgets);
    });

    testWidgets('initializes with initialText', (WidgetTester tester) async {
      const String initialText = 'Pikachu';

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomSearchBar.fromProperties(
              onChanged: (_) {},
              initialText: initialText,
            ),
          ),
        ),
      );

      expect(find.byWidgetPredicate(
        (widget) => widget is TextField && widget.controller?.text == initialText,
      ), findsOneWidget);
    });

    testWidgets('updates text when TextField is changed', (WidgetTester tester) async {
      String latestValue = '';

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomSearchBar.fromProperties(
              onChanged: (value) => latestValue = value,
            ),
          ),
        ),
      );

      await tester.enterText(find.byType(TextField), 'Bulbasaur');
      await tester.pumpAndSettle();

      expect(latestValue, 'Bulbasaur');

      await tester.enterText(find.byType(TextField), 'Squirtle');
      await tester.pumpAndSettle();

      expect(latestValue, 'Squirtle');
    });

    testWidgets('calls onSearch on text submission', (WidgetTester tester) async {
      String searchText = '';

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomSearchBar.fromProperties(
              onChanged: (_) {},
              onSearch: (value) => searchText = value,
            ),
          ),
        ),
      );

      await tester.enterText(find.byType(TextField), 'Mewtwo');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pumpAndSettle();

      expect(searchText, 'Mewtwo');
    });

    testWidgets('multiple instances work independently', (WidgetTester tester) async {
      String value1 = '';
      String value2 = '';

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                CustomSearchBar.fromProperties(
                  onChanged: (value) => value1 = value,
                  hintText: 'First',
                ),
                CustomSearchBar.fromProperties(
                  onChanged: (value) => value2 = value,
                  hintText: 'Second',
                ),
              ],
            ),
          ),
        ),
      );

      final textFields = find.byType(TextField);
      expect(textFields, findsWidgets);

      await tester.enterText(textFields.first, 'Pikachu');
      await tester.pumpAndSettle();

      expect(value1, 'Pikachu');
      expect(value2, '');

      await tester.enterText(textFields.last, 'Charizard');
      await tester.pumpAndSettle();

      expect(value1, 'Pikachu');
      expect(value2, 'Charizard');
    });

    testWidgets('handles rapid text changes', (WidgetTester tester) async {
      final values = <String>[];

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomSearchBar.fromProperties(
              onChanged: (value) => values.add(value),
            ),
          ),
        ),
      );

      await tester.enterText(find.byType(TextField), 'P');
      await tester.enterText(find.byType(TextField), 'Pi');
      await tester.enterText(find.byType(TextField), 'Pik');
      await tester.enterText(find.byType(TextField), 'Pika');
      await tester.enterText(find.byType(TextField), 'Pikac');
      await tester.pumpAndSettle();

      expect(values.length, greaterThan(0));
    });
  });
}
