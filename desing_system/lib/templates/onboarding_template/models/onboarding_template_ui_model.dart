import 'package:flutter/material.dart';
import '../onboarding_page_model.dart';

/// UI Model for OnboardingTemplate component
///
/// This model contains all serializable properties for the OnboardingTemplate
/// component, allowing it to be configured via JSON.
class OnboardingTemplateUiModel {
  /// List of pages for the onboarding
  final List<OnboardingPageModel> pages;

  /// Text for the continue button (default: "Continuar")
  final String continueButtonText;

  /// Text for the skip button (default: "Saltar")
  final String skipButtonText;

  /// Text for the finish button (default: "Empezamos")
  final String finishButtonText;

  /// Size of the DotIndicator
  final String indicatorSize;

  /// Variant of the DotIndicator
  final String indicatorVariant;

  /// Whether to show the skip button
  final bool showSkipButton;

  /// Horizontal padding for content
  final double horizontalPadding;

  const OnboardingTemplateUiModel({
    required this.pages,
    this.continueButtonText = 'Continuar',
    this.skipButtonText = 'Saltar',
    this.finishButtonText = 'Empezamos',
    this.indicatorSize = 'medium',
    this.indicatorVariant = 'dots',
    this.showSkipButton = true,
    this.horizontalPadding = 24.0,
  }) : assert(pages.length > 0, 'pages debe tener al menos un elemento');

  /// Creates a OnboardingTemplateUiModel from JSON
  factory OnboardingTemplateUiModel.fromJson(Map<String, dynamic> json) {
    return OnboardingTemplateUiModel(
      pages: (json['pages'] as List<dynamic>?)
          ?.map((page) => OnboardingPageModel(
                imagePath: page['imagePath'] as String,
                title: page['title'] as String,
                description: page['description'] as String,
                backgroundColor: page['backgroundColor'] != null
                    ? Color(page['backgroundColor'] as int)
                    : null,
                textColor: page['textColor'] != null
                    ? Color(page['textColor'] as int)
                    : null,
              ))
          .toList() ?? [],
      continueButtonText: json['continueButtonText'] as String? ?? 'Continuar',
      skipButtonText: json['skipButtonText'] as String? ?? 'Saltar',
      finishButtonText: json['finishButtonText'] as String? ?? 'Empezamos',
      indicatorSize: json['indicatorSize'] as String? ?? 'medium',
      indicatorVariant: json['indicatorVariant'] as String? ?? 'dots',
      showSkipButton: json['showSkipButton'] as bool? ?? true,
      horizontalPadding: (json['horizontalPadding'] as num?)?.toDouble() ?? 24.0,
    );
  }

  /// Converts the OnboardingTemplateUiModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'pages': pages.map((page) => {
        'imagePath': page.imagePath,
        'title': page.title,
        'description': page.description,
        'backgroundColor': page.backgroundColor?.value,
        'textColor': page.textColor?.value,
      }).toList(),
      'continueButtonText': continueButtonText,
      'skipButtonText': skipButtonText,
      'finishButtonText': finishButtonText,
      'indicatorSize': indicatorSize,
      'indicatorVariant': indicatorVariant,
      'showSkipButton': showSkipButton,
      'horizontalPadding': horizontalPadding,
    };
  }

  /// Creates a copy of this OnboardingTemplateUiModel with the given fields replaced
  OnboardingTemplateUiModel copyWith({
    List<OnboardingPageModel>? pages,
    String? continueButtonText,
    String? skipButtonText,
    String? finishButtonText,
    String? indicatorSize,
    String? indicatorVariant,
    bool? showSkipButton,
    double? horizontalPadding,
  }) {
    return OnboardingTemplateUiModel(
      pages: pages ?? this.pages,
      continueButtonText: continueButtonText ?? this.continueButtonText,
      skipButtonText: skipButtonText ?? this.skipButtonText,
      finishButtonText: finishButtonText ?? this.finishButtonText,
      indicatorSize: indicatorSize ?? this.indicatorSize,
      indicatorVariant: indicatorVariant ?? this.indicatorVariant,
      showSkipButton: showSkipButton ?? this.showSkipButton,
      horizontalPadding: horizontalPadding ?? this.horizontalPadding,
    );
  }
}