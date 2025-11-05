import 'dart:convert';
import 'package:flutter/services.dart';
import '../../../../core/common/result.dart';
import '../../domain/entities/home_entity.dart';
import '../../domain/repositories/home_repository.dart';

/// Implementation of HomeRepository
class HomeRepositoryImpl implements HomeRepository {
  @override
  Future<Result<HomeData, HomeFailure>> loadHomeData() async {
    try {
      // Load localization data
      final localeData = await _loadLocaleData();

      // Get navigation items
      final navigationData = localeData['navigation'] as List<dynamic>? ?? [];
      final navigationItems = navigationData.map((item) {
        return HomeNavigationItem(
          iconName: item['iconName'] ?? 'home',
          label: item['label'] ?? 'Home',
          routeName: item['routeName'] ?? '/home',
        );
      }).toList();

      // Get page routes
      final pageRoutes = navigationData
          .map((item) => item['routeName'] as String? ?? '/home')
          .toList();

      // Create home data
      final homeData = HomeData(
        title: localeData['title'] ?? 'Pokemon App',
        welcomeMessage: localeData['welcomeMessage'] ?? 'Welcome to Pokemon World',
        navigationItems: navigationItems,
        pageRoutes: pageRoutes,
      );

      return Result.success(homeData);
    } catch (e) {
      if (e is FormatException) {
        return Result.failure(HomeFailure.parsingError(e.message));
      } else if (e is PlatformException) {
        return Result.failure(HomeFailure.assetNotFound(e.message ?? 'Asset not found'));
      } else {
        return Result.failure(HomeFailure.localizationError(e.toString()));
      }
    }
  }

  @override
  Future<Result<HomeConfig, HomeFailure>> loadHomeConfig() async {
    try {
      // Load localization data
      final localeData = await _loadLocaleData();

      // Get configuration
      final configData = localeData['config'] ?? {};

      final homeConfig = HomeConfig(
        initialSelectedIndex: configData['initialSelectedIndex'] ?? 0,
        keepPagesAlive: configData['keepPagesAlive'] ?? true,
        activeColorHex: configData['activeColorHex'],
        inactiveColorHex: configData['inactiveColorHex'],
        navigationBarBackgroundColorHex: configData['navigationBarBackgroundColorHex'],
      );

      return Result.success(homeConfig);
    } catch (e) {
      if (e is FormatException) {
        return Result.failure(HomeFailure.parsingError(e.message));
      } else if (e is PlatformException) {
        return Result.failure(HomeFailure.assetNotFound(e.message ?? 'Asset not found'));
      } else {
        return Result.failure(HomeFailure.localizationError(e.toString()));
      }
    }
  }

  Future<Map<String, dynamic>> _loadLocaleData() async {
    // Get current locale (simplified - in real app you'd use localization service)
    // For now, we'll assume English as default
    const locale = 'en';

    final assetPath = 'assets/locals/$locale/home.json';
    final jsonString = await rootBundle.loadString(assetPath);
    return json.decode(jsonString) as Map<String, dynamic>;
  }
}