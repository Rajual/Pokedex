
import '../../../../core/common/result.dart';
import '../entities/onboarding_data.dart';

/// Repository interface for onboarding data operations
abstract class OnboardingRepository {
  /// Loads onboarding data from localization files
  ///
  /// Returns a [Result] containing either [OnboardingData] on success
  /// or [OnboardingFailure] on failure
  Future<Result<OnboardingData, OnboardingFailure>> loadOnboardingData();
}

/// Failure types for onboarding operations
abstract class OnboardingFailure {
  const OnboardingFailure();

  /// Creates a failure for when localization data cannot be loaded
  factory OnboardingFailure.localizationError(String message) =>
      _LocalizationError(message);

  /// Creates a failure for when JSON parsing fails
  factory OnboardingFailure.parsingError(String message) =>
      _ParsingError(message);

  /// Creates a failure for when required assets are missing
  factory OnboardingFailure.assetNotFound(String assetPath) =>
      _AssetNotFound(assetPath);
}

class _LocalizationError extends OnboardingFailure {
  final String message;
  const _LocalizationError(this.message);

  @override
  String toString() => 'LocalizationError: $message';
}

class _ParsingError extends OnboardingFailure {
  final String message;
  const _ParsingError(this.message);

  @override
  String toString() => 'ParsingError: $message';
}

class _AssetNotFound extends OnboardingFailure {
  final String assetPath;
  const _AssetNotFound(this.assetPath);

  @override
  String toString() => 'AssetNotFound: $assetPath';
}