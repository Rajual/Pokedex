import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:desing_system/molecules/app_bottom_navigation_bar/models/app_bottom_navigation_item_ui_model.dart';
import 'package:desing_system/templates/home_template/home_template.dart';
import 'package:desing_system/templates/home_template/models/home_template_ui_model.dart';

import '../../../../core/common/result.dart';
import '../../domain/entities/home_entity.dart';
import '../../domain/repositories/home_repository.dart';
import '../../../listing/presentation/view/listing_screen.dart';
import '../../../favorites/presentation/view/favorites_screen.dart';
import '../presenter/home_presenter.dart';

/// Screen for displaying the home navigation wrapper
class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  Result<(HomeData, HomeConfig), HomeFailure>? _result;

  @override
  void initState() {
    super.initState();
    _loadHomeSetup();
  }

  Future<void> _loadHomeSetup() async {
    final presenter = ref.read(homePresenterProvider);
    final result = await presenter.loadHomeSetup();
    setState(() {
      _result = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_result == null) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return _result!.match(
      onSuccess: (setup) => _buildHomeTemplate(setup.$1, setup.$2),
      onFailure: (error) => _buildErrorContent(error),
    );
  }

  Widget _buildHomeTemplate(HomeData homeData, HomeConfig homeConfig) {
    // Convert domain navigation items to UI model
    final navigationItems = homeData.navigationItems.map((item) {
      return AppBottomNavigationItemUiModel(
        icon: _getIconData(item.iconName),
        label: item.label,
      );
    }).toList();

    // Create pages/widgets for each navigation item
    final pages = homeData.pageRoutes.map((route) {
      return _buildPageForRoute(route);
    }).toList();

    // Parse colors from hex strings
    final activeColor = homeConfig.activeColorHex != null
        ? Color(int.parse(homeConfig.activeColorHex!.replaceFirst('#', ''), radix: 16))
        : null;

    final inactiveColor = homeConfig.inactiveColorHex != null
        ? Color(int.parse(homeConfig.inactiveColorHex!.replaceFirst('#', ''), radix: 16))
        : null;

    final navigationBarBackgroundColor = homeConfig.navigationBarBackgroundColorHex != null
        ? Color(int.parse(homeConfig.navigationBarBackgroundColorHex!.replaceFirst('#', ''), radix: 16))
        : null;

    return HomeTemplate(
      uiModel: HomeTemplateUiModel(
        navigationItems: navigationItems,
        pages: pages,
        initialSelectedIndex: homeConfig.initialSelectedIndex,
        activeColor: activeColor,
        inactiveColor: inactiveColor,
        navigationBarBackgroundColor: navigationBarBackgroundColor,
        keepPagesAlive: homeConfig.keepPagesAlive,
        onPageChanged: (index) {
          debugPrint('Page changed to index: $index');
        },
      ),
    );
  }

  Widget _buildPageForRoute(String route) {
    // This is a simplified implementation
    // In a real app, you'd use proper routing/navigation
    switch (route) {
      case '/listing':
        return const ListingScreen();
      case '/favorites':
        return const FavoritesScreen();
      default:
        return const Center(child: Text('Unknown Route'));
    }
  }

  IconData _getIconData(String iconName) {
    switch (iconName.toLowerCase()) {
      case 'home':
        return Icons.home;
      case 'list':
      case 'listing':
        return Icons.list;
      case 'favorite':
      case 'favorites':
        return Icons.favorite;
      case 'details':
        return Icons.info;
      case 'search':
        return Icons.search;
      default:
        return Icons.circle;
    }
  }

  Widget _buildErrorContent(HomeFailure error) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Error: ${error.toString()}'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _loadHomeSetup,
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }
}