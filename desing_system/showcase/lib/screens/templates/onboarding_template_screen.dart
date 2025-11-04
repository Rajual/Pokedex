import 'package:flutter/material.dart';
import 'package:desing_system/desing_system.dart';

/// Pantalla de demostración del OnboardingTemplate
class OnboardingTemplateScreen extends StatelessWidget {
  const OnboardingTemplateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Onboarding Template'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildSection(
            context,
            title: 'Ejemplo 1: Pokemon Welcome',
            description: 'Onboarding con tema Pokemon, 2 páginas',
            onPressed: () => _showOnboarding1(context),
          ),
          const SizedBox(height: 16),
          _buildSection(
            context,
            title: 'Ejemplo 2: Features Showcase',
            description: '3 páginas con diferentes features',
            onPressed: () => _showOnboarding2(context),
          ),
          const SizedBox(height: 16),
          _buildSection(
            context,
            title: 'Ejemplo 3: Variant Bars',
            description: 'Con DotIndicator tipo barras',
            onPressed: () => _showOnboarding3(context),
          ),
          const SizedBox(height: 16),
          _buildSection(
            context,
            title: 'Ejemplo 4: Sin botón Skip',
            description: 'Onboarding sin opción de saltar',
            onPressed: () => _showOnboarding4(context),
          ),
        ],
      ),
    );
  }

  Widget _buildSection(
    BuildContext context, {
    required String title,
    required String description,
    required VoidCallback onPressed,
  }) {
    return Card(
      elevation: 2,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      description,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: AppColors.gray600,
                          ),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.arrow_forward_ios, size: 20),
            ],
          ),
        ),
      ),
    );
  }

  // Ejemplo 1: Onboarding basado en las imágenes proporcionadas
  void _showOnboarding1(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => OnboardingTemplate.fromProperties(
          pages: const [
            OnboardingPageModel(
              imagePath: 'assets/ilustration/PokemonCharizard.png',
              title: 'Todos los Pokémon en\nun solo lugar',
              description:
                  'Accede a una amplia lista de Pokémon de todas las generaciones conoce por primera vez.',
            ),
            OnboardingPageModel(
              imagePath: 'assets/ilustration/PokemonCharizard.png',
              title: 'Mantén tu Pokédex\nactualizada',
              description:
                  'Registra y guarda tu perfil, Pokémon favoritos, configuraciones y mucho más en tu aplicación.',
            ),
          ],
          onFinish: () {
            Navigator.of(context).pop();
            _showCompletionDialog(context, 'Onboarding 1 completado!');
          },
        ),
      ),
    );
  }

  // Ejemplo 2: Tres páginas con features
  void _showOnboarding2(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => OnboardingTemplate.fromProperties(
          pages: const [
            OnboardingPageModel(
              imagePath: 'assets/ilustration/PokemonCharizard.png',
              title: 'Explora el mundo\nPokémon',
              description:
                  'Descubre miles de Pokémon de todas las regiones y generaciones.',
              backgroundColor: AppColors.gray100,
            ),
            OnboardingPageModel(
              imagePath: 'assets/ilustration/PokemonCharizard.png',
              title: 'Crea tu colección',
              description:
                  'Marca tus Pokémon favoritos y crea tu propia Pokédex personalizada.',
              backgroundColor: AppColors.gray100,
            ),
            OnboardingPageModel(
              imagePath: 'assets/ilustration/PokemonCharizard.png',
              title: 'Estadísticas detalladas',
              description:
                  'Consulta estadísticas, habilidades, evoluciones y más información.',
              backgroundColor: AppColors.gray100,
            ),
          ],
          onFinish: () {
            Navigator.of(context).pop();
            _showCompletionDialog(context, 'Onboarding 2 completado!');
          },
          finishButtonText: '¡Comenzar!',
        ),
      ),
    );
  }

  // Ejemplo 3: Variant Bars
  void _showOnboarding3(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => OnboardingTemplate.fromProperties(
          pages: const [
            OnboardingPageModel(
              imagePath: 'assets/ilustration/PokemonCharizard.png',
              title: 'Paso 1',
              description: 'Primera pantalla con indicador tipo barras.',
            ),
            OnboardingPageModel(
              imagePath: 'assets/ilustration/PokemonCharizard.png',
              title: 'Paso 2',
              description: 'Segunda pantalla del tutorial.',
            ),
            OnboardingPageModel(
              imagePath: 'assets/ilustration/PokemonCharizard.png',
              title: 'Paso 3',
              description: 'Última pantalla antes de comenzar.',
            ),
          ],
          indicatorVariant: DotIndicatorVariant.bars,
          indicatorSize: DotIndicatorSize.large,
          onFinish: () {
            Navigator.of(context).pop();
            _showCompletionDialog(context, 'Onboarding 3 completado!');
          },
        ),
      ),
    );
  }

  // Ejemplo 4: Sin botón de Skip
  void _showOnboarding4(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => OnboardingTemplate.fromProperties(
          pages: const [
            OnboardingPageModel(
              imagePath: 'assets/ilustration/PokemonCharizard.png',
              title: 'Tutorial obligatorio',
              description: 'Este onboarding no se puede saltar.',
            ),
            OnboardingPageModel(
              imagePath: 'assets/ilustration/PokemonCharizard.png',
              title: 'Información importante',
              description: 'Debes ver todas las pantallas.',
            ),
          ],
          showSkipButton: false,
          onFinish: () {
            Navigator.of(context).pop();
            _showCompletionDialog(context, 'Tutorial completado!');
          },
        ),
      ),
    );
  }

  void _showCompletionDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('✅ Completado'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
