import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../app/config/localizations.dart';
import '../../../../core/common/result.dart';
import '../../domain/entities/onboarding_data.dart';
import '../../domain/repositories/onboarding_repository.dart';

/// Implementation of OnboardingRepository that loads data from localization system
class OnboardingRepositoryImpl implements OnboardingRepository {
  final MyAppLocalizations? _localizations;

  OnboardingRepositoryImpl({MyAppLocalizations? localizations})
      : _localizations = localizations;

  @override
  Future<Result<OnboardingData, OnboardingFailure>> loadOnboardingData() async {
    try {
      // Get current locale from context or use default
      final locale = _localizations?.locale ?? const Locale('en');

      // Create localizations instance if not provided
      final localizations = _localizations ?? MyAppLocalizations(locale);
      if (_localizations == null) {
        await localizations.load();
      }

      final onboardingData = localizations.getOnboardingData();
      if (onboardingData == null) {
        return Result.failure(OnboardingFailure.localizationError('Onboarding data not found'));
      }

      // Parse pages
      final pages = localizations.getOnboardingPages();
      if (pages == null || pages.isEmpty) {
        return Result.failure(OnboardingFailure.parsingError('No onboarding pages found'));
      }

      final onboardingPages = pages.map((pageData) {
        return OnboardingPage(
          imagePath: pageData['imagePath'] as String? ?? '',
          title: pageData['title'] as String? ?? '',
          description: pageData['description'] as String? ?? '',
          backgroundColor: pageData['backgroundColor'] != null
              ? Color(pageData['backgroundColor'] as int)
              : null,
          textColor: pageData['textColor'] != null
              ? Color(pageData['textColor'] as int)
              : null,
        );
      }).toList();

      final data = OnboardingData(
        pages: onboardingPages,
        continueButtonText: localizations.getOnboardingContinueText(),
        skipButtonText: localizations.getOnboardingSkipText(),
        finishButtonText: localizations.getOnboardingFinishText(),
      );

      return Result.success(data);
    } catch (e) {
      return Result.failure(OnboardingFailure.parsingError('Failed to load onboarding data: $e'));
    }
  }
}