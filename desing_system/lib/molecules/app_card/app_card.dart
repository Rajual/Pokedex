import 'package:flutter/material.dart';
import '../../atoms/app_favorite_tag/app_favorite_tag.dart';
import '../../atoms/app_favorite_tag/utils/favorite_tag_enums.dart';
import '../../atoms/app_image/app_image.dart';
import '../../atoms/app_image/models/app_image_ui_model.dart';
import '../app_type_tag/app_type_tag.dart';
import 'models/app_card_ui_model.dart';
import 'models/swipe_action_ui_model.dart';

/// Card component that displays a Pokemon with:
/// - Background with gradient or solid color
/// - Pokemon image
/// - Pokedex number
/// - Pokemon name
/// - Type tags (primary and secondary)
/// - Favorite button
/// - Optional swipe action (e.g., delete) - se activa automáticamente cuando swipeAction no es null
///
/// Example:
/// ```dart
/// AppCard(
///   uiModel: AppCardUiModel(
///     pokemonName: 'Bulbasaur',
///     pokemonNumber: 1,
///     primaryType: PokemonType.grass,
///     secondaryType: PokemonType.poison,
///     imagePath: 'assets/ilustration/PokemonBulbasaur.png',
///     backgroundColor: Color(0xFF78C850),
///     isFavorite: true,
///   ),
///   onFavoriteChanged: (value) {
///     setState(() => isFavorite = value);
///   },
///   onTap: () => print('Card tapped'),
///   swipeAction: SwipeActionUiModel.delete(
///     onAction: () => print('Delete action'),
///   ),
/// )
/// ```
class AppCard extends StatefulWidget {
  final AppCardUiModel uiModel;

  /// Callback quando o favorito muda
  final Function(bool) onFavoriteChanged;

  /// Callback ao tocar no card
  final VoidCallback? onTap;

  /// Acción al deslizar (opcional) - cuando es null, no hay funcionalidad de swipe
  final SwipeActionUiModel? swipeAction;

  /// Duración de la animación de swipe
  final Duration swipeAnimationDuration;

  const AppCard({
    required this.uiModel,
    required this.onFavoriteChanged,
    this.onTap,
    this.swipeAction,
    this.swipeAnimationDuration = const Duration(milliseconds: 300),
    super.key,
  });

  @override
  State<AppCard> createState() => _AppCardState();

  /// Factory constructor for backward compatibility
  factory AppCard.fromProperties({
    required String pokemonName,
    required int pokemonNumber,
    required PokemonType primaryType,
    required String imagePath,
    required Color backgroundColor,
    required bool isFavorite,
    required Function(bool) onFavoriteChanged,
    PokemonType? secondaryType,
    CardSize size = CardSize.medium,
    CardStyle style = CardStyle.elevated,
    CardElevation elevation = CardElevation.medium,
    VoidCallback? onTap,
    SwipeActionUiModel? swipeAction,
    Duration swipeAnimationDuration = const Duration(milliseconds: 300),
    bool isEnabled = true,
    bool showPokemonNumber = true,
    Key? key,
  }) {
    return AppCard(
      uiModel: AppCardUiModel(
        pokemonName: pokemonName,
        pokemonNumber: pokemonNumber,
        primaryType: primaryType,
        secondaryType: secondaryType,
        imagePath: imagePath,
        backgroundColor: backgroundColor,
        isFavorite: isFavorite,
        size: size,
        style: style,
        elevation: elevation,
        isEnabled: isEnabled,
        showPokemonNumber: showPokemonNumber,
      ),
      onFavoriteChanged: onFavoriteChanged,
      onTap: onTap,
      swipeAction: swipeAction,
      swipeAnimationDuration: swipeAnimationDuration,
      key: key,
    );
  }
}

class _AppCardState extends State<AppCard> with SingleTickerProviderStateMixin {
  // Swipe animation controller
  AnimationController? _swipeController;
  Animation<Offset>? _slideAnimation;
  
  double _dragExtent = 0;
  bool _isDragging = false;

  @override
  void initState() {
    super.initState();
    // Solo inicializar animación si hay swipeAction
    if (widget.swipeAction != null) {
      _swipeController = AnimationController(
        vsync: this,
        duration: widget.swipeAnimationDuration,
      );
      _slideAnimation = Tween<Offset>(
        begin: Offset.zero,
        end: const Offset(-1.0, 0),
      ).animate(CurvedAnimation(
        parent: _swipeController!,
        curve: Curves.easeOut,
      ));
    }
  }

  @override
  void dispose() {
    _swipeController?.dispose();
    super.dispose();
  }

  void _handleDragStart(DragStartDetails details) {
    if (!widget.uiModel.isEnabled || widget.swipeAction == null) return;
    
    setState(() {
      _isDragging = true;
    });
  }

