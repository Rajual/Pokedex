import 'package:flutter/material.dart';
import 'models/app_bottom_navigation_bar_ui_model.dart';
import 'models/app_bottom_navigation_item_ui_model.dart';

/// Bottom Navigation Bar component
///
/// Componente que muestra una barra de navegación inferior con íconos y labels.
/// Soporta de 2 a 5 items y maneja el estado activo/inactivo.
///
/// Ejemplo de uso:
/// ```dart
/// AppBottomNavigationBar(
///   uiModel: AppBottomNavigationBarUiModel(
///     items: [
///       AppBottomNavigationItemUiModel(
///         icon: Icons.home,
///         label: 'Pokedex',
///       ),
///       AppBottomNavigationItemUiModel(
///         icon: Icons.public,
///         label: 'Regiones',
///       ),
///       AppBottomNavigationItemUiModel(
///         icon: Icons.favorite,
///         label: 'Favoritos',
///       ),
///       AppBottomNavigationItemUiModel(
///         icon: Icons.person,
///         label: 'Perfil',
///       ),
///     ],
///     selectedIndex: 2,
///     activeColor: Colors.blue,
///     inactiveColor: Colors.grey,
///     onItemSelected: (index) => print('Selected: $index'),
///   ),
/// )
/// ```
class AppBottomNavigationBar extends StatelessWidget {
  final AppBottomNavigationBarUiModel uiModel;

  const AppBottomNavigationBar({
    super.key,
    required this.uiModel,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final activeColor = uiModel.activeColor ?? theme.primaryColor;
    final inactiveColor = uiModel.inactiveColor ?? Colors.grey;
    final backgroundColor = uiModel.backgroundColor ?? Colors.white;

    return Container(
      height: uiModel.height,
      decoration: BoxDecoration(
        color: backgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: uiModel.elevation,
            offset: Offset(0, -uiModel.elevation / 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(
          uiModel.items.length,
          (index) => _buildNavigationItem(
            item: uiModel.items[index],
            index: index,
            isSelected: index == uiModel.selectedIndex,
            activeColor: activeColor,
            inactiveColor: inactiveColor,
          ),
        ),
      ),
    );
  }

  Widget _buildNavigationItem({
    required AppBottomNavigationItemUiModel item,
    required int index,
    required bool isSelected,
    required Color activeColor,
    required Color inactiveColor,
  }) {
    final color = isSelected ? activeColor : inactiveColor;

    return Expanded(
      child: InkWell(
        onTap: () {
          item.onTap?.call();
          uiModel.onItemSelected?.call(index);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              item.icon,
              color: color,
              size: 28,
            ),
            const SizedBox(height: 4),
            Text(
              item.label,
              style: TextStyle(
                color: color,
                fontSize: 12,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
