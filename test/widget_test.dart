// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:pokedex/main.dart';

void main() {
  testWidgets('Design System Demo displays correctly', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that the home page is displayed
    expect(find.text('Pokédex - Design System Demo'), findsOneWidget);

    // Verify AppButton examples are present
    expect(find.text('AppButton Component'), findsOneWidget);
    expect(find.text('Primary'), findsOneWidget);
    expect(find.text('Secondary'), findsOneWidget);
    expect(find.text('Tertiary'), findsOneWidget);

    // Verify Pokémon Gallery is present
    expect(find.text('Pokémon Gallery'), findsOneWidget);

    // Verify some Pokemon names are displayed
    expect(find.text('Charizard'), findsOneWidget);
    expect(find.text('Pikachu'), findsOneWidget);

    // Verify Type Elements section is present
    expect(find.text('Pokémon Type Elements'), findsOneWidget);
    expect(find.text('Small Size'), findsOneWidget);
    expect(find.text('Medium Size (Default)'), findsOneWidget);
    expect(find.text('Large Size'), findsOneWidget);
    expect(find.text('Full Width'), findsOneWidget);

    // Verify some type labels are displayed (in Spanish) - may appear multiple times due to different sizes
    expect(find.text('Fuego'), findsWidgets);
    expect(find.text('Agua'), findsWidgets);
    expect(find.text('Psíquico'), findsOneWidget);
  });
}
