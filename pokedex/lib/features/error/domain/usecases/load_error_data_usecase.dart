import '../../../../core/common/result.dart';
import '../entities/error_entity.dart';
import '../repositories/error_repository.dart';

/// Use case for loading error data
class LoadErrorDataUseCase {
  final ErrorRepository repository;

  const LoadErrorDataUseCase(this.repository);

  /// Executes the use case to load error data for a specific error type
  ///
  /// Returns a [Result] containing either [ErrorData] on success
  /// or [ErrorFailure] on failure
  Future<Result<ErrorData, ErrorFailure>> call(ErrorType errorType) {
    return repository.loadErrorData(errorType);
  }
}

/// Use case for creating error info from exceptions
class CreateErrorInfoUseCase {
  final ErrorRepository repository;

  const CreateErrorInfoUseCase(this.repository);

  /// Executes the use case to create error info from an exception
  ///
  /// Returns an [ErrorInfo] object with appropriate type and message
  ErrorInfo call(dynamic error, {String? context}) {
    return repository.createErrorInfo(error, context: context);
  }
}