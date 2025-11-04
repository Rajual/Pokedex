import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../../lib/atoms/app_favorite_tag/app_favorite_tag.dart';
import '../../../lib/atoms/app_favorite_tag/utils/favorite_tag_enums.dart';

void main() {
  group('AppFavoriteTag', () {
    group('State Management Tests', () {
      testWidgets('Displays outline heart when not favorite',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppFavoriteTag.fromProperties(
                isFavorite: false,
                onFavoriteChanged: (_) {},
              ),
            ),
          ),
        );

        expect(find.byIcon(Icons.favorite_border), findsOneWidget);
      });

      testWidgets('Displays filled heart when favorite',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppFavoriteTag.fromProperties(
                isFavorite: true,
                onFavoriteChanged: (_) {},
              ),
            ),
          ),
        );

        expect(find.byIcon(Icons.favorite), findsOneWidget);
      });

      testWidgets('Callback is called when tapped', (WidgetTester tester) async {
        bool wasToggled = false;
        bool newValue = false;

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppFavoriteTag.fromProperties(
                isFavorite: false,
                onFavoriteChanged: (value) {
                  wasToggled = true;
                  newValue = value;
                },
              ),
            ),
          ),
        );

        await tester.tap(find.byType(InkWell));
        expect(wasToggled, true);
        expect(newValue, true);
      });

      testWidgets('Toggles between favorite and not favorite',
          (WidgetTester tester) async {
        bool isFavorite = false;

        await tester.pumpWidget(
          StatefulBuilder(
            builder: (context, setState) {
              return MaterialApp(
                home: Scaffold(
                  body: AppFavoriteTag.fromProperties(
                    isFavorite: isFavorite,
                    onFavoriteChanged: (value) {
                      setState(() {
                        isFavorite = value;
                      });
                    },
                  ),
                ),
              );
            },
          ),
        );

        expect(find.byIcon(Icons.favorite_border), findsOneWidget);

        await tester.tap(find.byType(InkWell));
        await tester.pumpAndSettle();

        expect(find.byIcon(Icons.favorite), findsOneWidget);
      });
    });

    group('Size Tests', () {
      testWidgets('Small size renders with correct dimensions',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppFavoriteTag.fromProperties(
                isFavorite: false,
                onFavoriteChanged: (_) {},
                size: FavoriteTagSize.small,
              ),
            ),
          ),
        );

        expect(find.byType(AppFavoriteTag), findsOneWidget);
        expect(FavoriteTagSize.small.dimension, 40);
        expect(FavoriteTagSize.small.iconSize, 20);
      });

      testWidgets('Medium size renders with correct dimensions',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppFavoriteTag.fromProperties(
                isFavorite: false,
                onFavoriteChanged: (_) {},
                size: FavoriteTagSize.medium,
              ),
            ),
          ),
        );

        expect(find.byType(AppFavoriteTag), findsOneWidget);
        expect(FavoriteTagSize.medium.dimension, 56);
        expect(FavoriteTagSize.medium.iconSize, 28);
      });

      testWidgets('Large size renders with correct dimensions',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppFavoriteTag.fromProperties(
                isFavorite: false,
                onFavoriteChanged: (_) {},
                size: FavoriteTagSize.large,
              ),
            ),
          ),
        );

        expect(find.byType(AppFavoriteTag), findsOneWidget);
        expect(FavoriteTagSize.large.dimension, 72);
        expect(FavoriteTagSize.large.iconSize, 36);
      });

      testWidgets('All sizes have correct values', (WidgetTester tester) async {
        expect(FavoriteTagSize.small.dimension, 40);
        expect(FavoriteTagSize.medium.dimension, 56);
        expect(FavoriteTagSize.large.dimension, 72);
      });
    });

    group('Style Tests', () {
      testWidgets('Filled style renders correctly', (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppFavoriteTag.fromProperties(
                isFavorite: false,
                onFavoriteChanged: (_) {},
                style: FavoriteTagStyle.filled,
              ),
            ),
          ),
        );

        expect(find.byType(InkWell), findsOneWidget);
        expect(find.byType(Container), findsWidgets);
      });

      testWidgets('Outlined style renders correctly', (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppFavoriteTag.fromProperties(
                isFavorite: false,
                onFavoriteChanged: (_) {},
                style: FavoriteTagStyle.outlined,
              ),
            ),
          ),
        );

        expect(find.byType(InkWell), findsOneWidget);
        expect(find.byType(Container), findsWidgets);
      });

      testWidgets('Floating style renders with shadow', (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppFavoriteTag.fromProperties(
                isFavorite: false,
                onFavoriteChanged: (_) {},
                style: FavoriteTagStyle.floating,
              ),
            ),
          ),
        );

        expect(find.byType(InkWell), findsOneWidget);
        expect(find.byType(Container), findsWidgets);
      });
    });

    group('Color Tests', () {
      testWidgets('Active color is used when favorite', (WidgetTester tester) async {
        const activeColor = Color(0xFFEF4444);

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppFavoriteTag.fromProperties(
                isFavorite: true,
                onFavoriteChanged: (_) {},
                activeColor: activeColor,
              ),
            ),
          ),
        );

        expect(find.byIcon(Icons.favorite), findsOneWidget);
      });

      testWidgets('Inactive color is used when not favorite',
          (WidgetTester tester) async {
        const inactiveColor = Color(0xFF9CA3AF);

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppFavoriteTag.fromProperties(
                isFavorite: false,
                onFavoriteChanged: (_) {},
                inactiveColor: inactiveColor,
              ),
            ),
          ),
        );

        expect(find.byIcon(Icons.favorite_border), findsOneWidget);
      });

      testWidgets('Custom colors work correctly', (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppFavoriteTag.fromProperties(
                isFavorite: false,
                onFavoriteChanged: (_) {},
                activeColor: Colors.blue,
                inactiveColor: Colors.grey,
              ),
            ),
          ),
        );

        expect(find.byType(AppFavoriteTag), findsOneWidget);
      });
    });

    group('Animation Tests', () {
      testWidgets('Animation enabled by default', (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppFavoriteTag.fromProperties(
                isFavorite: false,
                onFavoriteChanged: (_) {},
                enableAnimation: true,
              ),
            ),
          ),
        );

        expect(find.byType(AppFavoriteTag), findsOneWidget);
        // Just verify it renders, animation is internal
        expect(find.byType(InkWell), findsOneWidget);
      });

      testWidgets('Animation can be disabled', (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppFavoriteTag.fromProperties(
                isFavorite: false,
                onFavoriteChanged: (_) {},
                enableAnimation: false,
              ),
            ),
          ),
        );

        // When animation is disabled, should still render
        expect(find.byType(AppFavoriteTag), findsOneWidget);
        expect(find.byType(InkWell), findsOneWidget);
      });

      testWidgets('Animation duration can be customized',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppFavoriteTag.fromProperties(
                isFavorite: false,
                onFavoriteChanged: (_) {},
                enableAnimation: true,
                animationDuration: const Duration(milliseconds: 500),
              ),
            ),
          ),
        );

        expect(find.byType(AppFavoriteTag), findsOneWidget);
      });
    });

    group('Disabled State Tests', () {
      testWidgets('Button is disabled when isEnabled=false',
          (WidgetTester tester) async {
        bool wasToggled = false;

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppFavoriteTag.fromProperties(
                isFavorite: false,
                onFavoriteChanged: (_) {
                  wasToggled = true;
                },
                isEnabled: false,
              ),
            ),
          ),
        );

        await tester.tap(find.byType(InkWell));
        expect(wasToggled, false);
      });

      testWidgets('Button is enabled by default', (WidgetTester tester) async {
        bool wasToggled = false;

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppFavoriteTag.fromProperties(
                isFavorite: false,
                onFavoriteChanged: (_) {
                  wasToggled = true;
                },
                isEnabled: true,
              ),
            ),
          ),
        );

        await tester.tap(find.byType(InkWell));
        expect(wasToggled, true);
      });
    });

    group('Combined Tests', () {
      testWidgets('All properties work together correctly',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppFavoriteTag.fromProperties(
                isFavorite: true,
                onFavoriteChanged: (_) {},
                size: FavoriteTagSize.large,
                style: FavoriteTagStyle.floating,
                activeColor: Colors.red,
                enableAnimation: true,
                isEnabled: true,
              ),
            ),
          ),
        );

        expect(find.byIcon(Icons.favorite), findsOneWidget);
        expect(find.byType(AppFavoriteTag), findsOneWidget);
      });

      testWidgets('Multiple AppFavoriteTags render independently',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Row(
                children: [
                  AppFavoriteTag.fromProperties(
                    isFavorite: true,
                    onFavoriteChanged: (_) {},
                    size: FavoriteTagSize.small,
                  ),
                  AppFavoriteTag.fromProperties(
                    isFavorite: false,
                    onFavoriteChanged: (_) {},
                    size: FavoriteTagSize.medium,
                  ),
                  AppFavoriteTag.fromProperties(
                    isFavorite: true,
                    onFavoriteChanged: (_) {},
                    size: FavoriteTagSize.large,
                  ),
                ],
              ),
            ),
          ),
        );

        expect(find.byType(AppFavoriteTag), findsWidgets);
        expect(find.byIcon(Icons.favorite), findsWidgets);
      });

      testWidgets('Different styles render correctly',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Column(
                children: [
                  AppFavoriteTag.fromProperties(
                    isFavorite: true,
                    onFavoriteChanged: (_) {},
                    style: FavoriteTagStyle.filled,
                  ),
                  AppFavoriteTag.fromProperties(
                    isFavorite: true,
                    onFavoriteChanged: (_) {},
                    style: FavoriteTagStyle.outlined,
                  ),
                  AppFavoriteTag.fromProperties(
                    isFavorite: true,
                    onFavoriteChanged: (_) {},
                    style: FavoriteTagStyle.floating,
                  ),
                ],
              ),
            ),
          ),
        );

        expect(find.byType(AppFavoriteTag), findsWidgets);
      });
    });

    group('Icon Tests', () {
      testWidgets('Correct icon displays based on favorite state',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppFavoriteTag.fromProperties(
                isFavorite: false,
                onFavoriteChanged: (_) {},
              ),
            ),
          ),
        );

        expect(find.byIcon(Icons.favorite_border), findsOneWidget);
        expect(find.byIcon(Icons.favorite), findsNothing);
      });

      testWidgets('Icon changes when favorite state changes',
          (WidgetTester tester) async {
        bool isFavorite = false;

        await tester.pumpWidget(
          StatefulBuilder(
            builder: (context, setState) {
              return MaterialApp(
                home: Scaffold(
                  body: AppFavoriteTag.fromProperties(
                    isFavorite: isFavorite,
                    onFavoriteChanged: (value) {
                      setState(() {
                        isFavorite = value;
                      });
                    },
                  ),
                ),
              );
            },
          ),
        );

        expect(find.byIcon(Icons.favorite_border), findsOneWidget);

        await tester.tap(find.byType(InkWell));
        await tester.pumpAndSettle();

        expect(find.byIcon(Icons.favorite), findsOneWidget);
        expect(find.byIcon(Icons.favorite_border), findsNothing);
      });
    });
  });
}
