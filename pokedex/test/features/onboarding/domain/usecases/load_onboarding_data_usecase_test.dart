import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/core/common/result.dart';
import 'package:pokedex/features/onboarding/data/repositories/onboarding_repository_impl.dart';
import 'package:pokedex/features/onboarding/domain/entities/onboarding_data.dart';
import 'package:pokedex/features/onboarding/domain/repositories/onboarding_repository.dart';
import 'package:pokedex/features/onboarding/domain/usecases/load_onboarding_data_usecase.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('LoadOnboardingDataUseCase', () {
    test('should return OnboardingData from repository', () async {
      // Arrange
      final repository = OnboardingRepositoryImpl();
      final useCase = LoadOnboardingDataUseCase(repository);

      // Act
      final result = await useCase();

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

    test('should have valid page structure', () async {
      // Arrange
      final repository = OnboardingRepositoryImpl();
      final useCase = LoadOnboardingDataUseCase(repository);

      // Act
      final result = await useCase();

      // Assert
      result.match(
        onSuccess: (data) {
          expect(data.pages.length, greaterThan(0));
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