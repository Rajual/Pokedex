/// Result type for handling success and failure cases using Dart patterns
sealed class Result<Success, Failure> {
  const Result();

  /// Creates a successful result
  factory Result.success(Success value) = SuccessResult<Success, Failure>;

  /// Creates a failure result
  factory Result.failure(Failure error) = FailureResult<Success, Failure>;

  /// Pattern matching method for handling results
  T match<T>({
    required T Function(Success success) onSuccess,
    required T Function(Failure failure) onFailure,
  }) {
    return switch (this) {
      SuccessResult(success: final success) => onSuccess(success),
      FailureResult(failure: final failure) => onFailure(failure),
    };
  }

  /// Maps the success value to a new type
  Result<T, Failure> map<T>(T Function(Success success) transform) {
    return switch (this) {
      SuccessResult(success: final success) => Result.success(transform(success)),
      FailureResult(failure: final failure) => Result.failure(failure),
    };
  }

  /// Maps the failure value to a new type
  Result<Success, T> mapError<T>(T Function(Failure failure) transform) {
    return switch (this) {
      SuccessResult(success: final success) => Result.success(success),
      FailureResult(failure: final failure) => Result.failure(transform(failure)),
    };
  }

  /// Flat maps the success value
  Result<T, Failure> flatMap<T>(Result<T, Failure> Function(Success success) transform) {
    return switch (this) {
      SuccessResult(success: final success) => transform(success),
      FailureResult(failure: final failure) => Result.failure(failure),
    };
  }

  /// Gets the success value or throws if it's a failure
  Success getOrThrow() {
    return switch (this) {
      SuccessResult(success: final success) => success,
      FailureResult(failure: final failure) => throw Exception(failure.toString()),
    };
  }

  /// Gets the success value or returns a default value
  Success getOrElse(Success defaultValue) {
    return switch (this) {
      SuccessResult(success: final success) => success,
      FailureResult() => defaultValue,
    };
  }

  /// Checks if the result is successful
  bool get isSuccess => this is SuccessResult<Success, Failure>;

  /// Checks if the result is a failure
  bool get isFailure => this is FailureResult<Success, Failure>;
}

/// Success result implementation
class SuccessResult<Success, Failure> extends Result<Success, Failure> {
  final Success success;
  const SuccessResult(this.success);

  @override
  String toString() => 'Success($success)';
}

/// Failure result implementation
class FailureResult<Success, Failure> extends Result<Success, Failure> {
  final Failure failure;
  const FailureResult(this.failure);

  @override
  String toString() => 'Failure($failure)';
}