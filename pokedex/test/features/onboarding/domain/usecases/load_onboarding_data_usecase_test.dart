import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pokedex/core/common/result.dart';
import 'package:pokedex/features/onboarding/domain/entities/onboarding_data.dart';
import 'package:pokedex/features/onboarding/domain/repositories/onboarding_repository.dart';
import 'package:pokedex/features/onboarding/domain/usecases/load_onboarding_data_usecase.dart';

// Mock class
class MockOnboardingRepository extends Mock implements OnboardingRepository {}

void main() {
  late LoadOnboardingDataUseCase useCase;
  late MockOnboardingRepository mockRepository;

  setUp(() {
    mockRepository = MockOnboardingRepository();
    useCase = LoadOnboardingDataUseCase(mockRepository);
  });

  group('LoadOnboardingDataUseCase', () {
    test('should return OnboardingData when repository succeeds', () async {
      // Arrange
      final expectedData = OnboardingData(
        pages: [
          OnboardingPage(
            imagePath: 'assets/test.png',
            title: 'Test Title',
            description: 'Test Description',
          ),
        ],
        continueButtonText: 'Continue',
        skipButtonText: 'Skip',
        finishButtonText: 'Finish',
      );

      when(mockRepository.loadOnboardingData())
          .thenAnswer((_) async => Result.success(expectedData) as dynamic);

      // Act
      final result = await useCase();

      // Assert
      expect(result, isA<Result<OnboardingData, OnboardingFailure>>());
      result.match(
        onSuccess: (data) {
          expect(data.pages.length, 1);
          expect(data.pages.first.title, 'Test Title');
          expect(data.continueButtonText, 'Continue');
        },
        onFailure: (_) => fail('Expected success but got failure'),
      );
    });

    test('should return OnboardingFailure when repository fails', () async {
      // Arrange
      final expectedFailure = OnboardingFailure.localizationError('Test error');

      when(mockRepository.loadOnboardingData())
          .thenAnswer((_) async => Result.failure(expectedFailure) as dynamic);

      // Act
      final result = await useCase();

      // Assert
      expect(result, isA<Result<OnboardingData, OnboardingFailure>>());
      result.match(
        onSuccess: (_) => fail('Expected failure but got success'),
        onFailure: (failure) {
          expect(failure.toString(), contains('Test error'));
        },
      );
    });
  });
}