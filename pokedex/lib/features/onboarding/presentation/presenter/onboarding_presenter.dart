import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/common/result.dart';
import '../../domain/entities/onboarding_data.dart';
import '../../domain/repositories/onboarding_repository.dart';
import '../../domain/usecases/load_onboarding_data_usecase.dart';
import '../../data/repositories/onboarding_repository_impl.dart';

/// State for the onboarding presenter
class OnboardingState {
  final bool isLoading;
  final OnboardingData? data;
  final String? error;

  const OnboardingState({
    this.isLoading = false,
    this.data,
    this.error,
  });

  OnboardingState copyWith({
    bool? isLoading,
    OnboardingData? data,
    String? error,
  }) {
    return OnboardingState(
      isLoading: isLoading ?? this.isLoading,
      data: data ?? this.data,
      error: error ?? this.error,
    );
  }
}

/// Presenter for onboarding feature using Riverpod
class OnboardingPresenter {
  final LoadOnboardingDataUseCase _loadOnboardingDataUseCase;

  OnboardingPresenter(this._loadOnboardingDataUseCase);

  Future<Result<OnboardingData, OnboardingFailure>> loadData() async {
    return await _loadOnboardingDataUseCase();
  }
}

/// Provider for the onboarding presenter
final onboardingPresenterProvider = Provider<OnboardingPresenter>((ref) {
  // This would normally be injected, but for simplicity we'll create it here
  // In a real app, you'd use a dependency injection framework
  final repository = ref.watch(onboardingRepositoryProvider);
  final useCase = LoadOnboardingDataUseCase(repository);
  return OnboardingPresenter(useCase);
});

/// Provider for the onboarding repository
final onboardingRepositoryProvider = Provider<OnboardingRepository>((ref) {
  // Create the repository implementation
  return OnboardingRepositoryImpl();
});