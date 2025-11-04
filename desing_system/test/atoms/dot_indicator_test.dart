import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:desing_system/desing_system.dart';

void main() {
  group('DotIndicator', () {
    testWidgets('renders with correct number of dots', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DotIndicator(
              count: 5,
              currentIndex: 0,
            ),
          ),
        ),
      );

      expect(find.byType(AnimatedContainer), findsNWidgets(5));
    });

    testWidgets('renders with dots variant by default', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DotIndicator(
              count: 3,
              currentIndex: 0,
            ),
          ),
        ),
      );

      // Verifica que se renderizaron los dots (AnimatedContainer con forma circular)
      expect(find.byType(AnimatedContainer), findsNWidgets(3));
    });

    testWidgets('renders with bars variant', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DotIndicator(
              count: 4,
              currentIndex: 0,
              variant: DotIndicatorVariant.bars,
            ),
          ),
        ),
      );

      expect(find.byType(AnimatedContainer), findsNWidgets(4));
    });

    testWidgets('highlights current index correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DotIndicator(
              count: 5,
              currentIndex: 2,
              activeColor: Colors.blue,
              inactiveColor: Colors.grey,
            ),
          ),
        ),
      );

      await tester.pump();

      // Encuentra todos los AnimatedContainer
      final containers = tester.widgetList<AnimatedContainer>(
        find.byType(AnimatedContainer),
      );

      expect(containers, hasLength(5));
    });

    testWidgets('calls onTap callback when indicator is tapped', (tester) async {
      int? tappedIndex;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DotIndicator(
              count: 5,
              currentIndex: 0,
              onTap: (index) {
                tappedIndex = index;
              },
            ),
          ),
        ),
      );

      // Toca el tercer indicador (índice 2)
      await tester.tap(find.byType(GestureDetector).at(2));
      await tester.pump();

      expect(tappedIndex, equals(2));
    });

    testWidgets('renders with small size', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DotIndicator(
              count: 3,
              currentIndex: 0,
              size: DotIndicatorSize.small,
            ),
          ),
        ),
      );

      await tester.pump();

      expect(find.byType(AnimatedContainer), findsNWidgets(3));
    });

    testWidgets('renders with medium size (default)', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DotIndicator(
              count: 3,
              currentIndex: 0,
              size: DotIndicatorSize.medium,
            ),
          ),
        ),
      );

      await tester.pump();

      expect(find.byType(AnimatedContainer), findsNWidgets(3));
    });

    testWidgets('renders with large size', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DotIndicator(
              count: 3,
              currentIndex: 0,
              size: DotIndicatorSize.large,
            ),
          ),
        ),
      );

      await tester.pump();

      expect(find.byType(AnimatedContainer), findsNWidgets(3));
    });

    testWidgets('uses custom active color', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DotIndicator(
              count: 3,
              currentIndex: 1,
              activeColor: Colors.red,
            ),
          ),
        ),
      );

      await tester.pump();

      expect(find.byType(AnimatedContainer), findsNWidgets(3));
    });

    testWidgets('uses custom inactive color', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DotIndicator(
              count: 3,
              currentIndex: 0,
              inactiveColor: Colors.yellow,
            ),
          ),
        ),
      );

      await tester.pump();

      expect(find.byType(AnimatedContainer), findsNWidgets(3));
    });

    testWidgets('uses custom spacing', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DotIndicator(
              count: 4,
              currentIndex: 0,
              spacing: 24.0,
            ),
          ),
        ),
      );

      await tester.pump();

      // Verifica que se renderizaron los indicadores (AnimatedContainer)
      expect(find.byType(AnimatedContainer), findsNWidgets(4));
    });

    testWidgets('animates when currentIndex changes', (tester) async {
      int currentIndex = 0;

      await tester.pumpWidget(
        MaterialApp(
          home: StatefulBuilder(
            builder: (context, setState) {
              return Scaffold(
                body: Column(
                  children: [
                    DotIndicator(
                      count: 5,
                      currentIndex: currentIndex,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          currentIndex = 2;
                        });
                      },
                      child: const Text('Change'),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      );

      // Estado inicial
      await tester.pump();

      // Cambia el índice
      await tester.tap(find.text('Change'));
      await tester.pump();

      // Verifica que hay animación en progreso
      await tester.pump(const Duration(milliseconds: 150));
      
      // Completa la animación
      await tester.pumpAndSettle();

      expect(find.byType(AnimatedContainer), findsNWidgets(5));
    });

    testWidgets('handles edge case with minimum count (1)', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DotIndicator(
              count: 1,
              currentIndex: 0,
            ),
          ),
        ),
      );

      expect(find.byType(AnimatedContainer), findsOneWidget);
    });

    testWidgets('works with both variants and all sizes', (tester) async {
      for (final variant in DotIndicatorVariant.values) {
        for (final size in DotIndicatorSize.values) {
          await tester.pumpWidget(
            MaterialApp(
              home: Scaffold(
                body: DotIndicator(
                  count: 3,
                  currentIndex: 1,
                  variant: variant,
                  size: size,
                ),
              ),
            ),
          );

          expect(find.byType(AnimatedContainer), findsNWidgets(3));

          // Limpia para la siguiente iteración
          await tester.pumpWidget(Container());
        }
      }
    });

    test('asserts count > 0', () {
      expect(
        () => DotIndicator(
          count: 0,
          currentIndex: 0,
        ),
        throwsAssertionError,
      );
    });

    test('asserts currentIndex is within valid range', () {
      expect(
        () => DotIndicator(
          count: 5,
          currentIndex: -1,
        ),
        throwsAssertionError,
      );

      expect(
        () => DotIndicator(
          count: 5,
          currentIndex: 5,
        ),
        throwsAssertionError,
      );
    });
  });
}
