import '../../../../core/common/result.dart';
import '../entities/home_entity.dart';

/// Repository interface for home data operations
abstract class HomeRepository {
  /// Loads home configuration data from localization files
  ///
  /// Returns a [Result] containing either [HomeData] on success
  /// or [HomeFailure] on failure
  Future<Result<HomeData, HomeFailure>> loadHomeData();

  /// Loads home configuration settings
  ///
  /// Returns a [Result] containing either [HomeConfig] on success
  /// or [HomeFailure] on failure
  Future<Result<HomeConfig, HomeFailure>> loadHomeConfig();
}

/// Failure types for home operations
abstract class HomeFailure {
  const HomeFailure();

  /// Creates a failure for when localization data cannot be loaded
  factory HomeFailure.localizationError(String message) =>
      _LocalizationError(message);

  /// Creates a failure for when JSON parsing fails
  factory HomeFailure.parsingError(String message) =>
      _ParsingError(message);

  /// Creates a failure for when required assets are missing
  factory HomeFailure.assetNotFound(String assetPath) =>
      _AssetNotFound(assetPath);

  /// Creates a failure for when navigation configuration is invalid
  factory HomeFailure.invalidConfiguration(String message) =>
      _InvalidConfiguration(message);
}

class _LocalizationError extends HomeFailure {
  final String message;
  const _LocalizationError(this.message);

  @override
  String toString() => 'LocalizationError: $message';
}

class _ParsingError extends HomeFailure {
  final String message;
  const _ParsingError(this.message);

  @override
  String toString() => 'ParsingError: $message';
}

class _AssetNotFound extends HomeFailure {
  final String assetPath;
  const _AssetNotFound(this.assetPath);

  @override
  String toString() => 'AssetNotFound: $assetPath';
}

class _InvalidConfiguration extends HomeFailure {
  final String message;
  const _InvalidConfiguration(this.message);

  @override
  String toString() => 'InvalidConfiguration: $message';
}