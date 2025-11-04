import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:desing_system/templates/empty_state_template/empty_state_template.dart';
import '../../../../core/common/result.dart';
import '../../domain/entities/error_entity.dart';
import '../../domain/repositories/error_repository.dart';
import '../presenter/error_presenter.dart';

/// Screen for displaying error states using EmptyStateTemplate
class ErrorScreen extends ConsumerStatefulWidget {
  /// The error type to display
  final ErrorType errorType;

  /// Optional original error for analysis
  final dynamic originalError;

  const ErrorScreen({
    super.key,
    required this.errorType,
    this.originalError,
  });

  @override
  ConsumerState<ErrorScreen> createState() => _ErrorScreenState();
}

class _ErrorScreenState extends ConsumerState<ErrorScreen> {
  Result<(ErrorData, ErrorInfo), ErrorFailure>? _result;

  @override
  void initState() {
    super.initState();
    _loadErrorData();
  }

  Future<void> _loadErrorData() async {
    final presenter = ref.read(errorPresenterProvider);
    final result = await presenter.loadErrorWithInfo(
      widget.errorType,
      widget.originalError,
    );
    setState(() {
      _result = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_result == null) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return _result!.match(
      onSuccess: (data) => _buildErrorContent(data.$1, data.$2),
      onFailure: (error) => _buildFallbackError(error),
    );
  }

  Widget _buildErrorContent(ErrorData errorData, ErrorInfo errorInfo) {
    return EmptyStateTemplate.fromProperties(
      imagePath: errorData.iconPath ?? 'assets/icons/error_generic.png',
      title: errorData.title,
      description: errorData.description,
      actionLabel: errorData.retryButtonText,
      onAction: _loadErrorData,
    );
  }

  Widget _buildFallbackError(ErrorFailure error) {
    return EmptyStateTemplate.fromProperties(
      imagePath: 'assets/icons/error_generic.png',
      title: 'Something went wrong',
      description: 'We encountered an unexpected error. Please try again.',
      actionLabel: 'Retry',
      onAction: _loadErrorData,
    );
  }
}