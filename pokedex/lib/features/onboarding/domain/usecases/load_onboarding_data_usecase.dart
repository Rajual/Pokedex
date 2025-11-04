import '../../../../core/common/result.dart';
import '../entities/onboarding_data.dart';
import '../repositories/onboarding_repository.dart';

/// Use case for loading onboarding data
class LoadOnboardingDataUseCase {
  final OnboardingRepository repository;

  const LoadOnboardingDataUseCase(this.repository);

  /// Executes the use case to load onboarding data
  ///
  /// Returns a [Result] containing either [OnboardingData] on success
  /// or [OnboardingFailure] on failure
  Future<Result<OnboardingData, OnboardingFailure>> call() {
    return repository.loadOnboardingData();
  }
}