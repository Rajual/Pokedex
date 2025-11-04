import 'package:flutter/material.dart';

/// Tamaños disponibles para AppImage
enum AppImageSize {
  small,      // 80x80
  medium,     // 120x120
  large,      // 160x160
  extraLarge, // 200x200
}

extension AppImageSizeExtension on AppImageSize {
  double get dimension {
    return switch (this) {
      AppImageSize.small => 80,
      AppImageSize.medium => 120,
      AppImageSize.large => 160,
      AppImageSize.extraLarge => 200,
    };
  }
}

/// Modo de ajuste de imagen
enum AppImageFit {
  cover,
  contain,
  fill,
  fitWidth,
  fitHeight,
}

extension AppImageFitExtension on AppImageFit {
  BoxFit get boxFit {
    return switch (this) {
      AppImageFit.cover => BoxFit.cover,
      AppImageFit.contain => BoxFit.contain,
      AppImageFit.fill => BoxFit.fill,
      AppImageFit.fitWidth => BoxFit.fitWidth,
      AppImageFit.fitHeight => BoxFit.fitHeight,
    };
  }
}

/// UI Model for AppImage component
/// Contains all the serializable configuration needed to render an AppImage
class AppImageUiModel {
  final String assetPath;
  final AppImageSize size;
  final AppImageFit fit;
  final double borderRadius;
  final bool showShadow;
  final Color? backgroundColor;
  final bool showErrorIcon;

  const AppImageUiModel({
    required this.assetPath,
    this.size = AppImageSize.medium,
    this.fit = AppImageFit.cover,
    this.borderRadius = 8.0,
    this.showShadow = false,
    this.backgroundColor,
    this.showErrorIcon = true,
  });

  /// Factory constructor to create from JSON
  factory AppImageUiModel.fromJson(Map<String, dynamic> json) {
    return AppImageUiModel(
      assetPath: json['assetPath'] as String,
      size: AppImageSize.values.firstWhere(
        (e) => e.name == json['size'],
        orElse: () => AppImageSize.medium,
      ),
      fit: AppImageFit.values.firstWhere(
        (e) => e.name == json['fit'],
        orElse: () => AppImageFit.cover,
      ),
      borderRadius: json['borderRadius'] as double? ?? 8.0,
      showShadow: json['showShadow'] as bool? ?? false,
      backgroundColor: json['backgroundColor'] != null
          ? Color(json['backgroundColor'] as int)
          : null,
      showErrorIcon: json['showErrorIcon'] as bool? ?? true,
    );
  }

  /// Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'assetPath': assetPath,
      'size': size.name,
      'fit': fit.name,
      'borderRadius': borderRadius,
      'showShadow': showShadow,
      'backgroundColor': backgroundColor?.value,
      'showErrorIcon': showErrorIcon,
    };
  }

  /// Create a copy with modified properties
  AppImageUiModel copyWith({
    String? assetPath,
    AppImageSize? size,
    AppImageFit? fit,
    double? borderRadius,
    bool? showShadow,
    Color? backgroundColor,
    bool? showErrorIcon,
  }) {
    return AppImageUiModel(
      assetPath: assetPath ?? this.assetPath,
      size: size ?? this.size,
      fit: fit ?? this.fit,
      borderRadius: borderRadius ?? this.borderRadius,
      showShadow: showShadow ?? this.showShadow,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      showErrorIcon: showErrorIcon ?? this.showErrorIcon,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AppImageUiModel &&
        other.assetPath == assetPath &&
        other.size == size &&
        other.fit == fit &&
        other.borderRadius == borderRadius &&
        other.showShadow == showShadow &&
        other.backgroundColor == backgroundColor &&
        other.showErrorIcon == showErrorIcon;
  }

  @override
  int get hashCode {
    return Object.hash(
      assetPath,
      size,
      fit,
      borderRadius,
      showShadow,
      backgroundColor,
      showErrorIcon,
    );
  }

  @override
  String toString() {
    return 'AppImageUiModel(assetPath: $assetPath, size: $size, fit: $fit, borderRadius: $borderRadius, showShadow: $showShadow, backgroundColor: $backgroundColor, showErrorIcon: $showErrorIcon)';
  }
}