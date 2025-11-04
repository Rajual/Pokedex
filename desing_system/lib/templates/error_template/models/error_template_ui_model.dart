import 'package:flutter/material.dart';

/// UI model for the error template
class ErrorTemplateUiModel {
  /// Title text for the error
  final String title;

  /// Description text for the error
  final String description;

  /// Text for the retry button
  final String retryButtonText;

  /// Optional icon path for the error
  final String? iconPath;

  /// Optional icon widget for the error
  final Widget? icon;

  /// Background color for the error screen
  final Color? backgroundColor;

  /// Text color for the error screen
  final Color? textColor;

  /// Button color for the retry button
  final Color? buttonColor;

  /// Button text color for the retry button
  final Color? buttonTextColor;

  const ErrorTemplateUiModel({
    required this.title,
    required this.description,
    required this.retryButtonText,
    this.iconPath,
    this.icon,
    this.backgroundColor,
    this.textColor,
    this.buttonColor,
    this.buttonTextColor,
  });

  /// Creates a copy of this ErrorTemplateUiModel with the given fields replaced
  ErrorTemplateUiModel copyWith({
    String? title,
    String? description,
    String? retryButtonText,
    String? iconPath,
    Widget? icon,
    Color? backgroundColor,
    Color? textColor,
    Color? buttonColor,
    Color? buttonTextColor,
  }) {
    return ErrorTemplateUiModel(
      title: title ?? this.title,
      description: description ?? this.description,
      retryButtonText: retryButtonText ?? this.retryButtonText,
      iconPath: iconPath ?? this.iconPath,
      icon: icon ?? this.icon,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      textColor: textColor ?? this.textColor,
      buttonColor: buttonColor ?? this.buttonColor,
      buttonTextColor: buttonTextColor ?? this.buttonTextColor,
    );
  }
}