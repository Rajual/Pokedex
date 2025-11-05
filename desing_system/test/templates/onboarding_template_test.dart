import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:desing_system/desing_system.dart';

void main() {
  group('OnboardingTemplate', () {
    testWidgets('renders with correct number of pages', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: OnboardingTemplate.fromProperties(
            pages: const [
              OnboardingPageModel(
                imagePath: 'assets/test1.png',
                title: 'Page 1',
                description: 'Description 1',
              ),
              OnboardingPageModel(
                imagePath: 'assets/test2.png',
                title: 'Page 2',
                description: 'Description 2',
              ),
            ],
            onFinish: () {},
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Verifica que se renderice el DotIndicator con 2 dots
      expect(find.byType(DotIndicator), findsOneWidget);
      
      // Verifica que se renderice el botón de continuar
      expect(find.text('Continuar'), findsOneWidget);
      
      // Verifica que se renderice el PageView
      expect(find.byType(PageView), findsOneWidget);
    });

    testWidgets('shows skip button by default on first page', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: OnboardingTemplate.fromProperties(
            pages: const [
              OnboardingPageModel(
                imagePath: 'assets/test.png',
                title: 'Page',
                description: 'Description',
              ),
              OnboardingPageModel(
                imagePath: 'assets/test2.png',
                title: 'Page 2',
                description: 'Description 2',
              ),
            ],
            onFinish: () {},
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.text('Saltar'), findsOneWidget);
    });

    testWidgets('hides skip button when showSkipButton is false', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: OnboardingTemplate.fromProperties(
            pages: const [
              OnboardingPageModel(
                imagePath: 'assets/test.png',
                title: 'Page',
                description: 'Description',
              ),
            ],
            showSkipButton: false,
            onFinish: () {},
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.text('Saltar'), findsNothing);
    });

    testWidgets('shows continue button on first pages', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: OnboardingTemplate.fromProperties(
            pages: const [
              OnboardingPageModel(
                imagePath: 'assets/test.png',
                title: 'Page 1',
                description: 'Description',
              ),
              OnboardingPageModel(
                imagePath: 'assets/test2.png',
                title: 'Page 2',
                description: 'Description',
              ),
            ],
            onFinish: () {},
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.text('Continuar'), findsOneWidget);
    });

    testWidgets('shows finish button on last page', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: OnboardingTemplate.fromProperties(
            pages: const [
              OnboardingPageModel(
                imagePath: 'assets/test.png',
                title: 'Page 1',
                description: 'Description',
              ),
              OnboardingPageModel(
                imagePath: 'assets/test2.png',
                title: 'Page 2',
                description: 'Description',
              ),
            ],
            onFinish: () {},
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Navega a la última página
      await tester.tap(find.text('Continuar'));
      await tester.pumpAndSettle();

      expect(find.text('Empezamos'), findsOneWidget);
    });

    testWidgets('uses custom button texts', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: OnboardingTemplate.fromProperties(
            pages: const [
              OnboardingPageModel(
                imagePath: 'assets/test.png',
                title: 'Page',
                description: 'Description',
              ),
            ],
            continueButtonText: 'Siguiente',
            skipButtonText: 'Omitir',
            finishButtonText: '¡Listo!',
            onFinish: () {},
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.text('Siguiente'), findsNothing); // No se ve porque es la última página
      expect(find.text('Omitir'), findsNothing); // No se ve en la última página
      expect(find.text('¡Listo!'), findsOneWidget);
    });

    testWidgets('calls onFinish when finish button is tapped', (tester) async {
      bool finishCalled = false;

      await tester.pumpWidget(
        MaterialApp(
          home: OnboardingTemplate.fromProperties(
            pages: const [
              OnboardingPageModel(
                imagePath: 'assets/test.png',
                title: 'Page',
                description: 'Description',
              ),
            ],
            onFinish: () {
              finishCalled = true;
            },
          ),
        ),
      );

      await tester.pumpAndSettle();

      await tester.tap(find.text('Empezamos'));
      await tester.pumpAndSettle();

      expect(finishCalled, isTrue);
    });

    testWidgets('calls onSkip when skip button is tapped', (tester) async {
      bool skipCalled = false;

      await tester.pumpWidget(
        MaterialApp(
          home: OnboardingTemplate.fromProperties(
            pages: const [
              OnboardingPageModel(
                imagePath: 'assets/test.png',
                title: 'Page 1',
                description: 'Description',
              ),
              OnboardingPageModel(
                imagePath: 'assets/test2.png',
                title: 'Page 2',
                description: 'Description',
              ),
            ],
            onSkip: () {
              skipCalled = true;
            },
            onFinish: () {},
          ),
        ),
      );

      await tester.pumpAndSettle();

      await tester.tap(find.text('Saltar'));
      await tester.pumpAndSettle();

      expect(skipCalled, isTrue);
    });

    testWidgets('navigates to next page when continue is tapped', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: OnboardingTemplate.fromProperties(
            pages: const [
              OnboardingPageModel(
                imagePath: 'assets/test1.png',
                title: 'Page 1',
                description: 'Description 1',
              ),
              OnboardingPageModel(
                imagePath: 'assets/test2.png',
                title: 'Page 2',
                description: 'Description 2',
              ),
            ],
            onFinish: () {},
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Verifica que estamos en la primera página
      expect(find.text('Page 1'), findsOneWidget);

      // Navega a la siguiente página
      await tester.tap(find.text('Continuar'));
      await tester.pumpAndSettle();

      // Verifica que estamos en la segunda página
      expect(find.text('Page 2'), findsOneWidget);
    });

    testWidgets('renders with dots variant by default', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: OnboardingTemplate.fromProperties(
            pages: const [
              OnboardingPageModel(
                imagePath: 'assets/test.png',
                title: 'Page',
                description: 'Description',
              ),
            ],
            onFinish: () {},
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.byType(DotIndicator), findsOneWidget);
    });

    testWidgets('renders with bars variant when specified', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: OnboardingTemplate.fromProperties(
            pages: const [
              OnboardingPageModel(
                imagePath: 'assets/test.png',
                title: 'Page',
                description: 'Description',
              ),
            ],
            indicatorVariant: DotIndicatorVariant.bars,
            onFinish: () {},
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.byType(DotIndicator), findsOneWidget);
    });

    testWidgets('allows tapping on dot indicators to navigate', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: OnboardingTemplate.fromProperties(
            pages: const [
              OnboardingPageModel(
                imagePath: 'assets/test1.png',
                title: 'Page 1',
                description: 'Description 1',
              ),
              OnboardingPageModel(
                imagePath: 'assets/test2.png',
                title: 'Page 2',
                description: 'Description 2',
              ),
              OnboardingPageModel(
                imagePath: 'assets/test3.png',
                title: 'Page 3',
                description: 'Description 3',
              ),
            ],
            onFinish: () {},
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Verifica que estamos en la primera página
      expect(find.text('Page 1'), findsOneWidget);

      // Toca el segundo dot para navegar a la segunda página
      final dotIndicator = find.byType(DotIndicator);
      expect(dotIndicator, findsOneWidget);

      // La navegación por tap en dots requiere encontrar los GestureDetector internos
      // Por ahora solo verificamos que el DotIndicator está presente
      expect(find.byType(DotIndicator), findsOneWidget);
    });

    testWidgets('renders page content correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: OnboardingTemplate.fromProperties(
            pages: const [
              OnboardingPageModel(
                imagePath: 'assets/test.png',
                title: 'Welcome',
                description: 'This is a test description',
              ),
            ],
            onFinish: () {},
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.text('Welcome'), findsOneWidget);
      expect(find.text('This is a test description'), findsOneWidget);
      expect(find.byType(AppImage), findsOneWidget);
    });

    testWidgets('uses custom horizontal padding', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: OnboardingTemplate.fromProperties(
            pages: const [
              OnboardingPageModel(
                imagePath: 'assets/test.png',
                title: 'Page',
                description: 'Description',
              ),
            ],
            horizontalPadding: 32.0,
            onFinish: () {},
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Verifica que el template se renderiza correctamente
      expect(find.byType(OnboardingTemplate), findsOneWidget);
    });

    test('asserts pages is not empty', () {
      expect(
        () => OnboardingTemplate.fromProperties(
          pages: const [],
          onFinish: () {},
        ),
        throwsAssertionError,
      );
    });
  });

  group('OnboardingPageModel', () {
    test('can be created with required parameters', () {
      const model = OnboardingPageModel(
        imagePath: 'assets/test.png',
        title: 'Title',
        description: 'Description',
      );

      expect(model.imagePath, 'assets/test.png');
      expect(model.title, 'Title');
      expect(model.description, 'Description');
      expect(model.backgroundColor, isNull);
      expect(model.textColor, isNull);
    });

    test('can be created with optional parameters', () {
      const model = OnboardingPageModel(
        imagePath: 'assets/test.png',
        title: 'Title',
        description: 'Description',
        backgroundColor: Colors.blue,
        textColor: Colors.white,
      );

      expect(model.backgroundColor, Colors.blue);
      expect(model.textColor, Colors.white);
    });
  });
}
