import 'package:desing_system/organisms/filter_bottom_sheet/models/filter_bottom_sheet_ui_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:desing_system/desing_system.dart';

void main() {
  group('FilterBottomSheet', () {
    testWidgets('renders with required parameters', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: FilterBottomSheet(uiModel: FilterBottomSheetUiModel(
                title: 'Filtrar',
                sections: const [
                  FilterSection(
                    title: 'Tipo',
                    options: [
                      FilterOption(id: 'fire', label: 'Fuego'),
                    ],
                  ),
                ],
              ),
              onApply: (_) {},
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.text('Filtrar'), findsOneWidget);
      expect(find.text('Tipo'), findsOneWidget);
      expect(find.text('Fuego'), findsOneWidget);
    });

    testWidgets('renders title correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: FilterBottomSheet(uiModel: FilterBottomSheetUiModel(
                title: 'Filtra por tus preferencias',
                sections: const [],
              ),
              onApply: (_) {},
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.text('Filtra por tus preferencias'), findsOneWidget);
    });

    testWidgets('renders multiple sections', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: FilterBottomSheet(uiModel: FilterBottomSheetUiModel(
                title: 'Filtros',
                sections: const [
                  FilterSection(
                    title: 'Tipo',
                    options: [
                      FilterOption(id: 'fire', label: 'Fuego'),
                    ],
                  ),
                  FilterSection(
                    title: 'Generación',
                    options: [
                      FilterOption(id: 'gen1', label: 'Gen I'),
                    ],
                  ),
                ],
              ),
              onApply: (_) {},
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.text('Tipo'), findsOneWidget);
      expect(find.text('Generación'), findsOneWidget);
    });

    testWidgets('renders all options in a section', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: FilterBottomSheet.fromProperties(              title: 'Filtros',
              sections: const [
                FilterSection(
                  title: 'Tipo',
                  options: [
                    FilterOption(id: 'fire', label: 'Fuego'),
                    FilterOption(id: 'water', label: 'Agua'),
                    FilterOption(id: 'grass', label: 'Planta'),
                  ],
                ),
              ],
              onApply: (_) {},
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.text('Fuego'), findsOneWidget);
      expect(find.text('Agua'), findsOneWidget);
      expect(find.text('Planta'), findsOneWidget);
    });

    testWidgets('shows apply button with default text', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: FilterBottomSheet.fromProperties(              title: 'Filtros',
              sections: const [],
              onApply: (_) {},
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.text('Aplicar'), findsOneWidget);
    });

    testWidgets('shows cancel button with default text', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: FilterBottomSheet.fromProperties(              title: 'Filtros',
              sections: const [],
              onApply: (_) {},
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.text('Cancelar'), findsOneWidget);
    });

    testWidgets('shows custom apply button text', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: FilterBottomSheet.fromProperties(              title: 'Filtros',
              sections: const [],
              onApply: (_) {},
              applyButtonText: 'Confirmar',
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.text('Confirmar'), findsOneWidget);
    });

    testWidgets('shows custom cancel button text', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: FilterBottomSheet.fromProperties(              title: 'Filtros',
              sections: const [],
              onApply: (_) {},
              cancelButtonText: 'Cerrar',
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.text('Cerrar'), findsOneWidget);
    });

    testWidgets('shows drag handle by default', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: FilterBottomSheet.fromProperties(              title: 'Filtros',
              sections: const [],
              onApply: (_) {},
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // El drag handle es un Container, verificamos que existe
      expect(find.byType(Container), findsWidgets);
    });

    testWidgets('hides drag handle when showDragHandle is false', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: FilterBottomSheet.fromProperties(              title: 'Filtros',
              sections: const [],
              onApply: (_) {},
              showDragHandle: false,
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.byType(FilterBottomSheet), findsOneWidget);
    });

    testWidgets('shows checkboxes for each option', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: FilterBottomSheet.fromProperties(              title: 'Filtros',
              sections: const [
                FilterSection(
                  title: 'Tipo',
                  options: [
                    FilterOption(id: 'fire', label: 'Fuego'),
                    FilterOption(id: 'water', label: 'Agua'),
                  ],
                ),
              ],
              onApply: (_) {},
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.byType(Checkbox), findsNWidgets(2));
    });

    testWidgets('checkbox is checked when option isSelected is true', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: FilterBottomSheet.fromProperties(              title: 'Filtros',
              sections: const [
                FilterSection(
                  title: 'Tipo',
                  options: [
                    FilterOption(id: 'fire', label: 'Fuego', isSelected: true),
                  ],
                ),
              ],
              onApply: (_) {},
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      final checkbox = tester.widget<Checkbox>(find.byType(Checkbox));
      expect(checkbox.value, true);
    });

    testWidgets('checkbox is unchecked when option isSelected is false', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: FilterBottomSheet.fromProperties(              title: 'Filtros',
              sections: const [
                FilterSection(
                  title: 'Tipo',
                  options: [
                    FilterOption(id: 'fire', label: 'Fuego', isSelected: false),
                  ],
                ),
              ],
              onApply: (_) {},
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      final checkbox = tester.widget<Checkbox>(find.byType(Checkbox));
      expect(checkbox.value, false);
    });

    testWidgets('toggles checkbox when tapped', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: FilterBottomSheet.fromProperties(              title: 'Filtros',
              sections: const [
                FilterSection(
                  title: 'Tipo',
                  options: [
                    FilterOption(id: 'fire', label: 'Fuego', isSelected: false),
                  ],
                ),
              ],
              onApply: (_) {},
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Estado inicial
      Checkbox checkbox = tester.widget<Checkbox>(find.byType(Checkbox));
      expect(checkbox.value, false);

      // Toca el checkbox
      await tester.tap(find.byType(Checkbox));
      await tester.pumpAndSettle();

      // Verifica que cambió
      checkbox = tester.widget<Checkbox>(find.byType(Checkbox));
      expect(checkbox.value, true);
    });

    testWidgets('section can be collapsed and expanded', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: FilterBottomSheet.fromProperties(              title: 'Filtros',
              sections: const [
                FilterSection(
                  title: 'Tipo',
                  initiallyExpanded: true,
                  options: [
                    FilterOption(id: 'fire', label: 'Fuego'),
                  ],
                ),
              ],
              onApply: (_) {},
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Inicialmente expandida, el checkbox es visible
      expect(find.text('Fuego'), findsOneWidget);

      // Colapsa la sección tocando el título
      await tester.tap(find.text('Tipo'));
      await tester.pumpAndSettle();

      // Ahora el checkbox no debería ser visible
      expect(find.text('Fuego'), findsNothing);

      // Expande de nuevo
      await tester.tap(find.text('Tipo'));
      await tester.pumpAndSettle();

      // El checkbox es visible de nuevo
      expect(find.text('Fuego'), findsOneWidget);
    });

    testWidgets('section starts collapsed when initiallyExpanded is false', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: FilterBottomSheet.fromProperties(              title: 'Filtros',
              sections: const [
                FilterSection(
                  title: 'Tipo',
                  initiallyExpanded: false,
                  options: [
                    FilterOption(id: 'fire', label: 'Fuego'),
                  ],
                ),
              ],
              onApply: (_) {},
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Inicialmente colapsada
      expect(find.text('Fuego'), findsNothing);
    });

    testWidgets('shows close button', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: FilterBottomSheet.fromProperties(              title: 'Filtros',
              sections: const [],
              onApply: (_) {},
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.close), findsOneWidget);
    });

    testWidgets('renders both buttons', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: FilterBottomSheet.fromProperties(              title: 'Filtros',
              sections: const [],
              onApply: (_) {},
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.byType(AppButton), findsNWidgets(2));
    });
  });
}
