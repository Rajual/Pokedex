import 'package:flutter/material.dart';

/// Domain entity for onboarding data
class OnboardingData {
  /// List of pages for the onboarding
  final List<OnboardingPage> pages;

  /// Text for the continue button
  final String continueButtonText;

  /// Text for the skip button
  final String skipButtonText;

  /// Text for the finish button
  final String finishButtonText;

  const OnboardingData({
    required this.pages,
    required this.continueButtonText,
    required this.skipButtonText,
    required this.finishButtonText,
  });

  /// Creates a copy of this OnboardingData with the given fields replaced
  OnboardingData copyWith({
    List<OnboardingPage>? pages,
    String? continueButtonText,
    String? skipButtonText,
    String? finishButtonText,
  }) {
    return OnboardingData(
      pages: pages ?? this.pages,
      continueButtonText: continueButtonText ?? this.continueButtonText,
      skipButtonText: skipButtonText ?? this.skipButtonText,
      finishButtonText: finishButtonText ?? this.finishButtonText,
    );
  }
}

/// Domain entity for an individual onboarding page
class OnboardingPage {
  /// Path to the image asset
  final String imagePath;

  /// Title text for the page
  final String title;

  /// Description text for the page
  final String description;

  /// Optional background color
  final Color? backgroundColor;

  /// Optional text color
  final Color? textColor;

  const OnboardingPage({
    required this.imagePath,
    required this.title,
    required this.description,
    this.backgroundColor,
    this.textColor,
  });

  /// Creates a copy of this OnboardingPage with the given fields replaced
  OnboardingPage copyWith({
    String? imagePath,
    String? title,
    String? description,
    Color? backgroundColor,
    Color? textColor,
  }) {
    return OnboardingPage(
      imagePath: imagePath ?? this.imagePath,
      title: title ?? this.title,
      description: description ?? this.description,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      textColor: textColor ?? this.textColor,
    );
  }
}