import 'package:flutter/material.dart';
import '../../../atoms/app_image/app_image.dart';

/// UI Model for LoadingTemplate
class LoadingTemplateUiModel {
  /// Title text to display
  final String? title;

  /// Subtitle/description text
  final String? subtitle;

  /// Number of skeleton items to show
  final int itemCount;

  /// Type of skeleton layout
  final LoadingLayoutType layoutType;

  /// Custom skeleton builder for complex layouts
  final Widget Function(BuildContext context, int index)? itemBuilder;

  /// Background color
  final Color? backgroundColor;

  /// Padding around the content
  final EdgeInsetsGeometry? padding;

  const LoadingTemplateUiModel({
    this.title,
    this.subtitle,
    this.itemCount = 3,
    this.layoutType = LoadingLayoutType.list,
    this.itemBuilder,
    this.backgroundColor,
    this.padding,
  });
}

/// Types of loading layouts
enum LoadingLayoutType {
  /// Vertical list layout
  list,

  /// Grid layout
  grid,

  /// Card-based layout
  cards,

  /// Custom layout using itemBuilder
  custom,
}