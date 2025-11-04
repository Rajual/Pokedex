import 'package:flutter/material.dart';
import '../../../atoms/app_image/app_image.dart';

/// UI Model for EmptyStateTemplate component
class EmptyStateTemplateUiModel {
  /// Path to the image asset
  final String imagePath;

  /// Main title text
  final String title;

  /// Optional description text
  final String? description;

  /// Optional hint text
  final String? hint;

  /// Optional action button label
  final String? actionLabel;

  /// Optional secondary action button label
  final String? secondaryActionLabel;

  /// Image size
  final AppImageSize imageSize;

  /// Horizontal padding
  final double horizontalPadding;

  /// Spacing between elements
  final double spacing;

  /// Callback for action button (not serializable)
  final VoidCallback? onAction;

  /// Callback for secondary action button (not serializable)
  final VoidCallback? onSecondaryAction;

  const EmptyStateTemplateUiModel({
    required this.imagePath,
    required this.title,
    this.description,
    this.hint,
    this.actionLabel,
    this.secondaryActionLabel,
    this.imageSize = AppImageSize.extraLarge,
    this.horizontalPadding = 24.0,
    this.spacing = 16.0,
    this.onAction,
    this.onSecondaryAction,
  })  : assert(
          actionLabel == null || onAction != null,
          'onAction must be defined if actionLabel is present',
        ),
        assert(
          secondaryActionLabel == null || onSecondaryAction != null,
          'onSecondaryAction must be defined if secondaryActionLabel is present',
        );

  /// Create from JSON (callbacks must be provided separately)
  factory EmptyStateTemplateUiModel.fromJson(
    Map<String, dynamic> json, {
    VoidCallback? onAction,
    VoidCallback? onSecondaryAction,
  }) {
    return EmptyStateTemplateUiModel(
      imagePath: json['imagePath'] as String,
      title: json['title'] as String,
      description: json['description'] as String?,
      hint: json['hint'] as String?,
      actionLabel: json['actionLabel'] as String?,
      secondaryActionLabel: json['secondaryActionLabel'] as String?,
      imageSize: AppImageSize.values[json['imageSize'] ?? 4],
      horizontalPadding: json['horizontalPadding'] as double? ?? 24.0,
      spacing: json['spacing'] as double? ?? 16.0,
      onAction: onAction,
      onSecondaryAction: onSecondaryAction,
    );
  }

  /// Convert to JSON (excludes callbacks)
  Map<String, dynamic> toJson() {
    return {
      'imagePath': imagePath,
      'title': title,
      if (description != null) 'description': description,
      if (hint != null) 'hint': hint,
      if (actionLabel != null) 'actionLabel': actionLabel,
      if (secondaryActionLabel != null) 'secondaryActionLabel': secondaryActionLabel,
      'imageSize': imageSize.index,
      'horizontalPadding': horizontalPadding,
      'spacing': spacing,
    };
  }
}