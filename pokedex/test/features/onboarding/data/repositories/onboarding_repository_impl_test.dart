import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pokedex/core/common/result.dart';
import 'package:pokedex/features/onboarding/data/repositories/onboarding_repository_impl.dart';

// Mock class
class MockAssetBundle extends Mock implements AssetBundle {}

void main() {
  late OnboardingRepositoryImpl repository;
  late MockAssetBundle mockAssetBundle;

  setUp(() {
    mockAssetBundle = MockAssetBundle();
    repository = OnboardingRepositoryImpl(assetBundle: mockAssetBundle);
  });

  group('OnboardingRepositoryImpl', () {
    test('should return OnboardingData when JSON is valid', () async {
      // Arrange
      const validJson = '''
      {
        "pages": [
          {
            "imagePath": "assets/test.png",
            "title": "Test Title",
            "description": "Test Description",
            "backgroundColor": 4294967295,
            "textColor": 4278190080
          }
        ],
        "continueButtonText": "Continue",
        "skipButtonText": "Skip",
        "finishButtonText": "Finish"
      }
      ''';

      when(mockAssetBundle.loadString('assets/locale/en/onboarding.json'))
          .thenAnswer((_) async => validJson);

      // Act
      final result = await repository.loadOnboardingData();

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

    test('should return OnboardingFailure when JSON parsing fails', () async {
      // Arrange
      const invalidJson = '{ invalid json }';

      when(mockAssetBundle.loadString('assets/locale/en/onboarding.json'))
          .thenAnswer((_) async => invalidJson);

      // Act
      final result = await repository.loadOnboardingData();

      // Assert
      expect(result, isA<Result<OnboardingData, OnboardingFailure>>());
      result.match(
        onSuccess: (_) => fail('Expected failure but got success'),
        onFailure: (failure) {
          expect(failure, isA<OnboardingFailure>());
        },
      );
    });

    test('should return OnboardingFailure when asset is not found', () async {
      // Arrange
      when(mockAssetBundle.loadString('assets/locale/en/onboarding.json'))
          .thenThrow(Exception('Asset not found'));

      // Act
      final result = await repository.loadOnboardingData();

      // Assert
      expect(result, isA<Result<OnboardingData, OnboardingFailure>>());
      result.match(
        onSuccess: (_) => fail('Expected failure but got success'),
        onFailure: (failure) {
          expect(failure, isA<OnboardingFailure>());
        },
      );
    });
  });
}