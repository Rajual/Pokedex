import 'package:flutter/material.dart';
import '../../../molecules/app_bottom_navigation_bar/models/app_bottom_navigation_item_ui_model.dart';

/// UI Model para HomeTemplate
///
/// Este modelo configura un template de página principal con bottom navigation bar
/// que puede mostrar diferentes contenidos según el tab seleccionado.
class HomeTemplateUiModel {
  /// Lista de items para el bottom navigation bar
  final List<AppBottomNavigationItemUiModel> navigationItems;

  /// Lista de widgets/páginas que se mostrarán según el tab seleccionado
  /// Debe tener el mismo tamaño que navigationItems
  final List<Widget> pages;

  /// Índice inicial seleccionado
  final int initialSelectedIndex;

  /// Color de los items activos en el navigation bar
  final Color? activeColor;

  /// Color de los items inactivos en el navigation bar
  final Color? inactiveColor;

  /// Color de fondo del navigation bar
  final Color? navigationBarBackgroundColor;

  /// Elevación del navigation bar
  final double navigationBarElevation;

  /// Altura del navigation bar
  final double navigationBarHeight;

  /// Si se debe mantener el estado de las páginas al cambiar de tab
  final bool keepPagesAlive;

  /// Callback cuando cambia el tab seleccionado
  final ValueChanged<int>? onPageChanged;

  const HomeTemplateUiModel({
    required this.navigationItems,
    required this.pages,
    this.initialSelectedIndex = 0,
    this.activeColor,
    this.inactiveColor,
    this.navigationBarBackgroundColor,
    this.navigationBarElevation = 8.0,
    this.navigationBarHeight = 60.0,
    this.keepPagesAlive = true,
    this.onPageChanged,
  })  : assert(navigationItems.length >= 2, 'Debe haber al menos 2 items de navegación'),
        assert(navigationItems.length <= 5, 'Debe haber máximo 5 items de navegación'),
        assert(navigationItems.length == pages.length,
            'La cantidad de navigationItems debe ser igual a la cantidad de pages'),
        assert(initialSelectedIndex >= 0 && initialSelectedIndex < navigationItems.length,
            'initialSelectedIndex debe estar entre 0 y navigationItems.length - 1');

  HomeTemplateUiModel copyWith({
    List<AppBottomNavigationItemUiModel>? navigationItems,
    List<Widget>? pages,
    int? initialSelectedIndex,
    Color? activeColor,
    Color? inactiveColor,
    Color? navigationBarBackgroundColor,
    double? navigationBarElevation,
    double? navigationBarHeight,
    bool? keepPagesAlive,
    ValueChanged<int>? onPageChanged,
  }) {
    return HomeTemplateUiModel(
      navigationItems: navigationItems ?? this.navigationItems,
      pages: pages ?? this.pages,
      initialSelectedIndex: initialSelectedIndex ?? this.initialSelectedIndex,
      activeColor: activeColor ?? this.activeColor,
      inactiveColor: inactiveColor ?? this.inactiveColor,
      navigationBarBackgroundColor: navigationBarBackgroundColor ?? this.navigationBarBackgroundColor,
      navigationBarElevation: navigationBarElevation ?? this.navigationBarElevation,
      navigationBarHeight: navigationBarHeight ?? this.navigationBarHeight,
      keepPagesAlive: keepPagesAlive ?? this.keepPagesAlive,
      onPageChanged: onPageChanged ?? this.onPageChanged,
    );
  }
}
