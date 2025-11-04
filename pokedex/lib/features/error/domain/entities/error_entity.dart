/// Domain entity for error data
class ErrorData {
  /// Title text for the error
  final String title;

  /// Description text for the error
  final String description;

  /// Text for the retry button
  final String retryButtonText;

  /// Optional icon path for the error
  final String? iconPath;

  const ErrorData({
    required this.title,
    required this.description,
    required this.retryButtonText,
    this.iconPath,
  });

  /// Creates a copy of this ErrorData with the given fields replaced
  ErrorData copyWith({
    String? title,
    String? description,
    String? retryButtonText,
    String? iconPath,
  }) {
    return ErrorData(
      title: title ?? this.title,
      description: description ?? this.description,
      retryButtonText: retryButtonText ?? this.retryButtonText,
      iconPath: iconPath ?? this.iconPath,
    );
  }
}

/// Domain entity for different error types
enum ErrorType {
  /// Network connectivity issues
  network,

  /// API server errors (5xx)
  server,

  /// Client errors (4xx)
  client,

  /// Data parsing/validation errors
  parsing,

  /// Authentication/authorization errors
  auth,

  /// Timeout errors
  timeout,

  /// Unknown/unexpected errors
  unknown,
}

/// Domain entity for error information
class ErrorInfo {
  /// The type of error
  final ErrorType type;

  /// Human-readable error message
  final String message;

  /// Optional error code
  final String? code;

  /// Optional additional details
  final Map<String, dynamic>? details;

  const ErrorInfo({
    required this.type,
    required this.message,
    this.code,
    this.details,
  });

  /// Creates a copy of this ErrorInfo with the given fields replaced
  ErrorInfo copyWith({
    ErrorType? type,
    String? message,
    String? code,
    Map<String, dynamic>? details,
  }) {
    return ErrorInfo(
      type: type ?? this.type,
      message: message ?? this.message,
      code: code ?? this.code,
      details: details ?? this.details,
    );
  }
}