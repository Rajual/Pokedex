import 'package:flutter/material.dart';
import '../../molecules/app_bottom_navigation_bar/app_bottom_navigation_bar.dart';
import '../../molecules/app_bottom_navigation_bar/models/app_bottom_navigation_bar_ui_model.dart';
import 'models/home_template_ui_model.dart';

/// Home Template - Wrapper para páginas con Bottom Navigation Bar
///
/// Este template sirve como contenedor principal de la aplicación,
/// proporcionando navegación mediante un bottom navigation bar.
/// Puede contener cualquier página/template como contenido.
///
/// Características:
/// - Bottom Navigation Bar integrado
/// - Cambio de contenido según tab seleccionado
/// - Opción de mantener estado de páginas (keepPagesAlive)
/// - Colores y estilos personalizables
///
/// Ejemplo de uso:
/// ```dart
/// HomeTemplate(
///   uiModel: HomeTemplateUiModel(
///     navigationItems: [
///       AppBottomNavigationItemUiModel(
///         icon: Icons.home,
///         label: 'Pokedex',
///       ),
///       AppBottomNavigationItemUiModel(
///         icon: Icons.favorite,
///         label: 'Favoritos',
///       ),
///     ],
///     pages: [
///       PokedexPage(),
///       FavoritesPage(),
///     ],
///     initialSelectedIndex: 0,
///     activeColor: Colors.blue,
///   ),
/// )
/// ```
class HomeTemplate extends StatefulWidget {
  final HomeTemplateUiModel uiModel;

  const HomeTemplate({
    super.key,
    required this.uiModel,
  });

  @override
  State<HomeTemplate> createState() => _HomeTemplateState();
}

class _HomeTemplateState extends State<HomeTemplate> {
  late int _selectedIndex;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.uiModel.initialSelectedIndex;
    _pageController = PageController(initialPage: _selectedIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onItemSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Animar a la página seleccionada
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );

    // Notificar al callback externo
    widget.uiModel.onPageChanged?.call(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.uiModel.keepPagesAlive
          ? _buildPageViewWithKeepAlive()
          : _buildSimplePageView(),
      bottomNavigationBar: AppBottomNavigationBar(
        uiModel: AppBottomNavigationBarUiModel(
          items: widget.uiModel.navigationItems,
          selectedIndex: _selectedIndex,
          activeColor: widget.uiModel.activeColor,
          inactiveColor: widget.uiModel.inactiveColor,
          backgroundColor: widget.uiModel.navigationBarBackgroundColor,
          elevation: widget.uiModel.navigationBarElevation,
          height: widget.uiModel.navigationBarHeight,
          onItemSelected: _onItemSelected,
        ),
      ),
    );
  }

  /// PageView con AutomaticKeepAliveClientMixin para mantener estado
  Widget _buildPageViewWithKeepAlive() {
    return PageView(
      controller: _pageController,
      onPageChanged: (index) {
        setState(() {
          _selectedIndex = index;
        });
        widget.uiModel.onPageChanged?.call(index);
      },
      children: widget.uiModel.pages
          .map((page) => _KeepAlivePage(child: page))
          .toList(),
    );
  }

  /// PageView simple sin mantener estado
  Widget _buildSimplePageView() {
    return PageView(
      controller: _pageController,
      onPageChanged: (index) {
        setState(() {
          _selectedIndex = index;
        });
        widget.uiModel.onPageChanged?.call(index);
      },
      children: widget.uiModel.pages,
    );
  }
}

/// Wrapper para mantener el estado de las páginas
class _KeepAlivePage extends StatefulWidget {
  final Widget child;

  const _KeepAlivePage({required this.child});

  @override
  State<_KeepAlivePage> createState() => _KeepAlivePageState();
}

class _KeepAlivePageState extends State<_KeepAlivePage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context); // Required for AutomaticKeepAliveClientMixin
    return widget.child;
  }
}
