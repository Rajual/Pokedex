import 'package:flutter/material.dart';
import '../../features/onboarding/presentation/view/onboarding_screen.dart';
import '../../features/listing/presentation/view/listing_screen.dart';
import '../../features/error/presentation/view/error_screen.dart';
import '../../features/error/domain/entities/error_entity.dart';
import '../../features/details/presentation/view/pokemon_detail_screen.dart';
import '../../features/favorites/presentation/view/favorites_screen.dart';
import '../../features/home/presentation/view/home_screen.dart';
import '../../main.dart';

/// Route names constants
class RouteNames {
  static const String home = '/home';
  static const String onboarding = '/onboarding';
  static const String listing = '/listing';
  static const String error = '/error';
  static const String details = '/details';
  static const String favorites = '/favorites';
  static const String homeNavigation = '/home-navigation';
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

      case RouteNames.homeNavigation:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
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

      case RouteNames.error:
        final args = settings.arguments as Map<String, dynamic>?;
        final errorTypeString = args?['errorType'] as String? ?? 'unknown';
        final originalError = args?['originalError'];

        // Convert string to ErrorType enum
        final errorType = ErrorType.values.firstWhere(
          (e) => e.name == errorTypeString,
          orElse: () => ErrorType.unknown,
        );

        return MaterialPageRoute(
          builder: (_) => ErrorScreen(
            errorType: errorType,
            originalError: originalError,
          ),
          settings: settings,
        );

      case RouteNames.details:
        final args = settings.arguments as Map<String, dynamic>?;
        final pokemonId = args?['pokemonId'] as String? ?? '1';

        return MaterialPageRoute(
          builder: (_) => PokemonDetailScreen(pokemonId: pokemonId),
          settings: settings,
        );

      case RouteNames.favorites:
        return MaterialPageRoute(
          builder: (_) => const FavoritesScreen(),
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
      RouteNames.homeNavigation: (context) => const HomeScreen(),
      RouteNames.onboarding: (context) => const OnboardingScreen(),
      RouteNames.listing: (context) => const ListingScreen(),
      RouteNames.favorites: (context) => const FavoritesScreen(),
      // Error route requires arguments, so it's handled in generateRoute
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

  /// Push to home navigation screen
  void pushToHomeNavigation() {
    Navigator.of(this).pushNamed(RouteNames.homeNavigation);
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

  /// Navigate to error screen with specific error type
  void goToError(ErrorType errorType, {dynamic originalError}) {
    Navigator.of(this).pushNamed(RouteNames.error, arguments: {
      'errorType': errorType.name,
      'originalError': originalError,
    });
  }

  /// Push to error screen with specific error type
  void pushToError(ErrorType errorType, {dynamic originalError}) {
    Navigator.of(this).pushNamed(RouteNames.error, arguments: {
      'errorType': errorType.name,
      'originalError': originalError,
    });
  }

  /// Navigate to details screen with specific Pokemon ID
  void goToDetails(String pokemonId) {
    Navigator.of(this).pushNamed(RouteNames.details, arguments: {
      'pokemonId': pokemonId,
    });
  }

  /// Push to details screen with specific Pokemon ID
  void pushToDetails(String pokemonId) {
    Navigator.of(this).pushNamed(RouteNames.details, arguments: {
      'pokemonId': pokemonId,
    });
  }

  /// Navigate to favorites screen
  void goToFavorites() {
    Navigator.of(this).pushReplacementNamed(RouteNames.favorites);
  }

  /// Push to favorites screen
  void pushToFavorites() {
    Navigator.of(this).pushNamed(RouteNames.favorites);
  }
}