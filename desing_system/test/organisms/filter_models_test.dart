import 'package:flutter_test/flutter_test.dart';
import 'package:desing_system/desing_system.dart';

void main() {
  group('FilterOption', () {
    test('creates FilterOption with required parameters', () {
      const option = FilterOption(
        id: 'fire',
        label: 'Fuego',
      );

      expect(option.id, 'fire');
      expect(option.label, 'Fuego');
      expect(option.isSelected, false);
    });

    test('creates FilterOption with isSelected', () {
      const option = FilterOption(
        id: 'fire',
        label: 'Fuego',
        isSelected: true,
      );

      expect(option.isSelected, true);
    });

    test('copyWith updates isSelected', () {
      const option = FilterOption(
        id: 'fire',
        label: 'Fuego',
        isSelected: false,
      );

      final updated = option.copyWith(isSelected: true);

      expect(updated.id, 'fire');
      expect(updated.label, 'Fuego');
      expect(updated.isSelected, true);
    });

    test('copyWith updates label', () {
      const option = FilterOption(
        id: 'fire',
        label: 'Fuego',
      );

      final updated = option.copyWith(label: 'Fire');

      expect(updated.id, 'fire');
      expect(updated.label, 'Fire');
      expect(updated.isSelected, false);
    });

    test('copyWith updates id', () {
      const option = FilterOption(
        id: 'fire',
        label: 'Fuego',
      );

      final updated = option.copyWith(id: 'water');

      expect(updated.id, 'water');
      expect(updated.label, 'Fuego');
    });

    test('equality works correctly', () {
      const option1 = FilterOption(id: 'fire', label: 'Fuego');
      const option2 = FilterOption(id: 'fire', label: 'Fuego');
      const option3 = FilterOption(id: 'water', label: 'Agua');

      expect(option1, equals(option2));
      expect(option1, isNot(equals(option3)));
    });

    test('hashCode works correctly', () {
      const option1 = FilterOption(id: 'fire', label: 'Fuego');
      const option2 = FilterOption(id: 'fire', label: 'Fuego');

      expect(option1.hashCode, equals(option2.hashCode));
    });

    test('equality considers isSelected', () {
      const option1 = FilterOption(id: 'fire', label: 'Fuego', isSelected: true);
      const option2 = FilterOption(id: 'fire', label: 'Fuego', isSelected: false);

      expect(option1, isNot(equals(option2)));
    });
  });

  group('FilterSection', () {
    test('creates FilterSection with required parameters', () {
      const section = FilterSection(
        title: 'Tipo',
        options: [
          FilterOption(id: 'fire', label: 'Fuego'),
          FilterOption(id: 'water', label: 'Agua'),
        ],
      );

      expect(section.title, 'Tipo');
      expect(section.options.length, 2);
      expect(section.initiallyExpanded, true);
    });

    test('creates FilterSection with initiallyExpanded false', () {
      const section = FilterSection(
        title: 'Tipo',
        options: [],
        initiallyExpanded: false,
      );

      expect(section.initiallyExpanded, false);
    });

    test('can have empty options list', () {
      const section = FilterSection(
        title: 'Empty',
        options: [],
      );

      expect(section.options, isEmpty);
    });

    test('can have multiple options', () {
      const section = FilterSection(
        title: 'Types',
        options: [
          FilterOption(id: '1', label: 'Option 1'),
          FilterOption(id: '2', label: 'Option 2'),
          FilterOption(id: '3', label: 'Option 3'),
        ],
      );

      expect(section.options.length, 3);
    });
  });
}
