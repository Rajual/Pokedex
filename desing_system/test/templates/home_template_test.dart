import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:desing_system/desing_system.dart';

void main() {
  group('HomeTemplate Tests', () {
    late HomeTemplateUiModel testUiModel;

    setUp(() {
      testUiModel = HomeTemplateUiModel(
        navigationItems: const [
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
        pages: [
          const Center(child: Text('Home Page')),
          const Center(child: Text('Search Page')),
          const Center(child: Text('Profile Page')),
        ],
        initialSelectedIndex: 0,
      );
    });

    testWidgets('should render HomeTemplate with bottom navigation bar',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: HomeTemplate(uiModel: testUiModel),
        ),
      );

      expect(find.byType(AppBottomNavigationBar), findsOneWidget);
      expect(find.byType(PageView), findsOneWidget);
    });

    testWidgets('should display initial page', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: HomeTemplate(uiModel: testUiModel),
        ),
      );

      expect(find.text('Home Page'), findsOneWidget);
      expect(find.text('Search Page'), findsNothing);
    });

    testWidgets('should change page when tapping navigation item',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: HomeTemplate(uiModel: testUiModel),
        ),
      );

      // Tap on Search tab
      await tester.tap(find.text('Search'));
      await tester.pumpAndSettle();

      expect(find.text('Search Page'), findsOneWidget);
      expect(find.text('Home Page'), findsNothing);
    });

    testWidgets('should call onPageChanged callback',
        (WidgetTester tester) async {
      int? changedIndex;

      final uiModel = testUiModel.copyWith(
        onPageChanged: (index) {
          changedIndex = index;
        },
      );

      await tester.pumpWidget(
        MaterialApp(
          home: HomeTemplate(uiModel: uiModel),
        ),
      );

      await tester.tap(find.text('Profile'));
      await tester.pumpAndSettle();

      expect(changedIndex, equals(2));
    });

    testWidgets('should start with specified initial index',
        (WidgetTester tester) async {
      final uiModel = testUiModel.copyWith(initialSelectedIndex: 1);

      await tester.pumpWidget(
        MaterialApp(
          home: HomeTemplate(uiModel: uiModel),
        ),
      );

      expect(find.text('Search Page'), findsOneWidget);
    });

    testWidgets('should display all navigation items',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: HomeTemplate(uiModel: testUiModel),
        ),
      );

      expect(find.text('Home'), findsOneWidget);
      expect(find.text('Search'), findsOneWidget);
      expect(find.text('Profile'), findsOneWidget);
    });

    testWidgets('should use custom colors for navigation bar',
        (WidgetTester tester) async {
      final uiModel = testUiModel.copyWith(
        activeColor: Colors.red,
        inactiveColor: Colors.yellow,
      );

      await tester.pumpWidget(
        MaterialApp(
          home: HomeTemplate(uiModel: uiModel),
        ),
      );

      final homeText = tester.widget<Text>(find.text('Home'));
      expect(homeText.style?.color, equals(Colors.red));

      final searchText = tester.widget<Text>(find.text('Search'));
      expect(searchText.style?.color, equals(Colors.yellow));
    });

    testWidgets('should navigate between pages with swipe gesture',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: HomeTemplate(uiModel: testUiModel),
        ),
      );

      expect(find.text('Home Page'), findsOneWidget);

      // Swipe left to go to next page
      await tester.drag(find.byType(PageView), const Offset(-400, 0));
      await tester.pumpAndSettle();

      expect(find.text('Search Page'), findsOneWidget);
    });

    testWidgets('should keep page state when keepPagesAlive is true',
        (WidgetTester tester) async {
      final uiModel = HomeTemplateUiModel(
        navigationItems: const [
          AppBottomNavigationItemUiModel(icon: Icons.home, label: 'Home'),
          AppBottomNavigationItemUiModel(icon: Icons.search, label: 'Search'),
        ],
        pages: [
          _TestStatefulPage(key: const Key('page1')),
          _TestStatefulPage(key: const Key('page2')),
        ],
        initialSelectedIndex: 0,
        keepPagesAlive: true,
      );

      await tester.pumpWidget(
        MaterialApp(
          home: HomeTemplate(uiModel: uiModel),
        ),
      );

      // Increment counter on first page
      await tester.tap(find.byIcon(Icons.add));
      await tester.pump();
      expect(find.text('Counter: 1'), findsOneWidget);

      // Navigate to second page
      await tester.tap(find.text('Search'));
      await tester.pumpAndSettle();

      // Navigate back to first page
      await tester.tap(find.text('Home'));
      await tester.pumpAndSettle();

      // State should be preserved
      expect(find.text('Counter: 1'), findsOneWidget);
    });

    test('should validate minimum items constraint', () {
      expect(
        () => HomeTemplateUiModel(
          navigationItems: const [
            AppBottomNavigationItemUiModel(icon: Icons.home, label: 'Home'),
          ],
          pages: [Container()],
        ),
        throwsAssertionError,
      );
    });

    test('should validate maximum items constraint', () {
      expect(
        () => HomeTemplateUiModel(
          navigationItems: const [
            AppBottomNavigationItemUiModel(icon: Icons.home, label: 'Home'),
            AppBottomNavigationItemUiModel(icon: Icons.search, label: 'Search'),
            AppBottomNavigationItemUiModel(icon: Icons.favorite, label: 'Fav'),
            AppBottomNavigationItemUiModel(icon: Icons.person, label: 'Profile'),
            AppBottomNavigationItemUiModel(icon: Icons.settings, label: 'Settings'),
            AppBottomNavigationItemUiModel(icon: Icons.menu, label: 'Menu'),
          ],
          pages: List.generate(6, (_) => Container()),
        ),
        throwsAssertionError,
      );
    });

    test('should validate pages and items length match', () {
      expect(
        () => HomeTemplateUiModel(
          navigationItems: const [
            AppBottomNavigationItemUiModel(icon: Icons.home, label: 'Home'),
            AppBottomNavigationItemUiModel(icon: Icons.search, label: 'Search'),
          ],
          pages: [Container()], // Only 1 page but 2 items
        ),
        throwsAssertionError,
      );
    });

    test('HomeTemplateUiModel copyWith should work', () {
      final original = HomeTemplateUiModel(
        navigationItems: const [
          AppBottomNavigationItemUiModel(icon: Icons.home, label: 'Home'),
          AppBottomNavigationItemUiModel(icon: Icons.search, label: 'Search'),
        ],
        pages: [Container(), Container()],
        initialSelectedIndex: 0,
        activeColor: Colors.blue,
      );

      final copied = original.copyWith(
        initialSelectedIndex: 1,
        activeColor: Colors.red,
      );

      expect(copied.initialSelectedIndex, equals(1));
      expect(copied.activeColor, equals(Colors.red));
      expect(copied.navigationItems.length, equals(2));
    });
  });
}

/// Widget de prueba con estado
class _TestStatefulPage extends StatefulWidget {
  const _TestStatefulPage({super.key});

  @override
  State<_TestStatefulPage> createState() => _TestStatefulPageState();
}

class _TestStatefulPageState extends State<_TestStatefulPage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Counter: $_counter'),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              setState(() => _counter++);
            },
          ),
        ],
      ),
    );
  }
}
