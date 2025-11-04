import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:desing_system/atoms/app_button/models/app_button_ui_model.dart';
import 'package:desing_system/atoms/app_button/utils/enum.dart';

void main() {
  group('AppButtonUiModel', () {
    const testModel = AppButtonUiModel(
      label: 'Test Button',
      type: ButtonType.secondary,
      size: ButtonSize.large,
      isLoading: true,
      isEnabled: false,
      leadingIcon: Icons.add,
      trailingIcon: Icons.arrow_forward,
      width: 200.0,
    );

    test('should create model with default values', () {
      const model = AppButtonUiModel(label: 'Test');

      expect(model.label, 'Test');
      expect(model.type, ButtonType.primary);
      expect(model.size, ButtonSize.medium);
      expect(model.isLoading, false);
      expect(model.isEnabled, true);
      expect(model.leadingIcon, null);
      expect(model.trailingIcon, null);
      expect(model.width, null);
    });

    test('should create model with custom values', () {
      expect(testModel.label, 'Test Button');
      expect(testModel.type, ButtonType.secondary);
      expect(testModel.size, ButtonSize.large);
      expect(testModel.isLoading, true);
      expect(testModel.isEnabled, false);
      expect(testModel.leadingIcon, Icons.add);
      expect(testModel.trailingIcon, Icons.arrow_forward);
      expect(testModel.width, 200.0);
    });

    test('should convert to JSON correctly', () {
      final json = testModel.toJson();

      expect(json['label'], 'Test Button');
      expect(json['type'], 'secondary');
      expect(json['size'], 'large');
      expect(json['isLoading'], true);
      expect(json['isEnabled'], false);
      expect(json['leadingIcon'], Icons.add.codePoint);
      expect(json['trailingIcon'], Icons.arrow_forward.codePoint);
      expect(json['width'], 200.0);
    });

    test('should create from JSON correctly', () {
      final json = {
        'label': 'JSON Button',
        'type': 'tertiary',
        'size': 'small',
        'isLoading': false,
        'isEnabled': true,
        'leadingIcon': Icons.star.codePoint,
        'trailingIcon': Icons.check.codePoint,
        'width': 150.0,
      };

      final model = AppButtonUiModel.fromJson(json);

      expect(model.label, 'JSON Button');
      expect(model.type, ButtonType.tertiary);
      expect(model.size, ButtonSize.small);
      expect(model.isLoading, false);
      expect(model.isEnabled, true);
      expect(model.leadingIcon, Icons.star);
      expect(model.trailingIcon, Icons.check);
      expect(model.width, 150.0);
    });

    test('should handle null values in JSON', () {
      final json = {
        'label': 'Minimal Button',
        // Missing other fields
      };

      final model = AppButtonUiModel.fromJson(json);

      expect(model.label, 'Minimal Button');
      expect(model.type, ButtonType.primary); // Default
      expect(model.size, ButtonSize.medium); // Default
      expect(model.isLoading, false); // Default
      expect(model.isEnabled, true); // Default
      expect(model.leadingIcon, null);
      expect(model.trailingIcon, null);
      expect(model.width, null);
    });

    test('should create copy with modified values', () {
      final copy = testModel.copyWith(
        label: 'Modified Button',
        type: ButtonType.primary,
        isLoading: false,
      );

      expect(copy.label, 'Modified Button');
      expect(copy.type, ButtonType.primary);
      expect(copy.size, ButtonSize.large); // Unchanged
      expect(copy.isLoading, false);
      expect(copy.isEnabled, false); // Unchanged
    });

    test('should be equal when properties are the same', () {
      const model1 = AppButtonUiModel(label: 'Test');
      const model2 = AppButtonUiModel(label: 'Test');

      expect(model1, model2);
    });

    test('should not be equal when properties differ', () {
      const model1 = AppButtonUiModel(label: 'Test 1');
      const model2 = AppButtonUiModel(label: 'Test 2');

      expect(model1, isNot(model2));
    });

    test('should have consistent hashCode', () {
      const model1 = AppButtonUiModel(label: 'Test');
      const model2 = AppButtonUiModel(label: 'Test');

      expect(model1.hashCode, model2.hashCode);
    });
  });
}