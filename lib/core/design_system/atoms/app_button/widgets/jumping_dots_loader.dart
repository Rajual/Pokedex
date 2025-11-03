import 'package:flutter/material.dart';

class JumpingDotsLoader extends StatefulWidget {
  final Color color;
  final double dotSize;
  final double spacing;
  final double jumpHeight;

  const JumpingDotsLoader({
    required this.color,
    this.dotSize = 8.0,
    this.spacing = 4.0,
    this.jumpHeight = 16.0,
    super.key,
  });

  @override
  State<JumpingDotsLoader> createState() => _JumpingDotsLoaderState();
}

class _JumpingDotsLoaderState extends State<JumpingDotsLoader>
    with TickerProviderStateMixin {
  late List<AnimationController> _controllers;
  late List<Animation<double>> _positionAnimations;
  late List<Animation<double>> _scaleAnimations;

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
  }

  void _initializeAnimations() {
    _controllers = List.generate(
      3,
      (index) => AnimationController(
        duration: const Duration(milliseconds: 1400),
        vsync: this,
      )..repeat(),
    );

    // Animación de posición vertical más suave y notable
    _positionAnimations = List.generate(
      3,
      (index) => Tween<double>(begin: 0, end: -widget.jumpHeight).animate(
        CurvedAnimation(
          parent: _controllers[index],
          curve: Interval(
            index * 0.15,
            0.65 + (index * 0.15),
            curve: Curves.easeInOutCubic,
          ),
        ),
      ),
    );

    // Animación de escala para efecto de aplastamiento al caer
    _scaleAnimations = List.generate(
      3,
      (index) => Tween<double>(begin: 1.0, end: 1.2).animate(
        CurvedAnimation(
          parent: _controllers[index],
          curve: Interval(
            index * 0.15,
            0.35 + (index * 0.15),
            curve: Curves.easeOut,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    for (final controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        3,
        (index) => AnimatedBuilder(
          animation: Listenable.merge([
            _positionAnimations[index],
            _scaleAnimations[index],
          ]),
          builder: (context, child) {
            final positionValue = _positionAnimations[index].value;
            final scaleValue = _scaleAnimations[index].value;
            final opacityValue =
                0.7 + (0.3 * (1 - (scaleValue - 1).abs()));

            return Transform.translate(
              offset: Offset(0, positionValue),
              child: Transform.scale(
                scale: scaleValue,
                child: Container(
                  width: widget.dotSize,
                  height: widget.dotSize,
                  margin: EdgeInsets.symmetric(horizontal: widget.spacing),
                  decoration: BoxDecoration(
                    color: widget.color.withOpacity(opacityValue),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: widget.color.withOpacity(0.3),
                        blurRadius: 4,
                        offset: Offset(
                          0,
                          2 - positionValue.abs() * 0.15,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
