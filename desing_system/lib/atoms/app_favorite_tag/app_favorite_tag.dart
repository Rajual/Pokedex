import 'package:flutter/material.dart';
import 'utils/favorite_tag_enums.dart';
import 'utils/favorite_tag_styles.dart' as styles;

/// Componente interactivo para marcar/desmarcar favoritos
/// 
/// Ejemplo:
/// ```dart
/// AppFavoriteTag(
///   isFavorite: true,
///   onFavoriteChanged: (isFav) {
///     setState(() {
///       isFavorite = isFav;
///     });
///   },
/// )
/// ```
class AppFavoriteTag extends StatefulWidget {
  /// Si está marcado como favorito
  final bool isFavorite;

  /// Callback cuando cambia el estado
  final Function(bool) onFavoriteChanged;

  /// Tamaño del botón
  final FavoriteTagSize size;

  /// Estilo del botón
  final FavoriteTagStyle style;

  /// Color cuando está activo (favorito)
  final Color activeColor;

  /// Color cuando está inactivo
  final Color inactiveColor;

  /// Habilita animación al cambiar estado
  final bool enableAnimation;

  /// Duración de la animación
  final Duration animationDuration;

  /// Si el botón está habilitado para interacción
  final bool isEnabled;

  const AppFavoriteTag({
    required this.isFavorite,
    required this.onFavoriteChanged,
    this.size = FavoriteTagSize.medium,
    this.style = FavoriteTagStyle.floating,
    this.activeColor = const Color(0xFFEF4444), // Red
    this.inactiveColor = const Color(0xFF9CA3AF), // Gray
    this.enableAnimation = true,
    this.animationDuration = const Duration(milliseconds: 300),
    this.isEnabled = true,
    super.key,
  });

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
      duration: widget.animationDuration,
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
    if (!widget.isEnabled) return;

    if (widget.enableAnimation) {
      _animationController.forward().then((_) {
        _animationController.reverse();
      });
    }

    widget.onFavoriteChanged(!widget.isFavorite);
  }

  @override
  Widget build(BuildContext context) {
    final dimension = widget.size.dimension;
    final iconSize = widget.size.iconSize;
    final currentColor =
        widget.isFavorite ? widget.activeColor : widget.inactiveColor;

    final button = styles.FavoriteTagStyleFactory.create(
      style: widget.style,
      dimension: dimension,
      iconSize: iconSize,
      currentColor: currentColor,
      isFavorite: widget.isFavorite,
      onTap: _toggleFavorite,
      isEnabled: widget.isEnabled,
    );

    if (widget.enableAnimation) {
      return ScaleTransition(
        scale: _scaleAnimation,
        child: button,
      );
    }

    return button;
  }
}
