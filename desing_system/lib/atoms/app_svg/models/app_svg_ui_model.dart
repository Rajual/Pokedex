import 'package:flutter/material.dart';

/// Tamaños disponibles para AppSvg
enum SvgSize {
  small,    // 16x16
  medium,   // 24x24
  large,    // 32x32
  extraLarge, // 48x48
}

extension SvgSizeExtension on SvgSize {
  double get size {
    return switch (this) {
      SvgSize.small => 16,
      SvgSize.medium => 24,
      SvgSize.large => 32,
      SvgSize.extraLarge => 48,
    };
  }
}

/// UI Model for AppSvg component
/// Contains all the serializable configuration needed to render an AppSvg
class AppSvgUiModel {
  final String assetPath;
  final SvgSize size;
  final Color? color;
  final BoxFit fit;
  final bool showPlaceholder;

  const AppSvgUiModel({
    required this.assetPath,
    this.size = SvgSize.medium,
    this.color,
    this.fit = BoxFit.contain,
    this.showPlaceholder = false,
  });

  /// Factory constructor to create from JSON
  factory AppSvgUiModel.fromJson(Map<String, dynamic> json) {
    return AppSvgUiModel(
      assetPath: json['assetPath'] as String,
      size: SvgSize.values.firstWhere(
        (e) => e.name == json['size'],
        orElse: () => SvgSize.medium,
      ),
      color: json['color'] != null
          ? Color(json['color'] as int)
          : null,
      fit: BoxFit.values.firstWhere(
        (e) => e.name == json['fit'],
        orElse: () => BoxFit.contain,
      ),
      showPlaceholder: json['showPlaceholder'] as bool? ?? false,
    );
  }

  /// Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'assetPath': assetPath,
      'size': size.name,
      'color': color?.value,
      'fit': fit.name,
      'showPlaceholder': showPlaceholder,
    };
  }

  /// Create a copy with modified properties
  AppSvgUiModel copyWith({
    String? assetPath,
    SvgSize? size,
    Color? color,
    BoxFit? fit,
    bool? showPlaceholder,
  }) {
    return AppSvgUiModel(
      assetPath: assetPath ?? this.assetPath,
      size: size ?? this.size,
      color: color ?? this.color,
      fit: fit ?? this.fit,
      showPlaceholder: showPlaceholder ?? this.showPlaceholder,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AppSvgUiModel &&
        other.assetPath == assetPath &&
        other.size == size &&
        other.color == color &&
        other.fit == fit &&
        other.showPlaceholder == showPlaceholder;
  }

  @override
  int get hashCode {
    return Object.hash(
      assetPath,
      size,
      color,
      fit,
      showPlaceholder,
    );
  }

  @override
  String toString() {
    return 'AppSvgUiModel(assetPath: $assetPath, size: $size, color: $color, fit: $fit, showPlaceholder: $showPlaceholder)';
  }
}