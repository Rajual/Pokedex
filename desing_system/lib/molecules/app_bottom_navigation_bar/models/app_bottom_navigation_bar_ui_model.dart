import 'package:flutter/material.dart';
import 'app_bottom_navigation_item_ui_model.dart';

/// UI Model para el bottom navigation bar
class AppBottomNavigationBarUiModel {
  /// Lista de items del navigation bar
  final List<AppBottomNavigationItemUiModel> items;

  /// Índice del item seleccionado
  final int selectedIndex;

  /// Color de los items activos
  final Color? activeColor;

  /// Color de los items inactivos
  final Color? inactiveColor;

  /// Color de fondo del navigation bar
  final Color? backgroundColor;

  /// Elevación del navigation bar
  final double elevation;

  /// Altura del navigation bar
  final double height;

  /// Callback cuando cambia la selección
  final ValueChanged<int>? onItemSelected;

  const AppBottomNavigationBarUiModel({
    required this.items,
    this.selectedIndex = 0,
    this.activeColor,
    this.inactiveColor,
    this.backgroundColor,
    this.elevation = 8.0,
    this.height = 60.0,
    this.onItemSelected,
  }) : assert(items.length >= 2, 'BottomNavigationBar debe tener al menos 2 items'),
       assert(items.length <= 5, 'BottomNavigationBar debe tener máximo 5 items'),
       assert(selectedIndex >= 0 && selectedIndex < items.length, 
              'selectedIndex debe estar entre 0 y items.length - 1');

  AppBottomNavigationBarUiModel copyWith({
    List<AppBottomNavigationItemUiModel>? items,
    int? selectedIndex,
    Color? activeColor,
    Color? inactiveColor,
    Color? backgroundColor,
    double? elevation,
    double? height,
    ValueChanged<int>? onItemSelected,
  }) {
    return AppBottomNavigationBarUiModel(
      items: items ?? this.items,
      selectedIndex: selectedIndex ?? this.selectedIndex,
      activeColor: activeColor ?? this.activeColor,
      inactiveColor: inactiveColor ?? this.inactiveColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      elevation: elevation ?? this.elevation,
      height: height ?? this.height,
      onItemSelected: onItemSelected ?? this.onItemSelected,
    );
  }
}
