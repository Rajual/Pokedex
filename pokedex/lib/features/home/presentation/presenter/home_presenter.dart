import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/common/result.dart';
import '../../domain/entities/home_entity.dart';
import '../../domain/repositories/home_repository.dart';
import '../../domain/usecases/load_home_data_usecase.dart';
import '../../data/repositories/home_repository_impl.dart';

/// State for the home presenter
class HomeState {
  final bool isLoading;
  final HomeData? homeData;
  final HomeConfig? homeConfig;
  final String? error;

  const HomeState({
    this.isLoading = false,
    this.homeData,
    this.homeConfig,
    this.error,
  });

  HomeState copyWith({
    bool? isLoading,
    HomeData? homeData,
    HomeConfig? homeConfig,
    String? error,
  }) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
      homeData: homeData ?? this.homeData,
      homeConfig: homeConfig ?? this.homeConfig,
      error: error ?? this.error,
    );
  }
}

/// Presenter for home feature using Riverpod
class HomePresenter {
  final LoadHomeSetupUseCase _loadHomeSetupUseCase;

  HomePresenter(this._loadHomeSetupUseCase);

  /// Loads complete home setup (data + config)
  Future<Result<(HomeData, HomeConfig), HomeFailure>> loadHomeSetup() async {
    return await _loadHomeSetupUseCase();
  }

  /// Loads only home data
  Future<Result<HomeData, HomeFailure>> loadHomeData() async {
    final loadHomeDataUseCase = LoadHomeDataUseCase(
      HomeRepositoryImpl(),
    );
    return await loadHomeDataUseCase();
  }

  /// Loads only home config
  Future<Result<HomeConfig, HomeFailure>> loadHomeConfig() async {
    final loadHomeConfigUseCase = LoadHomeConfigUseCase(
      HomeRepositoryImpl(),
    );
    return await loadHomeConfigUseCase();
  }
}

/// Provider for the home presenter
final homePresenterProvider = Provider<HomePresenter>((ref) {
  final repository = ref.watch(homeRepositoryProvider);
  final loadHomeDataUseCase = LoadHomeDataUseCase(repository);
  final loadHomeConfigUseCase = LoadHomeConfigUseCase(repository);
  final loadHomeSetupUseCase = LoadHomeSetupUseCase(
    loadHomeDataUseCase,
    loadHomeConfigUseCase,
  );
  return HomePresenter(loadHomeSetupUseCase);
});

/// Provider for the home repository
final homeRepositoryProvider = Provider<HomeRepository>((ref) {
  return HomeRepositoryImpl();
});