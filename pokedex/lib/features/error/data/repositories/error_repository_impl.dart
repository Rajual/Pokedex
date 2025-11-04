import 'dart:convert';
import 'package:flutter/services.dart';
import '../../../../core/common/result.dart';
import '../../domain/entities/error_entity.dart';
import '../../domain/repositories/error_repository.dart';

/// Implementation of ErrorRepository
class ErrorRepositoryImpl implements ErrorRepository {
  @override
  Future<Result<ErrorData, ErrorFailure>> loadErrorData(ErrorType errorType) async {
    try {
      // Load localization data
      final localeData = await _loadLocaleData();

      // Get error configuration for the specific type
      final errorConfig = localeData['errors']?[errorType.name];
      if (errorConfig == null) {
        return Result.failure(ErrorFailure.unsupportedErrorType(errorType));
      }

      // Parse error data
      final errorData = ErrorData(
        title: errorConfig['title'] ?? 'Error',
        description: errorConfig['description'] ?? 'An error occurred',
        retryButtonText: errorConfig['retryButtonText'] ?? 'Retry',
        iconPath: errorConfig['iconPath'],
      );

      return Result.success(errorData);
    } catch (e) {
      if (e is FormatException) {
        return Result.failure(ErrorFailure.parsingError(e.message));
      } else if (e is PlatformException) {
        return Result.failure(ErrorFailure.assetNotFound(e.message ?? 'Asset not found'));
      } else {
        return Result.failure(ErrorFailure.localizationError(e.toString()));
      }
    }
  }

  @override
  ErrorInfo createErrorInfo(dynamic error, {String? context}) {
    // Analyze the error type and create appropriate ErrorInfo
    if (error is Exception) {
      // Handle specific exception types
      if (error.toString().contains('SocketException') ||
          error.toString().contains('Network')) {
        return ErrorInfo(
          type: ErrorType.network,
          message: 'Network connection error. Please check your internet connection.',
          code: 'NETWORK_ERROR',
          details: {'context': context, 'originalError': error.toString()},
        );
      } else if (error.toString().contains('Timeout')) {
        return ErrorInfo(
          type: ErrorType.timeout,
          message: 'Request timed out. Please try again.',
          code: 'TIMEOUT_ERROR',
          details: {'context': context, 'originalError': error.toString()},
        );
      } else if (error.toString().contains('401') || error.toString().contains('403')) {
        return ErrorInfo(
          type: ErrorType.auth,
          message: 'Authentication failed. Please log in again.',
          code: 'AUTH_ERROR',
          details: {'context': context, 'originalError': error.toString()},
        );
      } else if (error.toString().contains('4')) {
        return ErrorInfo(
          type: ErrorType.client,
          message: 'Request error. Please check your input and try again.',
          code: 'CLIENT_ERROR',
          details: {'context': context, 'originalError': error.toString()},
        );
      } else if (error.toString().contains('5')) {
        return ErrorInfo(
          type: ErrorType.server,
          message: 'Server error. Please try again later.',
          code: 'SERVER_ERROR',
          details: {'context': context, 'originalError': error.toString()},
        );
      } else if (error.toString().contains('FormatException') ||
                 error.toString().contains('Json')) {
        return ErrorInfo(
          type: ErrorType.parsing,
          message: 'Data parsing error. Please try again.',
          code: 'PARSING_ERROR',
          details: {'context': context, 'originalError': error.toString()},
        );
      }
    }

    // Default unknown error
    return ErrorInfo(
      type: ErrorType.unknown,
      message: 'An unexpected error occurred. Please try again.',
      code: 'UNKNOWN_ERROR',
      details: {'context': context, 'originalError': error.toString()},
    );
  }

  Future<Map<String, dynamic>> _loadLocaleData() async {
    // Get current locale (simplified - in real app you'd use localization service)
    // For now, we'll assume English as default
    const locale = 'en';

    final assetPath = 'assets/locals/$locale/error.json';
    final jsonString = await rootBundle.loadString(assetPath);
    return json.decode(jsonString) as Map<String, dynamic>;
  }
}