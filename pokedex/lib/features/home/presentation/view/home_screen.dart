import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:desing_system/molecules/app_bottom_navigation_bar/models/app_bottom_navigation_item_ui_model.dart';
import 'package:desing_system/templates/home_template/home_template.dart';
import 'package:desing_system/templates/home_template/models/home_template_ui_model.dart';
import 'package:desing_system/templates/empty_state_template/empty_state_template.dart';
import 'package:desing_system/templates/empty_state_template/models/empty_state_template_ui_model.dart';

import '../../../../core/common/result.dart';
import '../../../../core/common/preferences.dart';
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
  static bool _hasShownDialogThisSession = false;

  @override
  void initState() {
    super.initState();
    _loadHomeSetup();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Show onboarding prompt dialog after first build, only once per session
    if (!_hasShownDialogThisSession && _result != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _showOnboardingPromptIfNeeded();
      });
    }
  }

  Future<void> _showOnboardingPromptIfNeeded() async {
    // Mark as shown for this session
    if (_hasShownDialogThisSession) return;
    _hasShownDialogThisSession = true;
    
    final prefsAsync = ref.read(preferencesServiceProvider);
    
    prefsAsync.when(
      data: (prefs) {
        // Only show if onboarding was completed (meaning user has seen it before)
        if (prefs.isOnboardingCompleted && mounted) {
          _showOnboardingDialog();
        }
      },
      loading: () {},
      error: (_, __) {},
    );
  }

  void _showOnboardingDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('¿Quieres ver el tutorial?'),
        content: const Text(
          '¿Te gustaría volver a ver el tutorial de introducción a la aplicación?',
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('No, gracias'),
          ),
          ElevatedButton(
            onPressed: () async {
              Navigator.of(context).pop();
              // Reset onboarding and navigate to it
              final prefsAsync = ref.read(preferencesServiceProvider);
              
              prefsAsync.when(
                data: (prefs) async {
                  await prefs.setOnboardingCompleted(false);
                  
                  if (mounted) {
                    // Navigate to onboarding screen
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      '/',
                      (route) => false,
                    );
                  }
                },
                loading: () {},
                error: (_, __) {},
              );
            },
            child: const Text('Sí, mostrar'),
          ),
        ],
      ),
    );
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
        ? _parseColor(homeConfig.activeColorHex!)
        : null;

    final inactiveColor = homeConfig.inactiveColorHex != null
        ? _parseColor(homeConfig.inactiveColorHex!)
        : null;

    final navigationBarBackgroundColor = homeConfig.navigationBarBackgroundColorHex != null
        ? _parseColor(homeConfig.navigationBarBackgroundColorHex!)
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
      ),
    );
  }

  Widget _buildPageForRoute(String route) {
    switch (route) {
      case '/listing':
        return const ListingScreen();
      case '/favorites':
        return const FavoritesScreen();
      case '/regions':
      case '/profile':
        return _buildComingSoonPage();
      default:
        return Center(
          child: Text('Unknown route: $route'),
        );
    }
  }

  Widget _buildComingSoonPage() {
    return EmptyStateTemplate(
      uiModel: EmptyStateTemplateUiModel(
        title: 'Coming Soon',
        description: 'This feature will be available in a future update',
        imagePath: 'assets/ilustration/PokemonMew.png',
      ),
    );
  }

  Color _parseColor(String hexColor) {
    final hex = hexColor.replaceFirst('#', '');
    return Color(int.parse('FF$hex', radix: 16));
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
      case 'map':
        return Icons.map;
      case 'person':
      case 'profile':
        return Icons.person;
      case 'search':
        return Icons.search;
      default:
        return Icons.help_outline;
    }
  }

  Widget _buildErrorContent(HomeFailure error) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 64, color: Colors.red),
            const SizedBox(height: 16),
            Text('Error loading home: ${error.toString()}'),
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