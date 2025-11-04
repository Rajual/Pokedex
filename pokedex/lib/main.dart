import 'package:desing_system/desing_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app/config/localizations.dart';
import 'app/routes/routes.dart';
import 'core/common/preferences.dart';
import 'features/onboarding/presentation/view/onboarding_screen.dart';

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
        // Add other delegates if needed
      ],
      supportedLocales: const [
        Locale('en', ''), // English
        Locale('es', ''), // Spanish
      ],
    );
  }
}

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({super.key});

  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokédex - Design System Demo'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Welcome message after onboarding
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.gray100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome to Pokédex!',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: AppColors.gray900,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'You have successfully completed the onboarding. Explore the design system components below.',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.gray700,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // AppButton Examples
            const Text(
              'AppButton Component',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                AppButton.fromProperties(
                  label: 'Primary',
                  onPressed: () {},
                ),
                AppButton.fromProperties(
                  label: 'Secondary',
                  type: ButtonType.secondary,
                  onPressed: () {},
                ),
                AppButton.fromProperties(
                  label: 'Tertiary',
                  type: ButtonType.tertiary,
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                AppButton.fromProperties(
                  label: 'Loading',
                  isLoading: true,
                  onPressed: () {},
                ),
                AppButton.fromProperties(
                  label: 'Disabled',
                  isEnabled: false,
                  onPressed: () {},
                ),
                AppButton.fromProperties(
                  label: 'With Icon',
                  leadingIcon: Icons.favorite,
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(height: 32),

            // Pokémon Gallery with AppImage
            const Text(
              'Pokémon Gallery',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'Small Size',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  AppImage.fromProperties(
                    'assets/ilustration/PokemonCharizard.png',
                    size: AppImageSize.small,
                    showShadow: true,
                  ),
                  const SizedBox(width: 8),
                  AppImage.fromProperties(
                    'assets/ilustration/PokemonPikachu.png',
                    size: AppImageSize.small,
                    showShadow: true,
                  ),
                  const SizedBox(width: 8),
                  AppImage.fromProperties(
                    'assets/ilustration/PokemonSquirtle.png',
                    size: AppImageSize.small,
                    showShadow: true,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Medium Size (Default)',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            GridView.count(
              crossAxisCount: 3,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              children: [
                AppImage.fromProperties(
                  'assets/ilustration/PokemonCharizard.png',
                  size: AppImageSize.medium,
                  showShadow: true,
                ),
                AppImage.fromProperties(
                  'assets/ilustration/PokemonPikachu.png',
                  size: AppImageSize.medium,
                  showShadow: true,
                ),
                AppImage.fromProperties(
                  'assets/ilustration/PokemonSquirtle.png',
                  size: AppImageSize.medium,
                  showShadow: true,
                ),
                AppImage.fromProperties(
                  'assets/ilustration/PokemonVenusaur.png',
                  size: AppImageSize.medium,
                  showShadow: true,
                ),
                AppImage.fromProperties(
                  'assets/ilustration/PokemonBlastoise.png',
                  size: AppImageSize.medium,
                  showShadow: true,
                ),
                AppImage.fromProperties(
                  'assets/ilustration/PokemonMew.png',
                  size: AppImageSize.medium,
                  showShadow: true,
                ),
              ],
            ),
            const SizedBox(height: 32),

            // Navigation Buttons
            const SizedBox(height: 32),
            const Text(
              'Features',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                AppButton.fromProperties(
                  label: 'View Pokémon List',
                  onPressed: () {
                    context.pushToListing();
                  },
                ),
                AppButton.fromProperties(
                  label: 'Reset Onboarding',
                  type: ButtonType.secondary,
                  onPressed: () async {
                    final prefs = await ref.read(preferencesServiceProvider.future);
                    await prefs.setOnboardingCompleted(false);
                    if (context.mounted) {
                      // Navigate back to onboarding
                      context.goToOnboarding();
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
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
                  // Restart the app or handle error
                  ref.invalidate(preferencesServiceProvider);
                },
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      ),
      data: (prefs) {
        // Check if onboarding has been completed
        final onboardingCompleted = prefs.isOnboardingCompleted;

        if (onboardingCompleted) {
          return const MyHomePage();
        } else {
          return const OnboardingScreen();
        }
      },
    );
  }
}

