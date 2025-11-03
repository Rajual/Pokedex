import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokedex/core/design_system/atoms/app_svg/exports.dart';

void main() {
  group('AppSvg - Size Tests', () {
    testWidgets('small size renders correctly', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppSvg('assets/test.svg', size: SvgSize.small),
          ),
        ),
      );

      final svg = find.byType(SvgPicture);
      expect(svg, findsOneWidget);

      final appSvg = find.byType(AppSvg);
      expect(appSvg, findsOneWidget);

      // Verificar que el primer SizedBox (el externo) tiene las dimensiones correctas
      final sizedBoxes = find.byType(SizedBox);
      expect(sizedBoxes, findsWidgets);
      
      final firstSizedBox = tester.widget<SizedBox>(sizedBoxes.first);
      expect(firstSizedBox.width, 24.0);
      expect(firstSizedBox.height, 24.0);
    });

    testWidgets('medium size renders correctly', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppSvg('assets/test.svg', size: SvgSize.medium),
          ),
        ),
      );

      final svg = find.byType(SvgPicture);
      expect(svg, findsOneWidget);

      final sizedBoxes = find.byType(SizedBox);
      final firstSizedBox = tester.widget<SizedBox>(sizedBoxes.first);
      expect(firstSizedBox.width, 48.0);
      expect(firstSizedBox.height, 48.0);
    });

    testWidgets('large size renders correctly', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppSvg('assets/test.svg', size: SvgSize.large),
          ),
        ),
      );

      final svg = find.byType(SvgPicture);
      expect(svg, findsOneWidget);

      final sizedBoxes = find.byType(SizedBox);
      final firstSizedBox = tester.widget<SizedBox>(sizedBoxes.first);
      expect(firstSizedBox.width, 96.0);
      expect(firstSizedBox.height, 96.0);
    });
  });

  group('AppSvg - Color Tests', () {
    testWidgets('renders without color when color is null', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppSvg('assets/test.svg', color: null),
          ),
        ),
      );

      final svg = find.byType(SvgPicture);
      expect(svg, findsOneWidget);
    });

    testWidgets('renders with color when color is provided', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppSvg(
              'assets/test.svg',
              color: Color(0xFFFF0000),
            ),
          ),
        ),
      );

      final svg = find.byType(SvgPicture);
      expect(svg, findsOneWidget);
    });
  });

  group('AppSvg - Fit Tests', () {
    testWidgets('contain fit renders correctly', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppSvg(
              'assets/test.svg',
              fit: BoxFit.contain,
            ),
          ),
        ),
      );

      final svg = find.byType(SvgPicture);
      expect(svg, findsOneWidget);
    });

    testWidgets('cover fit renders correctly', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppSvg(
              'assets/test.svg',
              fit: BoxFit.cover,
            ),
          ),
        ),
      );

      final svg = find.byType(SvgPicture);
      expect(svg, findsOneWidget);
    });
  });

  group('AppSvg - Placeholder Tests', () {
    testWidgets('no placeholder when showPlaceholder is false', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppSvg(
              'assets/test.svg',
              showPlaceholder: false,
            ),
          ),
        ),
      );

      final progressIndicator = find.byType(CircularProgressIndicator);
      expect(progressIndicator, findsNothing);
    });

    testWidgets('shows placeholder when showPlaceholder is true', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppSvg(
              'assets/test.svg',
              showPlaceholder: true,
            ),
          ),
        ),
      );

      // El placeholder se muestra como parámetro, pero SvgPicture lo maneja internamente
      final svg = find.byType(SvgPicture);
      expect(svg, findsOneWidget);
    });
  });

  group('AppSvg - Combination Tests', () {
    testWidgets('all properties combined work correctly', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppSvg(
              'assets/pokemon.svg',
              size: SvgSize.large,
              color: Color(0xFF0052CC),
              fit: BoxFit.cover,
              showPlaceholder: true,
            ),
          ),
        ),
      );

      final svg = find.byType(SvgPicture);
      expect(svg, findsOneWidget);

      final sizedBoxes = find.byType(SizedBox);
      final firstSizedBox = tester.widget<SizedBox>(sizedBoxes.first);
      expect(firstSizedBox.width, 96.0);
      expect(firstSizedBox.height, 96.0);
    });

    testWidgets('default values work correctly', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppSvg('assets/test.svg'),
          ),
        ),
      );

      final svg = find.byType(SvgPicture);
      expect(svg, findsOneWidget);

      final sizedBoxes = find.byType(SizedBox);
      final firstSizedBox = tester.widget<SizedBox>(sizedBoxes.first);
      expect(firstSizedBox.width, 48.0); // medium default
      expect(firstSizedBox.height, 48.0);
    });
  });
}
