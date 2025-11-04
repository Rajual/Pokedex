import 'package:flutter/material.dart';
import '../../molecules/skeleton/skeleton.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_dimensions.dart';
import 'models/loading_template_ui_model.dart';

/// Template for displaying loading states with skeleton placeholders
///
/// Provides consistent loading experiences across the app by using
/// skeleton animations that mimic the structure of the actual content.
///
/// Example usage:
/// ```dart
/// LoadingTemplate(
///   uiModel: LoadingTemplateUiModel(
///     title: 'Loading Pokémon...',
///     layoutType: LoadingLayoutType.cards,
///     itemCount: 6,
///   ),
/// )
/// ```
class LoadingTemplate extends StatelessWidget {
  /// UI Model configuration
  final LoadingTemplateUiModel uiModel;

  /// Background color
  final Color? backgroundColor;

  const LoadingTemplate({
    super.key,
    required this.uiModel,
    this.backgroundColor,
  });

  /// Factory constructor for backward compatibility
  factory LoadingTemplate.fromProperties({
    String? title,
    String? subtitle,
    int itemCount = 3,
    LoadingLayoutType layoutType = LoadingLayoutType.list,
    Widget Function(BuildContext context, int index)? itemBuilder,
    Color? backgroundColor,
    EdgeInsetsGeometry? padding,
    Key? key,
  }) {
    return LoadingTemplate(
      uiModel: LoadingTemplateUiModel(
        title: title,
        subtitle: subtitle,
        itemCount: itemCount,
        layoutType: layoutType,
        itemBuilder: itemBuilder,
        backgroundColor: backgroundColor,
        padding: padding,
      ),
      backgroundColor: backgroundColor,
      key: key,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      color: backgroundColor ?? uiModel.backgroundColor ?? AppColors.gray100,
      child: SafeArea(
        child: Padding(
          padding: uiModel.padding ?? const EdgeInsets.all(AppDimensions.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header section
              if (uiModel.title != null) ...[
                Text(
                  uiModel.title!,
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.gray900,
                  ),
                ),
                if (uiModel.subtitle != null) ...[
                  const SizedBox(height: AppDimensions.sm),
                  Text(
                    uiModel.subtitle!,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: AppColors.gray600,
                    ),
                  ),
                ],
                const SizedBox(height: AppDimensions.xl),
              ],

              // Loading content
              Expanded(
                child: _buildLoadingContent(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLoadingContent() {
    switch (uiModel.layoutType) {
      case LoadingLayoutType.list:
        return _buildListLayout();
      case LoadingLayoutType.grid:
        return _buildGridLayout();
      case LoadingLayoutType.cards:
        return _buildCardsLayout();
      case LoadingLayoutType.custom:
        return _buildCustomLayout();
    }
  }

  Widget _buildListLayout() {
    return ListView.builder(
      itemCount: uiModel.itemCount,
      itemBuilder: (context, index) {
        if (uiModel.itemBuilder != null) {
          return uiModel.itemBuilder!(context, index);
        }
        return Container(
          margin: const EdgeInsets.only(bottom: AppDimensions.md),
          child: Row(
            children: [
              const SkeletonAvatar(size: 48),
              const SizedBox(width: AppDimensions.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Skeleton(width: double.infinity, height: 16),
                    const SizedBox(height: AppDimensions.xs),
                    Skeleton(width: 120, height: 14),
                    const SizedBox(height: AppDimensions.xs),
                    Skeleton(width: 80, height: 12),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildGridLayout() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: AppDimensions.md,
        mainAxisSpacing: AppDimensions.md,
        childAspectRatio: 0.8,
      ),
      itemCount: uiModel.itemCount,
      itemBuilder: (context, index) {
        if (uiModel.itemBuilder != null) {
          return uiModel.itemBuilder!(context, index);
        }
        return SkeletonCard();
      },
    );
  }

  Widget _buildCardsLayout() {
    return ListView.builder(
      itemCount: uiModel.itemCount,
      itemBuilder: (context, index) {
        if (uiModel.itemBuilder != null) {
          return uiModel.itemBuilder!(context, index);
        }
        return Container(
          margin: const EdgeInsets.only(bottom: AppDimensions.md),
          child: SkeletonCard(),
        );
      },
    );
  }

  Widget _buildCustomLayout() {
    if (uiModel.itemBuilder == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return ListView.builder(
      itemCount: uiModel.itemCount,
      itemBuilder: uiModel.itemBuilder!,
    );
  }
}