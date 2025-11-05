import 'package:desing_system/desing_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app/config/localizations.dart';
import 'app/routes/routes.dart';
import 'core/common/preferences.dart';
import 'features/onboarding/presentation/view/onboarding_screen.dart';
import 'features/home/presentation/view/home_screen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Pokédex',
      theme: AppTheme.lightTheme,
      home: const AppEntryPoint(),
      routes: AppRouter.getRoutes(),
      onGenerateRoute: AppRouter.generateRoute,
      localizationsDelegates: const [
        MyAppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''),
        Locale('es', ''),
      ],
      localeResolutionCallback: (deviceLocale, supportedLocales) {
        // Detectar el idioma del dispositivo
        if (deviceLocale != null) {
          for (var supportedLocale in supportedLocales) {
            if (supportedLocale.languageCode == deviceLocale.languageCode) {
              // Si el idioma del dispositivo está soportado, úsalo
              return supportedLocale;
            }
          }
        }
        // Si no se encuentra, usar inglés por defecto
        return const Locale('en', '');
      },
    );
  }
}

class AppEntryPoint extends ConsumerWidget {
  const AppEntryPoint({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final prefsAsync = ref.watch(preferencesServiceProvider);

    return prefsAsync.when(
      loading: () => const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
      error: (error, stack) => Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Error loading app: $error'),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  ref.invalidate(preferencesServiceProvider);
                },
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      ),
      data: (prefs) {
        final onboardingCompleted = prefs.isOnboardingCompleted;

        if (onboardingCompleted) {
          return const HomeScreen();
        } else {
          return const OnboardingScreen();
        }
      },
    );
  }
}

