import 'package:flutter/material.dart';

/// UI Model para un item del bottom navigation bar
class AppBottomNavigationItemUiModel {
  /// Ícono del item
  final IconData icon;

  /// Label del item
  final String label;

  /// Si el item está seleccionado
  final bool isSelected;

  /// Callback al presionar el item
  final VoidCallback? onTap;

  const AppBottomNavigationItemUiModel({
    required this.icon,
    required this.label,
    this.isSelected = false,
    this.onTap,
  });

  AppBottomNavigationItemUiModel copyWith({
    IconData? icon,
    String? label,
    bool? isSelected,
    VoidCallback? onTap,
  }) {
    return AppBottomNavigationItemUiModel(
      icon: icon ?? this.icon,
      label: label ?? this.label,
      isSelected: isSelected ?? this.isSelected,
      onTap: onTap ?? this.onTap,
    );
  }
}
