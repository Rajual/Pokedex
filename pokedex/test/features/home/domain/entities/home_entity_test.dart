import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../../../../lib/features/home/domain/entities/home_entity.dart';

void main() {
  group('HomeEntity', () {
    test('HomeData should create with required parameters', () {
      final navigationItems = [
        HomeNavigationItem(
          iconName: 'home',
          label: 'Home',
          routeName: '/home',
        ),
      ];

      final homeData = HomeData(
        title: 'Test App',
        welcomeMessage: 'Welcome!',
        navigationItems: navigationItems,
        pageRoutes: ['/home'],
      );

      expect(homeData.title, 'Test App');
      expect(homeData.welcomeMessage, 'Welcome!');
      expect(homeData.navigationItems.length, 1);
      expect(homeData.pageRoutes.length, 1);
    });

    test('HomeData copyWith should work correctly', () {
      final original = HomeData(
        title: 'Original',
        welcomeMessage: 'Welcome',
        navigationItems: [],
        pageRoutes: [],
      );

      final copied = original.copyWith(title: 'Copied');

      expect(copied.title, 'Copied');
      expect(copied.welcomeMessage, 'Welcome');
    });

    test('HomeNavigationItem should create with required parameters', () {
      final item = HomeNavigationItem(
        iconName: 'home',
        label: 'Home',
        routeName: '/home',
      );

      expect(item.iconName, 'home');
      expect(item.label, 'Home');
      expect(item.routeName, '/home');
    });

    test('HomeNavigationItem copyWith should work correctly', () {
      final original = HomeNavigationItem(
        iconName: 'home',
        label: 'Home',
        routeName: '/home',
      );

      final copied = original.copyWith(label: 'New Home');

      expect(copied.label, 'New Home');
      expect(copied.iconName, 'home');
    });

    test('HomeConfig should create with default values', () {
      final config = HomeConfig();

      expect(config.initialSelectedIndex, 0);
      expect(config.keepPagesAlive, true);
      expect(config.activeColorHex, null);
      expect(config.inactiveColorHex, null);
      expect(config.navigationBarBackgroundColorHex, null);
    });

    test('HomeConfig copyWith should work correctly', () {
      final original = HomeConfig(
        initialSelectedIndex: 0,
        keepPagesAlive: true,
      );

      final copied = original.copyWith(
        initialSelectedIndex: 1,
        keepPagesAlive: false,
      );

      expect(copied.initialSelectedIndex, 1);
      expect(copied.keepPagesAlive, false);
    });
  });
}