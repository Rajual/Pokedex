import 'package:flutter/material.dart';
import '../../features/onboarding/presentation/view/onboarding_screen.dart';
import '../../features/listing/presentation/view/listing_screen.dart';
import '../../main.dart';

/// Route names constants
class RouteNames {
  static const String home = '/home';
  static const String onboarding = '/onboarding';
  static const String listing = '/listing';
}

/// Route generator for the app
class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.home:
        return MaterialPageRoute(
          builder: (_) => const MyHomePage(),
          settings: settings,
        );

      case RouteNames.onboarding:
        return MaterialPageRoute(
          builder: (_) => const OnboardingScreen(),
          settings: settings,
        );

      case RouteNames.listing:
        return MaterialPageRoute(
          builder: (_) => const ListingScreen(),
          settings: settings,
        );

      default:
        // Fallback to home if route not found
        return MaterialPageRoute(
          builder: (_) => const MyHomePage(),
          settings: settings,
        );
    }
  }

  /// Get all routes map for MaterialApp.routes
  static Map<String, WidgetBuilder> getRoutes() {
    return {
      RouteNames.home: (context) => const MyHomePage(),
      RouteNames.onboarding: (context) => const OnboardingScreen(),
      RouteNames.listing: (context) => const ListingScreen(),
    };
  }
}

/// Extension for easy navigation
extension NavigatorExtension on BuildContext {
  /// Navigate to home screen
  void goToHome() {
    Navigator.of(this).pushReplacementNamed(RouteNames.home);
  }

  /// Navigate to onboarding screen
  void goToOnboarding() {
    Navigator.of(this).pushReplacementNamed(RouteNames.onboarding);
  }

  /// Push to home screen
  void pushToHome() {
    Navigator.of(this).pushNamed(RouteNames.home);
  }

  /// Push to onboarding screen
  void pushToOnboarding() {
    Navigator.of(this).pushNamed(RouteNames.onboarding);
  }

  /// Navigate to listing screen
  void goToListing() {
    Navigator.of(this).pushReplacementNamed(RouteNames.listing);
  }

  /// Push to listing screen
  void pushToListing() {
    Navigator.of(this).pushNamed(RouteNames.listing);
  }
}