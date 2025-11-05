import '../../../../core/common/result.dart';
import '../entities/home_entity.dart';
import '../repositories/home_repository.dart';

/// Use case for loading home data
class LoadHomeDataUseCase {
  final HomeRepository repository;

  const LoadHomeDataUseCase(this.repository);

  /// Executes the use case to load home data
  ///
  /// Returns a [Result] containing either [HomeData] on success
  /// or [HomeFailure] on failure
  Future<Result<HomeData, HomeFailure>> call() {
    return repository.loadHomeData();
  }
}

/// Use case for loading home configuration
class LoadHomeConfigUseCase {
  final HomeRepository repository;

  const LoadHomeConfigUseCase(this.repository);

  /// Executes the use case to load home configuration
  ///
  /// Returns a [Result] containing either [HomeConfig] on success
  /// or [HomeFailure] on failure
  Future<Result<HomeConfig, HomeFailure>> call() {
    return repository.loadHomeConfig();
  }
}

/// Use case for loading complete home setup (data + config)
class LoadHomeSetupUseCase {
  final LoadHomeDataUseCase _loadHomeDataUseCase;
  final LoadHomeConfigUseCase _loadHomeConfigUseCase;

  const LoadHomeSetupUseCase(
    this._loadHomeDataUseCase,
    this._loadHomeConfigUseCase,
  );

  /// Executes the use case to load complete home setup
  ///
  /// Returns a [Result] containing either [(HomeData, HomeConfig)] on success
  /// or [HomeFailure] on failure
  Future<Result<(HomeData, HomeConfig), HomeFailure>> call() async {
    final dataResult = await _loadHomeDataUseCase();
    if (dataResult.isFailure) {
      return dataResult.match(
        onSuccess: (_) => throw StateError('Unexpected success'),
        onFailure: (failure) => Result.failure(failure),
      );
    }

    final configResult = await _loadHomeConfigUseCase();
    if (configResult.isFailure) {
      return configResult.match(
        onSuccess: (_) => throw StateError('Unexpected success'),
        onFailure: (failure) => Result.failure(failure),
      );
    }

    return Result.success((
      dataResult.match(onSuccess: (data) => data, onFailure: (_) => throw StateError('Unexpected failure')),
      configResult.match(onSuccess: (config) => config, onFailure: (_) => throw StateError('Unexpected failure')),
    ));
  }
}