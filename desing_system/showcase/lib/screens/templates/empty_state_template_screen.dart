import 'package:flutter/material.dart';
import 'package:desing_system/desing_system.dart';

/// Pantalla de demostración del EmptyStateTemplate
class EmptyStateTemplateScreen extends StatelessWidget {
  const EmptyStateTemplateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Empty State Template'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildSection(
            context,
            title: 'Ejemplo 1: Sin Favoritos',
            description: 'Estado vacío para lista de favoritos',
            onPressed: () => _showNoFavorites(context),
          ),
          const SizedBox(height: 16),
          _buildSection(
            context,
            title: 'Ejemplo 2: Próximamente',
            description: 'Feature en desarrollo',
            onPressed: () => _showComingSoon(context),
          ),
          const SizedBox(height: 16),
          _buildSection(
            context,
            title: 'Ejemplo 3: Error de Conexión',
            description: 'No se pudo cargar la información',
            onPressed: () => _showConnectionError(context),
          ),
          const SizedBox(height: 16),
          _buildSection(
            context,
            title: 'Ejemplo 4: Sin Resultados',
            description: 'Búsqueda sin resultados',
            onPressed: () => _showNoResults(context),
          ),
          const SizedBox(height: 16),
          _buildSection(
            context,
            title: 'Ejemplo 5: Permisos Requeridos',
            description: 'Solicitud de permisos',
            onPressed: () => _showPermissionsRequired(context),
          ),
          const SizedBox(height: 16),
          _buildSection(
            context,
            title: 'Ejemplo 6: Con Dos Botones',
            description: 'Acción principal y secundaria',
            onPressed: () => _showWithTwoButtons(context),
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

  // Ejemplo 1: Sin Favoritos (basado en la primera imagen)
  void _showNoFavorites(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => EmptyStateTemplate(
          imagePath: 'assets/ilustration/PokemonMagikarp.png',
          title: 'No has marcado ningún\nPokémon como favorito',
          description:
              'Haz clic en el ícono de corazón de tus\nPokémon favoritos y aparecerán aquí.',
          actionLabel: 'Explorar Pokémon',
          onAction: () {
            Navigator.of(context).pop();
            _showCompletionSnackBar(context, 'Navegando a explorar...');
          },
        ),
      ),
    );
  }

  // Ejemplo 2: Próximamente (basado en la segunda imagen)
  void _showComingSoon(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => EmptyStateTemplate(
          imagePath: 'assets/ilustration/PokemonJigglypuff.png',
          title: '¡Muy pronto disponible!',
          description:
              'Estamos trabajando para traerte esta\nsección. Vuelve más adelante para descubrir\ntodas las novedades.',
          imageSize: AppImageSize.large,
        ),
      ),
    );
  }

  // Ejemplo 3: Error de Conexión (basado en la tercera imagen)
  void _showConnectionError(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => EmptyStateTemplate(
          imagePath: 'assets/ilustration/PokemonMagikarp.png',
          title: 'Algo salió mal...',
          description:
              'No pudimos cargar la información en este\nmomento. Verifica tu conexión o intenta\nnuevamente más tarde.',
          actionLabel: 'Reintentar',
          onAction: () {
            Navigator.of(context).pop();
            _showCompletionSnackBar(context, 'Reintentando conexión...');
          },
          imageSize: AppImageSize.medium,
        ),
      ),
    );
  }

  // Ejemplo 4: Sin Resultados de Búsqueda
  void _showNoResults(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => EmptyStateTemplate(
          imagePath: 'assets/ilustration/PokemonPsyduck.png',
          title: 'No encontramos resultados',
          description:
              'No hay Pokémon que coincidan con tu búsqueda.\nIntenta con otro nombre o tipo.',
          hint: 'Sugerencia: Revisa la ortografía o usa términos más generales',
          actionLabel: 'Limpiar búsqueda',
          onAction: () {
            Navigator.of(context).pop();
            _showCompletionSnackBar(context, 'Búsqueda limpiada');
          },
          imageSize: AppImageSize.large,
        ),
      ),
    );
  }

  // Ejemplo 5: Permisos Requeridos
  void _showPermissionsRequired(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => EmptyStateTemplate(
          imagePath: 'assets/ilustration/PokemonSnorlax.png',
          title: 'Permisos necesarios',
          description:
              'Para usar esta función necesitamos\nacceso a tu ubicación.',
          actionLabel: 'Conceder permisos',
          secondaryActionLabel: 'Ahora no',
          onAction: () {
            Navigator.of(context).pop();
            _showCompletionSnackBar(context, 'Solicitando permisos...');
          },
          onSecondaryAction: () {
            Navigator.of(context).pop();
          },
          imageSize: AppImageSize.medium,
        ),
      ),
    );
  }

  // Ejemplo 6: Con Dos Botones
  void _showWithTwoButtons(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => EmptyStateTemplate(
          imagePath: 'assets/ilustration/PokemonCharizard.png',
          title: 'Tu equipo está vacío',
          description:
              'Agrega Pokémon a tu equipo para comenzar\ntu aventura.',
          actionLabel: 'Agregar Pokémon',
          secondaryActionLabel: 'Explorar opciones',
          onAction: () {
            Navigator.of(context).pop();
            _showCompletionSnackBar(context, 'Agregando Pokémon...');
          },
          onSecondaryAction: () {
            Navigator.of(context).pop();
            _showCompletionSnackBar(context, 'Explorando opciones...');
          },
        ),
      ),
    );
  }

  void _showCompletionSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
