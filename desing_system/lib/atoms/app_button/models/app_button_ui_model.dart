import 'package:flutter/material.dart';
import 'button_state.dart';
import '../utils/enum.dart';

/// UI Model for AppButton component
/// Contains all the serializable configuration needed to render an AppButton
/// Note: Callbacks like onPressed should be provided separately when creating the widget
class AppButtonUiModel {
  final String label;
  final ButtonType type;
  final ButtonSize size;
  final bool isLoading;
  final bool isEnabled;
  final IconData? leadingIcon;
  final IconData? trailingIcon;
  final double? width;

  const AppButtonUiModel({
    required this.label,
    this.type = ButtonType.primary,
    this.size = ButtonSize.medium,
    this.isLoading = false,
    this.isEnabled = true,
    this.leadingIcon,
    this.trailingIcon,
    this.width,
  });

  /// Factory constructor to create from JSON
  factory AppButtonUiModel.fromJson(Map<String, dynamic> json) {
    return AppButtonUiModel(
      label: json['label'] as String,
      type: ButtonType.values.firstWhere(
        (e) => e.name == json['type'],
        orElse: () => ButtonType.primary,
      ),
      size: ButtonSize.values.firstWhere(
        (e) => e.name == json['size'],
        orElse: () => ButtonSize.medium,
      ),
      isLoading: json['isLoading'] as bool? ?? false,
      isEnabled: json['isEnabled'] as bool? ?? true,
      leadingIcon: json['leadingIcon'] != null
          ? IconData(json['leadingIcon'] as int, fontFamily: 'MaterialIcons')
          : null,
      trailingIcon: json['trailingIcon'] != null
          ? IconData(json['trailingIcon'] as int, fontFamily: 'MaterialIcons')
          : null,
      width: json['width'] as double?,
    );
  }

  /// Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'label': label,
      'type': type.name,
      'size': size.name,
      'isLoading': isLoading,
      'isEnabled': isEnabled,
      'leadingIcon': leadingIcon?.codePoint,
      'trailingIcon': trailingIcon?.codePoint,
      'width': width,
    };
  }

  /// Create a copy with modified properties
  AppButtonUiModel copyWith({
    String? label,
    ButtonType? type,
    ButtonSize? size,
    bool? isLoading,
    bool? isEnabled,
    IconData? leadingIcon,
    IconData? trailingIcon,
    double? width,
  }) {
    return AppButtonUiModel(
      label: label ?? this.label,
      type: type ?? this.type,
      size: size ?? this.size,
      isLoading: isLoading ?? this.isLoading,
      isEnabled: isEnabled ?? this.isEnabled,
      leadingIcon: leadingIcon ?? this.leadingIcon,
      trailingIcon: trailingIcon ?? this.trailingIcon,
      width: width ?? this.width,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AppButtonUiModel &&
        other.label == label &&
        other.type == type &&
        other.size == size &&
        other.isLoading == isLoading &&
        other.isEnabled == isEnabled &&
        other.leadingIcon == leadingIcon &&
        other.trailingIcon == trailingIcon &&
        other.width == width;
  }

  @override
  int get hashCode {
    return Object.hash(
      label,
      type,
      size,
      isLoading,
      isEnabled,
      leadingIcon,
      trailingIcon,
      width,
    );
  }

  @override
  String toString() {
    return 'AppButtonUiModel(label: $label, type: $type, size: $size, isLoading: $isLoading, isEnabled: $isEnabled, leadingIcon: $leadingIcon, trailingIcon: $trailingIcon, width: $width)';
  }
}