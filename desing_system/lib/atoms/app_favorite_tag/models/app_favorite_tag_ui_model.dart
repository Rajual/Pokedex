import 'package:flutter/material.dart';
import '../utils/favorite_tag_enums.dart';

/// UI Model for AppFavoriteTag component
/// Contains all the serializable configuration needed to render an AppFavoriteTag
/// Note: Callbacks like onFavoriteChanged should be provided separately when creating the widget
class AppFavoriteTagUiModel {
  final bool isFavorite;
  final FavoriteTagSize size;
  final FavoriteTagStyle style;
  final Color activeColor;
  final Color inactiveColor;
  final bool enableAnimation;
  final Duration animationDuration;
  final bool isEnabled;

  const AppFavoriteTagUiModel({
    required this.isFavorite,
    this.size = FavoriteTagSize.medium,
    this.style = FavoriteTagStyle.floating,
    this.activeColor = const Color(0xFFEF4444), // Red
    this.inactiveColor = const Color(0xFF9CA3AF), // Gray
    this.enableAnimation = true,
    this.animationDuration = const Duration(milliseconds: 300),
    this.isEnabled = true,
  });

  /// Factory constructor to create from JSON
  factory AppFavoriteTagUiModel.fromJson(Map<String, dynamic> json) {
    return AppFavoriteTagUiModel(
      isFavorite: json['isFavorite'] as bool,
      size: FavoriteTagSize.values.firstWhere(
        (e) => e.name == json['size'],
        orElse: () => FavoriteTagSize.medium,
      ),
      style: FavoriteTagStyle.values.firstWhere(
        (e) => e.name == json['style'],
        orElse: () => FavoriteTagStyle.floating,
      ),
      activeColor: json['activeColor'] != null
          ? Color(json['activeColor'] as int)
          : const Color(0xFFEF4444),
      inactiveColor: json['inactiveColor'] != null
          ? Color(json['inactiveColor'] as int)
          : const Color(0xFF9CA3AF),
      enableAnimation: json['enableAnimation'] as bool? ?? true,
      animationDuration: json['animationDuration'] != null
          ? Duration(milliseconds: json['animationDuration'] as int)
          : const Duration(milliseconds: 300),
      isEnabled: json['isEnabled'] as bool? ?? true,
    );
  }

  /// Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'isFavorite': isFavorite,
      'size': size.name,
      'style': style.name,
      'activeColor': activeColor.value,
      'inactiveColor': inactiveColor.value,
      'enableAnimation': enableAnimation,
      'animationDuration': animationDuration.inMilliseconds,
      'isEnabled': isEnabled,
    };
  }

  /// Create a copy with modified properties
  AppFavoriteTagUiModel copyWith({
    bool? isFavorite,
    FavoriteTagSize? size,
    FavoriteTagStyle? style,
    Color? activeColor,
    Color? inactiveColor,
    bool? enableAnimation,
    Duration? animationDuration,
    bool? isEnabled,
  }) {
    return AppFavoriteTagUiModel(
      isFavorite: isFavorite ?? this.isFavorite,
      size: size ?? this.size,
      style: style ?? this.style,
      activeColor: activeColor ?? this.activeColor,
      inactiveColor: inactiveColor ?? this.inactiveColor,
      enableAnimation: enableAnimation ?? this.enableAnimation,
      animationDuration: animationDuration ?? this.animationDuration,
      isEnabled: isEnabled ?? this.isEnabled,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AppFavoriteTagUiModel &&
        other.isFavorite == isFavorite &&
        other.size == size &&
        other.style == style &&
        other.activeColor == activeColor &&
        other.inactiveColor == inactiveColor &&
        other.enableAnimation == enableAnimation &&
        other.animationDuration == animationDuration &&
        other.isEnabled == isEnabled;
  }

  @override
  int get hashCode {
    return Object.hash(
      isFavorite,
      size,
      style,
      activeColor,
      inactiveColor,
      enableAnimation,
      animationDuration,
      isEnabled,
    );
  }

  @override
  String toString() {
    return 'AppFavoriteTagUiModel(isFavorite: $isFavorite, size: $size, style: $style, activeColor: $activeColor, inactiveColor: $inactiveColor, enableAnimation: $enableAnimation, animationDuration: $animationDuration, isEnabled: $isEnabled)';
  }
}