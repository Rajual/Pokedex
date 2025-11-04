import 'package:flutter/material.dart';
import 'models/swipe_action_ui_model.dart';

/// Widget que permite deslizar para revelar una acción
/// Se puede usar para envolver cualquier widget y agregar funcionalidad de swipe
class SwipeableCard extends StatefulWidget {
  /// Widget hijo que se va a deslizar
  final Widget child;

  /// Acción que se muestra al deslizar a la izquierda
  final SwipeActionUiModel? swipeAction;

  /// Si está habilitado el swipe
  final bool isEnabled;

  /// Duración de la animación
  final Duration animationDuration;

  const SwipeableCard({
    required this.child,
    this.swipeAction,
    this.isEnabled = true,
    this.animationDuration = const Duration(milliseconds: 300),
    super.key,
  });

  @override
  State<SwipeableCard> createState() => _SwipeableCardState();
}

class _SwipeableCardState extends State<SwipeableCard> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  
  double _dragExtent = 0;
  bool _isDragging = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
    );
    _slideAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(-1.0, 0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleDragStart(DragStartDetails details) {
    if (!widget.isEnabled || widget.swipeAction == null) return;
    
    setState(() {
      _isDragging = true;
    });
  }

  void _handleDragUpdate(DragUpdateDetails details) {
    if (!widget.isEnabled || widget.swipeAction == null || !_isDragging) return;

    final delta = details.primaryDelta ?? 0;
    final cardWidth = context.size?.width ?? 0;
    
    if (cardWidth == 0) return;

    setState(() {
      // Solo permitir deslizar a la izquierda (delta negativo)
      if (delta < 0) {
        _dragExtent = (_dragExtent + delta).clamp(-cardWidth, 0.0);
      } else if (_dragExtent < 0) {
        // Permitir volver si ya estaba deslizado
        _dragExtent = (_dragExtent + delta).clamp(-cardWidth, 0.0);
      }
      
      _controller.value = (_dragExtent.abs() / cardWidth).clamp(0.0, 1.0);
    });
  }

  void _handleDragEnd(DragEndDetails details) {
    if (!widget.isEnabled || widget.swipeAction == null || !_isDragging) return;

    final cardWidth = context.size?.width ?? 0;
    if (cardWidth == 0) return;

    final threshold = widget.swipeAction!.threshold;
    final velocity = details.primaryVelocity ?? 0;
    
    setState(() {
      _isDragging = false;
      
      // Si superó el threshold o tiene velocidad suficiente, completar la acción
      if ((_dragExtent.abs() / cardWidth) >= threshold || velocity < -300) {
        _controller.forward().then((_) {
          widget.swipeAction?.onAction?.call();
          // Resetear después de la acción
          Future.delayed(const Duration(milliseconds: 300), () {
            if (mounted) {
              _controller.reverse().then((_) {
                if (mounted) {
                  setState(() {
                    _dragExtent = 0;
                  });
                }
              });
            }
          });
        });
      } else {
        // Volver a la posición original
        _controller.reverse().then((_) {
          if (mounted) {
            setState(() {
              _dragExtent = 0;
            });
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.swipeAction == null || !widget.isEnabled) {
      return widget.child;
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        return GestureDetector(
          onHorizontalDragStart: _handleDragStart,
          onHorizontalDragUpdate: _handleDragUpdate,
          onHorizontalDragEnd: _handleDragEnd,
          child: Stack(
            children: [
              // Background con la acción
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    color: widget.swipeAction!.backgroundColor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: AnimatedOpacity(
                    opacity: _controller.value > 0.1 ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 150),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          widget.swipeAction!.icon,
                          color: widget.swipeAction!.iconColor,
                          size: 32,
                        ),
                        if (widget.swipeAction!.label != null) ...[
                          const SizedBox(height: 4),
                          Text(
                            widget.swipeAction!.label!,
                            style: TextStyle(
                              color: widget.swipeAction!.iconColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              ),
              // Card que se desliza
              SlideTransition(
                position: _slideAnimation,
                child: widget.child,
              ),
            ],
          ),
        );
      },
    );
  }
}
