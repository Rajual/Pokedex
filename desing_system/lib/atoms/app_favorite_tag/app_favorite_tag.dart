import 'package:flutter/material.dart';
import 'models/app_favorite_tag_ui_model.dart';
import 'utils/favorite_tag_enums.dart';
import 'utils/favorite_tag_styles.dart' as styles;

/// Componente interactivo para marcar/desmarcar favoritos
///
/// Ejemplo:
/// ```dart
/// AppFavoriteTag(
///   uiModel: AppFavoriteTagUiModel(isFavorite: true),
///   onFavoriteChanged: (isFav) {
///     setState(() {
///       isFavorite = isFav;
///     });
///   },
/// )
/// ```
class AppFavoriteTag extends StatefulWidget {
  final AppFavoriteTagUiModel uiModel;

  /// Callback cuando cambia el estado
  final Function(bool) onFavoriteChanged;

  const AppFavoriteTag({
    required this.uiModel,
    required this.onFavoriteChanged,
    super.key,
  });

  /// Factory constructor for backward compatibility
  factory AppFavoriteTag.fromProperties({
    required bool isFavorite,
    required Function(bool) onFavoriteChanged,
    FavoriteTagSize size = FavoriteTagSize.medium,
    FavoriteTagStyle style = FavoriteTagStyle.floating,
    Color activeColor = const Color(0xFFEF4444),
    Color inactiveColor = const Color(0xFF9CA3AF),
    bool enableAnimation = true,
    Duration animationDuration = const Duration(milliseconds: 300),
    bool isEnabled = true,
    Key? key,
  }) {
    return AppFavoriteTag(
      uiModel: AppFavoriteTagUiModel(
        isFavorite: isFavorite,
        size: size,
        style: style,
        activeColor: activeColor,
        inactiveColor: inactiveColor,
        enableAnimation: enableAnimation,
        animationDuration: animationDuration,
        isEnabled: isEnabled,
      ),
      onFavoriteChanged: onFavoriteChanged,
      key: key,
    );
  }

  @override
  State<AppFavoriteTag> createState() => _AppFavoriteTagState();
}

class _AppFavoriteTagState extends State<AppFavoriteTag>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: widget.uiModel.animationDuration,
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleFavorite() {
    if (!widget.uiModel.isEnabled) return;

    if (widget.uiModel.enableAnimation) {
      _animationController.forward().then((_) {
        _animationController.reverse();
      });
    }

    widget.onFavoriteChanged(!widget.uiModel.isFavorite);
  }

  @override
  Widget build(BuildContext context) {
    final dimension = widget.uiModel.size.dimension;
    final iconSize = widget.uiModel.size.iconSize;
    final currentColor =
        widget.uiModel.isFavorite ? widget.uiModel.activeColor : widget.uiModel.inactiveColor;

    final button = styles.FavoriteTagStyleFactory.create(
      style: widget.uiModel.style,
      dimension: dimension,
      iconSize: iconSize,
      currentColor: currentColor,
      isFavorite: widget.uiModel.isFavorite,
      onTap: _toggleFavorite,
      isEnabled: widget.uiModel.isEnabled,
    );

    if (widget.uiModel.enableAnimation) {
      return ScaleTransition(
        scale: _scaleAnimation,
        child: button,
      );
    }

    return button;
  }
}
