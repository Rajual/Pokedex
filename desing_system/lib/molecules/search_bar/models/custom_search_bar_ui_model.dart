import 'package:flutter/material.dart';
import '../search_bar.dart';

/// Tamaños disponibles para CustomSearchBar
enum SearchBarSize {
  small,    // Compacta
  medium,   // Estándar
  large,    // Expandida
}

extension SearchBarSizeExtension on SearchBarSize {
  double get height {
    return switch (this) {
      SearchBarSize.small => 40,
      SearchBarSize.medium => 48,
      SearchBarSize.large => 56,
    };
  }

  double get fontSize {
    return switch (this) {
      SearchBarSize.small => 12,
      SearchBarSize.medium => 14,
      SearchBarSize.large => 16,
    };
  }

  double get padding {
    return switch (this) {
      SearchBarSize.small => 8,
      SearchBarSize.medium => 12,
      SearchBarSize.large => 16,
    };
  }

  double get borderRadius {
    return switch (this) {
      SearchBarSize.small => 12,
      SearchBarSize.medium => 16,
      SearchBarSize.large => 20,
    };
  }

  double get iconSize {
    return switch (this) {
      SearchBarSize.small => 18,
      SearchBarSize.medium => 20,
      SearchBarSize.large => 24,
    };
  }
}

/// UI Model for CustomSearchBar component
/// Contains all the serializable configuration needed to render a CustomSearchBar
/// Note: Callbacks like onChanged, onSearch, onClear should be provided separately when creating the widget
class CustomSearchBarUiModel {
  final String hintText;
  final SearchBarSize size;
  final Color backgroundColor;
  final Color textColor;
  final Color hintColor;
  final Color iconColor;
  final bool isEnabled;
  final bool showSearchIcon;
  final bool showClearIcon;
  final String initialText;
  final bool hasBorder;
  final Color borderColor;

  const CustomSearchBarUiModel({
    this.hintText = 'Buscar...',
    this.size = SearchBarSize.medium,
    this.backgroundColor = const Color(0xFFF5F5F5),
    this.textColor = const Color(0xFF333333),
    this.hintColor = const Color(0xFF999999),
    this.iconColor = const Color(0xFF666666),
    this.isEnabled = true,
    this.showSearchIcon = true,
    this.showClearIcon = true,
    this.initialText = '',
    this.hasBorder = false,
    this.borderColor = const Color(0xFFE0E0E0),
  });

  /// Factory constructor to create from JSON
  factory CustomSearchBarUiModel.fromJson(Map<String, dynamic> json) {
    return CustomSearchBarUiModel(
      hintText: json['hintText'] as String? ?? 'Buscar...',
      size: SearchBarSize.values.firstWhere(
        (e) => e.name == json['size'],
        orElse: () => SearchBarSize.medium,
      ),
      backgroundColor: json['backgroundColor'] != null
          ? Color(json['backgroundColor'] as int)
          : const Color(0xFFF5F5F5),
      textColor: json['textColor'] != null
          ? Color(json['textColor'] as int)
          : const Color(0xFF333333),
      hintColor: json['hintColor'] != null
          ? Color(json['hintColor'] as int)
          : const Color(0xFF999999),
      iconColor: json['iconColor'] != null
          ? Color(json['iconColor'] as int)
          : const Color(0xFF666666),
      isEnabled: json['isEnabled'] as bool? ?? true,
      showSearchIcon: json['showSearchIcon'] as bool? ?? true,
      showClearIcon: json['showClearIcon'] as bool? ?? true,
      initialText: json['initialText'] as String? ?? '',
      hasBorder: json['hasBorder'] as bool? ?? false,
      borderColor: json['borderColor'] != null
          ? Color(json['borderColor'] as int)
          : const Color(0xFFE0E0E0),
    );
  }

  /// Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'hintText': hintText,
      'size': size.name,
      'backgroundColor': backgroundColor.value,
      'textColor': textColor.value,
      'hintColor': hintColor.value,
      'iconColor': iconColor.value,
      'isEnabled': isEnabled,
      'showSearchIcon': showSearchIcon,
      'showClearIcon': showClearIcon,
      'initialText': initialText,
      'hasBorder': hasBorder,
      'borderColor': borderColor.value,
    };
  }

  /// Create a copy with modified properties
  CustomSearchBarUiModel copyWith({
    String? hintText,
    SearchBarSize? size,
    Color? backgroundColor,
    Color? textColor,
    Color? hintColor,
    Color? iconColor,
    bool? isEnabled,
    bool? showSearchIcon,
    bool? showClearIcon,
    String? initialText,
    bool? hasBorder,
    Color? borderColor,
  }) {
    return CustomSearchBarUiModel(
      hintText: hintText ?? this.hintText,
      size: size ?? this.size,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      textColor: textColor ?? this.textColor,
      hintColor: hintColor ?? this.hintColor,
      iconColor: iconColor ?? this.iconColor,
      isEnabled: isEnabled ?? this.isEnabled,
      showSearchIcon: showSearchIcon ?? this.showSearchIcon,
      showClearIcon: showClearIcon ?? this.showClearIcon,
      initialText: initialText ?? this.initialText,
      hasBorder: hasBorder ?? this.hasBorder,
      borderColor: borderColor ?? this.borderColor,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CustomSearchBarUiModel &&
        other.hintText == hintText &&
        other.size == size &&
        other.backgroundColor == backgroundColor &&
        other.textColor == textColor &&
        other.hintColor == hintColor &&
        other.iconColor == iconColor &&
        other.isEnabled == isEnabled &&
        other.showSearchIcon == showSearchIcon &&
        other.showClearIcon == showClearIcon &&
        other.initialText == initialText &&
        other.hasBorder == hasBorder &&
        other.borderColor == borderColor;
  }

  @override
  int get hashCode {
    return Object.hash(
      hintText,
      size,
      backgroundColor,
      textColor,
      hintColor,
      iconColor,
      isEnabled,
      showSearchIcon,
      showClearIcon,
      initialText,
      hasBorder,
      borderColor,
    );
  }

  @override
  String toString() {
    return 'CustomSearchBarUiModel(hintText: $hintText, size: $size, backgroundColor: $backgroundColor, textColor: $textColor, hintColor: $hintColor, iconColor: $iconColor, isEnabled: $isEnabled, showSearchIcon: $showSearchIcon, showClearIcon: $showClearIcon, initialText: $initialText, hasBorder: $hasBorder, borderColor: $borderColor)';
  }
}