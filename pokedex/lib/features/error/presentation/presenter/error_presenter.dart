import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/common/result.dart';
import '../../domain/entities/error_entity.dart';
import '../../domain/repositories/error_repository.dart';
import '../../domain/usecases/load_error_data_usecase.dart';
import '../../data/repositories/error_repository_impl.dart';

/// State for the error presenter
class ErrorState {
  final bool isLoading;
  final ErrorData? errorData;
  final ErrorInfo? errorInfo;
  final String? errorMessage;

  const ErrorState({
    this.isLoading = false,
    this.errorData,
    this.errorInfo,
    this.errorMessage,
  });

  ErrorState copyWith({
    bool? isLoading,
    ErrorData? errorData,
    ErrorInfo? errorInfo,
    String? errorMessage,
  }) {
    return ErrorState(
      isLoading: isLoading ?? this.isLoading,
      errorData: errorData ?? this.errorData,
      errorInfo: errorInfo ?? this.errorInfo,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

/// Presenter for error feature using Riverpod
class ErrorPresenter {
  final LoadErrorDataUseCase _loadErrorDataUseCase;
  final CreateErrorInfoUseCase _createErrorInfoUseCase;

  ErrorPresenter(this._loadErrorDataUseCase, this._createErrorInfoUseCase);

  /// Loads error data for a specific error type
  Future<Result<ErrorData, ErrorFailure>> loadErrorData(ErrorType errorType) async {
    return await _loadErrorDataUseCase(errorType);
  }

  /// Creates error info from an exception
  ErrorInfo createErrorInfo(dynamic error, {String? context}) {
    return _createErrorInfoUseCase(error, context: context);
  }

  /// Convenience method to get error data and info in one call
  Future<Result<(ErrorData, ErrorInfo), ErrorFailure>> loadErrorWithInfo(
    ErrorType errorType,
    dynamic originalError, {
    String? context,
  }) async {
    final errorDataResult = await loadErrorData(errorType);
    return errorDataResult.match(
      onSuccess: (errorData) {
        final errorInfo = createErrorInfo(originalError, context: context);
        return Result.success((errorData, errorInfo));
      },
      onFailure: (failure) => Result.failure(failure),
    );
  }
}

/// Provider for the error presenter
final errorPresenterProvider = Provider<ErrorPresenter>((ref) {
  final repository = ref.watch(errorRepositoryProvider);
  final loadErrorDataUseCase = LoadErrorDataUseCase(repository);
  final createErrorInfoUseCase = CreateErrorInfoUseCase(repository);
  return ErrorPresenter(loadErrorDataUseCase, createErrorInfoUseCase);
});

/// Provider for the error repository
final errorRepositoryProvider = Provider<ErrorRepository>((ref) {
  return ErrorRepositoryImpl();
});