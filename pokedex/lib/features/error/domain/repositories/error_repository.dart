import '../../../../core/common/result.dart';
import '../entities/error_entity.dart';

/// Repository interface for error data operations
abstract class ErrorRepository {
  /// Loads error data for a specific error type from localization files
  ///
  /// Returns a [Result] containing either [ErrorData] on success
  /// or [ErrorFailure] on failure
  Future<Result<ErrorData, ErrorFailure>> loadErrorData(ErrorType errorType);

  /// Creates error info from an exception or error
  ///
  /// This method analyzes the error and determines the appropriate ErrorType
  /// and creates an ErrorInfo object with relevant details
  ErrorInfo createErrorInfo(dynamic error, {String? context});
}

/// Failure types for error operations
abstract class ErrorFailure {
  const ErrorFailure();

  /// Creates a failure for when localization data cannot be loaded
  factory ErrorFailure.localizationError(String message) =>
      _LocalizationError(message);

  /// Creates a failure for when JSON parsing fails
  factory ErrorFailure.parsingError(String message) =>
      _ParsingError(message);

  /// Creates a failure for when required assets are missing
  factory ErrorFailure.assetNotFound(String assetPath) =>
      _AssetNotFound(assetPath);

  /// Creates a failure for when an unsupported error type is requested
  factory ErrorFailure.unsupportedErrorType(ErrorType errorType) =>
      _UnsupportedErrorType(errorType);
}

class _LocalizationError extends ErrorFailure {
  final String message;
  const _LocalizationError(this.message);

  @override
  String toString() => 'LocalizationError: $message';
}

class _ParsingError extends ErrorFailure {
  final String message;
  const _ParsingError(this.message);

  @override
  String toString() => 'ParsingError: $message';
}

class _AssetNotFound extends ErrorFailure {
  final String assetPath;
  const _AssetNotFound(this.assetPath);

  @override
  String toString() => 'AssetNotFound: $assetPath';
}

class _UnsupportedErrorType extends ErrorFailure {
  final ErrorType errorType;
  const _UnsupportedErrorType(this.errorType);

  @override
  String toString() => 'UnsupportedErrorType: $errorType';
}