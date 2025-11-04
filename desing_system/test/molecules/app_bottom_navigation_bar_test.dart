import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:desing_system/desing_system.dart';

void main() {
  group('AppBottomNavigationBar Tests', () {
    testWidgets('should render all navigation items', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppBottomNavigationBar(
              uiModel: AppBottomNavigationBarUiModel(
                items: const [
                  AppBottomNavigationItemUiModel(
                    icon: Icons.home,
                    label: 'Home',
                  ),
                  AppBottomNavigationItemUiModel(
                    icon: Icons.search,
                    label: 'Search',
                  ),
                  AppBottomNavigationItemUiModel(
                    icon: Icons.person,
                    label: 'Profile',
                  ),
                ],
                selectedIndex: 0,
              ),
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.home), findsOneWidget);
      expect(find.byIcon(Icons.search), findsOneWidget);
      expect(find.byIcon(Icons.person), findsOneWidget);
      expect(find.text('Home'), findsOneWidget);
      expect(find.text('Search'), findsOneWidget);
      expect(find.text('Profile'), findsOneWidget);
    });

    testWidgets('should highlight selected item', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppBottomNavigationBar(
              uiModel: AppBottomNavigationBarUiModel(
                items: const [
                  AppBottomNavigationItemUiModel(
                    icon: Icons.home,
                    label: 'Home',
                  ),
                  AppBottomNavigationItemUiModel(
                    icon: Icons.search,
                    label: 'Search',
                  ),
                ],
                selectedIndex: 1,
                activeColor: Colors.blue,
                inactiveColor: Colors.grey,
              ),
            ),
          ),
        ),
      );

      // Find the search text widget
      final searchText = tester.widget<Text>(find.text('Search'));
      expect(searchText.style?.color, equals(Colors.blue));
      expect(searchText.style?.fontWeight, equals(FontWeight.w600));

      // Find the home text widget
      final homeText = tester.widget<Text>(find.text('Home'));
      expect(homeText.style?.color, equals(Colors.grey));
      expect(homeText.style?.fontWeight, equals(FontWeight.normal));
    });

    testWidgets('should call onItemSelected when tapping item',
        (WidgetTester tester) async {
      int? selectedIndex;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppBottomNavigationBar(
              uiModel: AppBottomNavigationBarUiModel(
                items: const [
                  AppBottomNavigationItemUiModel(
                    icon: Icons.home,
                    label: 'Home',
                  ),
                  AppBottomNavigationItemUiModel(
                    icon: Icons.search,
                    label: 'Search',
                  ),
                ],
                selectedIndex: 0,
                onItemSelected: (index) {
                  selectedIndex = index;
                },
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Search'));
      await tester.pump();

      expect(selectedIndex, equals(1));
    });

    testWidgets('should use custom colors', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppBottomNavigationBar(
              uiModel: AppBottomNavigationBarUiModel(
                items: const [
                  AppBottomNavigationItemUiModel(
                    icon: Icons.home,
                    label: 'Home',
                  ),
                  AppBottomNavigationItemUiModel(
                    icon: Icons.search,
                    label: 'Search',
                  ),
                ],
                selectedIndex: 0,
                activeColor: Colors.red,
                inactiveColor: Colors.yellow,
              ),
            ),
          ),
        ),
      );

      final homeText = tester.widget<Text>(find.text('Home'));
      expect(homeText.style?.color, equals(Colors.red));

      final searchText = tester.widget<Text>(find.text('Search'));
      expect(searchText.style?.color, equals(Colors.yellow));
    });

    testWidgets('should render with 4 items (Pokedex style)',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppBottomNavigationBar(
              uiModel: AppBottomNavigationBarUiModel(
                items: const [
                  AppBottomNavigationItemUiModel(
                    icon: Icons.home,
                    label: 'Pokedex',
                  ),
                  AppBottomNavigationItemUiModel(
                    icon: Icons.public,
                    label: 'Regiones',
                  ),
                  AppBottomNavigationItemUiModel(
                    icon: Icons.favorite,
                    label: 'Favoritos',
                  ),
                  AppBottomNavigationItemUiModel(
                    icon: Icons.person,
                    label: 'Perfil',
                  ),
                ],
                selectedIndex: 2,
              ),
            ),
          ),
        ),
      );

      expect(find.text('Pokedex'), findsOneWidget);
      expect(find.text('Regiones'), findsOneWidget);
      expect(find.text('Favoritos'), findsOneWidget);
      expect(find.text('Perfil'), findsOneWidget);
    });

    testWidgets('should apply custom height', (WidgetTester tester) async {
      const customHeight = 80.0;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppBottomNavigationBar(
              uiModel: AppBottomNavigationBarUiModel(
                items: const [
                  AppBottomNavigationItemUiModel(
                    icon: Icons.home,
                    label: 'Home',
                  ),
                  AppBottomNavigationItemUiModel(
                    icon: Icons.search,
                    label: 'Search',
                  ),
                ],
                selectedIndex: 0,
                height: customHeight,
              ),
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(
        find.byType(Container).first,
      );
      expect(container.constraints?.maxHeight, equals(customHeight));
    });

    test('should validate minimum items', () {
      expect(
        () => AppBottomNavigationBarUiModel(
          items: const [
            AppBottomNavigationItemUiModel(
              icon: Icons.home,
              label: 'Home',
            ),
          ],
          selectedIndex: 0,
        ),
        throwsAssertionError,
      );
    });

    test('should validate maximum items', () {
      expect(
        () => AppBottomNavigationBarUiModel(
          items: const [
            AppBottomNavigationItemUiModel(icon: Icons.home, label: 'Home'),
            AppBottomNavigationItemUiModel(icon: Icons.search, label: 'Search'),
            AppBottomNavigationItemUiModel(icon: Icons.favorite, label: 'Fav'),
            AppBottomNavigationItemUiModel(icon: Icons.person, label: 'Profile'),
            AppBottomNavigationItemUiModel(icon: Icons.settings, label: 'Settings'),
            AppBottomNavigationItemUiModel(icon: Icons.menu, label: 'Menu'),
          ],
          selectedIndex: 0,
        ),
        throwsAssertionError,
      );
    });

    test('should validate selectedIndex range', () {
      expect(
        () => AppBottomNavigationBarUiModel(
          items: const [
            AppBottomNavigationItemUiModel(icon: Icons.home, label: 'Home'),
            AppBottomNavigationItemUiModel(icon: Icons.search, label: 'Search'),
          ],
          selectedIndex: 5,
        ),
        throwsAssertionError,
      );
    });

    test('AppBottomNavigationItemUiModel copyWith should work', () {
      const original = AppBottomNavigationItemUiModel(
        icon: Icons.home,
        label: 'Home',
        isSelected: false,
      );

      final copied = original.copyWith(
        label: 'New Home',
        isSelected: true,
      );

      expect(copied.icon, equals(Icons.home));
      expect(copied.label, equals('New Home'));
      expect(copied.isSelected, isTrue);
    });

    test('AppBottomNavigationBarUiModel copyWith should work', () {
      final original = AppBottomNavigationBarUiModel(
        items: const [
          AppBottomNavigationItemUiModel(icon: Icons.home, label: 'Home'),
          AppBottomNavigationItemUiModel(icon: Icons.search, label: 'Search'),
        ],
        selectedIndex: 0,
        activeColor: Colors.blue,
        height: 60.0,
      );

      final copied = original.copyWith(
        selectedIndex: 1,
        activeColor: Colors.red,
      );

      expect(copied.selectedIndex, equals(1));
      expect(copied.activeColor, equals(Colors.red));
      expect(copied.height, equals(60.0)); // Should remain unchanged
    });
  });
}
