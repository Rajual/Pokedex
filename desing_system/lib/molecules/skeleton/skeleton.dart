import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_dimensions.dart';

/// Skeleton molecule for loading states
///
/// Provides animated placeholder content that mimics the structure
/// of the actual content being loaded.
///
/// Example usage:
/// ```dart
/// Skeleton(
///   width: 200,
///   height: 20,
///   borderRadius: 4,
/// )
/// ```
class Skeleton extends StatefulWidget {
  /// Width of the skeleton
  final double? width;

  /// Height of the skeleton
  final double? height;

  /// Border radius for rounded corners
  final double borderRadius;

  /// Background color of the skeleton
  final Color? color;

  /// Animation duration
  final Duration duration;

  const Skeleton({
    super.key,
    this.width,
    this.height,
    this.borderRadius = 4.0,
    this.color,
    this.duration = const Duration(milliseconds: 1500),
  });

  @override
  State<Skeleton> createState() => _SkeletonState();
}

class _SkeletonState extends State<Skeleton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    )..repeat();

    _animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            color: _getAnimatedColor(),
            borderRadius: BorderRadius.circular(widget.borderRadius),
          ),
        );
      },
    );
  }

  Color _getAnimatedColor() {
    final baseColor = widget.color ?? AppColors.gray200;
    final opacity = 0.3 + (_animation.value * 0.4); // 0.3 to 0.7 opacity range
    return baseColor.withOpacity(opacity);
  }
}

/// Skeleton variants for common UI elements

/// Skeleton for text lines
class SkeletonText extends StatelessWidget {
  final double? width;
  final double height;
  final int lines;

  const SkeletonText({
    super.key,
    this.width,
    this.height = 16.0,
    this.lines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(
        lines,
        (index) => Container(
          margin: EdgeInsets.only(bottom: index < lines - 1 ? 8.0 : 0),
          child: Skeleton(
            width: index == lines - 1 && lines > 1
                ? (width ?? double.infinity) * 0.7 // Last line shorter
                : width,
            height: height,
          ),
        ),
      ),
    );
  }
}

/// Skeleton for circular avatars
class SkeletonAvatar extends StatelessWidget {
  final double size;

  const SkeletonAvatar({
    super.key,
    this.size = 40.0,
  });

  @override
  Widget build(BuildContext context) {
    return Skeleton(
      width: size,
      height: size,
      borderRadius: size / 2,
    );
  }
}

/// Skeleton for rectangular cards
class SkeletonCard extends StatelessWidget {
  final double? width;
  final double? height;
  final EdgeInsetsGeometry padding;

  const SkeletonCard({
    super.key,
    this.width,
    this.height = 100.0,
    this.padding = const EdgeInsets.all(16.0),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppDimensions.md),
        border: Border.all(color: AppColors.gray200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const SkeletonAvatar(size: 32),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Skeleton(width: double.infinity, height: 14),
                    const SizedBox(height: 4),
                    Skeleton(width: 100, height: 12),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Expanded(
            child: Skeleton(width: double.infinity, height: 60),
          ),
        ],
      ),
    );
  }
}