import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/app/config/localizations.dart';
import 'package:pokedex/core/common/result.dart';
import 'package:pokedex/features/onboarding/data/repositories/onboarding_repository_impl.dart';
import 'package:pokedex/features/onboarding/domain/entities/onboarding_data.dart';
import 'package:pokedex/features/onboarding/domain/repositories/onboarding_repository.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('OnboardingRepositoryImpl', () {
    test('should return OnboardingData with default locale', () async {
      // Arrange
      final repository = OnboardingRepositoryImpl();

      // Act
      final result = await repository.loadOnboardingData();

      // Assert
      expect(result.isSuccess, true);
      result.match(
        onSuccess: (data) {
          expect(data.pages, isNotEmpty);
          expect(data.continueButtonText, isNotEmpty);
          expect(data.skipButtonText, isNotEmpty);
          expect(data.finishButtonText, isNotEmpty);
        },
        onFailure: (_) => fail('Expected success but got failure'),
      );
    });

    test('should create pages with correct structure', () async {
      // Arrange
      final repository = OnboardingRepositoryImpl();

      // Act
      final result = await repository.loadOnboardingData();

      // Assert
      result.match(
        onSuccess: (data) {
          for (final page in data.pages) {
            expect(page.imagePath, isNotEmpty);
            expect(page.title, isNotEmpty);
            expect(page.description, isNotEmpty);
          }
        },
        onFailure: (_) => fail('Expected success but got failure'),
      );
    });
  });
}