  void _handleDragUpdate(DragUpdateDetails details) {
    if (!widget.uiModel.isEnabled || widget.swipeAction == null || !_isDragging) return;

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
      
      _swipeController!.value = (_dragExtent.abs() / cardWidth).clamp(0.0, 1.0);
    });
  }

  void _handleDragEnd(DragEndDetails details) {
    if (!widget.uiModel.isEnabled || widget.swipeAction == null || !_isDragging) return;

    final cardWidth = context.size?.width ?? 0;
    if (cardWidth == 0) return;

    final threshold = widget.swipeAction!.threshold;
    final velocity = details.primaryVelocity ?? 0;
    
    setState(() {
      _isDragging = false;
      
      // Si superó el threshold o tiene velocidad suficiente, completar la acción
      if ((_dragExtent.abs() / cardWidth) >= threshold || velocity < -300) {
        _swipeController!.forward().then((_) {
          widget.swipeAction?.onAction?.call();
          // Resetear después de la acción
          Future.delayed(const Duration(milliseconds: 300), () {
            if (mounted) {
              _swipeController!.reverse().then((_) {
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
        _swipeController!.reverse().then((_) {
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
    final cardHeight = widget.uiModel.size.height;
    final padding = widget.uiModel.size.padding;
    final borderRadius = widget.uiModel.size.borderRadius;

    // Format Pokemon number
    final pokemonNumberStr = widget.uiModel.pokemonNumber.toString().padLeft(4, '0');

    // Build the card content
    Widget cardContent = Container(
      width: double.infinity, // Ocupar todo el ancho disponible
      height: cardHeight,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: widget.uiModel.backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
        border: widget.uiModel.style == CardStyle.outlined
            ? Border.all(color: widget.uiModel.backgroundColor.withOpacity(0.5), width: 2)
            : null,
      ),
      child: Padding(
        padding: EdgeInsets.all(padding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top row: Number and Favorite button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Pokemon number
                if (widget.uiModel.showPokemonNumber)
                  Expanded(
                    child: Text(
                      'Nº$pokemonNumberStr',
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: Colors.white70,
                            fontWeight: FontWeight.w500,
                            fontSize: 10,
                          ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                // Favorite button
                SizedBox(
                  width: 32,
                  height: 32,
                  child: AppFavoriteTag.fromProperties(
                    isFavorite: widget.uiModel.isFavorite,
                    onFavoriteChanged: widget.onFavoriteChanged,
                    size: FavoriteTagSize.small,
                    style: FavoriteTagStyle.outlined,
                    activeColor: Colors.white,
                    inactiveColor: Colors.white70,
                    enableAnimation: true,
                    isEnabled: widget.uiModel.isEnabled,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            // Pokemon image
            Expanded(
              flex: 2,
              child: Center(
                child: AppImage(
                  uiModel: AppImageUiModel(
                    assetPath: widget.uiModel.imagePath,
                    size: AppImageSize.medium,
                    fit: AppImageFit.contain,
                    showShadow: false,
                    backgroundColor: Colors.transparent,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 4),
            // Bottom section: Name and Types
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Pokemon name
                  Text(
                    widget.uiModel.pokemonName,
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: padding / 4),
                  // Type tags
                  Flexible(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Wrap(
                        spacing: 4,
                        runSpacing: 2,
                        children: [
                          AppTypeTag(
                            type: widget.uiModel.primaryType,
                            size: TypeTagSize.small,
                          ),
                          if (widget.uiModel.secondaryType != null)
                            AppTypeTag(
                              type: widget.uiModel.secondaryType!,
                              size: TypeTagSize.small,
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

    // Apply elevation styling
    if (widget.uiModel.style == CardStyle.elevated) {
      cardContent = Material(
        elevation: widget.uiModel.elevation.value,
        borderRadius: BorderRadius.circular(borderRadius),
        child: cardContent,
      );
    }

    // Wrap with GestureDetector if onTap is provided
    if (widget.onTap != null && widget.uiModel.isEnabled) {
      cardContent = GestureDetector(
        onTap: widget.onTap,
        child: cardContent,
      );
    }

    // Wrap with swipe functionality if swipeAction is provided
    if (widget.swipeAction != null && _swipeController != null) {
      cardContent = GestureDetector(
        onHorizontalDragStart: _handleDragStart,
        onHorizontalDragUpdate: _handleDragUpdate,
        onHorizontalDragEnd: _handleDragEnd,
        child: Stack(
          children: [
            // Background con la acción - solo visible cuando está deslizando
            if (_isDragging || _swipeController!.value > 0)
              Positioned.fill(
                child: AnimatedOpacity(
                  opacity: _swipeController!.value,
                  duration: const Duration(milliseconds: 150),
                  child: Container(
                    decoration: BoxDecoration(
                      color: widget.swipeAction!.backgroundColor,
                      borderRadius: BorderRadius.circular(borderRadius),
                    ),
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
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
              position: _slideAnimation!,
              child: cardContent,
            ),
          ],
        ),
      );
    }

    return cardContent;
  }
}
