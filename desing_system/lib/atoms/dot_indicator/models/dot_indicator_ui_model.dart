import 'package:flutter/material.dart';
import '../dot_indicator.dart';

/// UI Model for DotIndicator component
class DotIndicatorUiModel {
  /// Number of indicators
  final int count;

  /// Current active index (0-indexed)
  final int currentIndex;

  /// Size of the indicator
  final DotIndicatorSize size;

  /// Visual variant
  final DotIndicatorVariant variant;

  /// Active indicator color
  final Color? activeColor;

  /// Inactive indicator color
  final Color? inactiveColor;

  /// Spacing between indicators
  final double? spacing;

  const DotIndicatorUiModel({
    required this.count,
    required this.currentIndex,
    this.size = DotIndicatorSize.medium,
    this.variant = DotIndicatorVariant.dots,
    this.activeColor,
    this.inactiveColor,
    this.spacing,
  })  : assert(count > 0, 'count must be greater than 0'),
        assert(currentIndex >= 0 && currentIndex < count,
            'currentIndex must be between 0 and count-1');

  /// Create from JSON
  factory DotIndicatorUiModel.fromJson(Map<String, dynamic> json) {
    return DotIndicatorUiModel(
      count: json['count'] as int,
      currentIndex: json['currentIndex'] as int,
      size: DotIndicatorSize.values[json['size'] ?? 1],
      variant: DotIndicatorVariant.values[json['variant'] ?? 0],
      activeColor: json['activeColor'] != null ? Color(json['activeColor'] as int) : null,
      inactiveColor: json['inactiveColor'] != null ? Color(json['inactiveColor'] as int) : null,
      spacing: json['spacing'] as double?,
    );
  }

  /// Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'count': count,
      'currentIndex': currentIndex,
      'size': size.index,
      'variant': variant.index,
      if (activeColor != null) 'activeColor': activeColor!.value,
      if (inactiveColor != null) 'inactiveColor': inactiveColor!.value,
      if (spacing != null) 'spacing': spacing,
    };
  }
}