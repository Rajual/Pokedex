import 'package:flutter/material.dart';
import 'package:desing_system/desing_system.dart';

/// Pantalla de demostración del AppBottomNavigationBar
class BottomNavigationBarShowcaseScreen extends StatefulWidget {
  const BottomNavigationBarShowcaseScreen({super.key});

  @override
  State<BottomNavigationBarShowcaseScreen> createState() =>
      _BottomNavigationBarShowcaseScreenState();
}

class _BottomNavigationBarShowcaseScreenState
    extends State<BottomNavigationBarShowcaseScreen> {
  int _selectedIndex = 2; // Favoritos seleccionado por defecto

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bottom Navigation Bar'),
        backgroundColor: const Color(0xFF1E88E5),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Descripción
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Bottom Navigation Bar',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Barra de navegación inferior con íconos y labels.\n'
                    'Soporta de 2 a 5 items con estado activo/inactivo.',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Ejemplo 1: Pokedex style (4 items)
            _buildSectionTitle('Ejemplo 1: Pokedex Style (4 items)'),
            const SizedBox(height: 12),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  Container(
                    height: 200,
                    alignment: Alignment.center,
                    child: Text(
                      'Contenido de ${_getPageName(_selectedIndex)}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  AppBottomNavigationBar(
                    uiModel: AppBottomNavigationBarUiModel(
                      items: [
                        const AppBottomNavigationItemUiModel(
                          icon: Icons.home,
                          label: 'Pokedex',
                        ),
                        const AppBottomNavigationItemUiModel(
                          icon: Icons.public,
                          label: 'Regiones',
                        ),
                        const AppBottomNavigationItemUiModel(
                          icon: Icons.favorite,
                          label: 'Favoritos',
                        ),
                        const AppBottomNavigationItemUiModel(
                          icon: Icons.person,
                          label: 'Perfil',
                        ),
                      ],
                      selectedIndex: _selectedIndex,
                      activeColor: const Color(0xFF1E88E5),
                      inactiveColor: Colors.grey,
                      onItemSelected: (index) {
                        setState(() => _selectedIndex = index);
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // Ejemplo 2: Colores personalizados
            _buildSectionTitle('Ejemplo 2: Colores Personalizados'),
            const SizedBox(height: 12),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(8),
              ),
              child: AppBottomNavigationBar(
                uiModel: AppBottomNavigationBarUiModel(
                  items: const [
                    AppBottomNavigationItemUiModel(
                      icon: Icons.explore,
                      label: 'Explorar',
                    ),
                    AppBottomNavigationItemUiModel(
                      icon: Icons.search,
                      label: 'Buscar',
                    ),
                    AppBottomNavigationItemUiModel(
                      icon: Icons.bookmark,
                      label: 'Guardados',
                    ),
                    AppBottomNavigationItemUiModel(
                      icon: Icons.settings,
                      label: 'Ajustes',
                    ),
                  ],
                  selectedIndex: 0,
                  activeColor: Colors.purple,
                  inactiveColor: Colors.grey.shade400,
                  backgroundColor: Colors.purple.shade50,
                  elevation: 12,
                ),
              ),
            ),
            const SizedBox(height: 32),

            // Ejemplo 3: 3 items
            _buildSectionTitle('Ejemplo 3: Minimal (3 items)'),
            const SizedBox(height: 12),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(8),
              ),
              child: AppBottomNavigationBar(
                uiModel: AppBottomNavigationBarUiModel(
                  items: const [
                    AppBottomNavigationItemUiModel(
                      icon: Icons.home_outlined,
                      label: 'Inicio',
                    ),
                    AppBottomNavigationItemUiModel(
                      icon: Icons.favorite_border,
                      label: 'Favoritos',
                    ),
                    AppBottomNavigationItemUiModel(
                      icon: Icons.person_outline,
                      label: 'Perfil',
                    ),
                  ],
                  selectedIndex: 1,
                  activeColor: Colors.red,
                  inactiveColor: Colors.grey,
                  height: 65,
                ),
              ),
            ),
            const SizedBox(height: 32),

            // Ejemplo 4: 5 items (máximo)
            _buildSectionTitle('Ejemplo 4: Full Navigation (5 items)'),
            const SizedBox(height: 12),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(8),
              ),
              child: AppBottomNavigationBar(
                uiModel: AppBottomNavigationBarUiModel(
                  items: const [
                    AppBottomNavigationItemUiModel(
                      icon: Icons.dashboard,
                      label: 'Dashboard',
                    ),
                    AppBottomNavigationItemUiModel(
                      icon: Icons.store,
                      label: 'Tienda',
                    ),
                    AppBottomNavigationItemUiModel(
                      icon: Icons.add_circle,
                      label: 'Agregar',
                    ),
                    AppBottomNavigationItemUiModel(
                      icon: Icons.notifications,
                      label: 'Notif.',
                    ),
                    AppBottomNavigationItemUiModel(
                      icon: Icons.menu,
                      label: 'Menú',
                    ),
                  ],
                  selectedIndex: 2,
                  activeColor: Colors.green,
                  inactiveColor: Colors.grey,
                ),
              ),
            ),
            const SizedBox(height: 32),

            // Información de uso
            _buildUsageInfo(),
          ],
        ),
      ),
    );
  }

  String _getPageName(int index) {
    switch (index) {
      case 0:
        return 'Pokedex';
      case 1:
        return 'Regiones';
      case 2:
        return 'Favoritos';
      case 3:
        return 'Perfil';
      default:
        return '';
    }
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildUsageInfo() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '💡 Uso',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text('• Mínimo 2 items, máximo 5 items'),
          const Text('• Colores personalizables (activo/inactivo)'),
          const Text('• Callback onItemSelected para manejar navegación'),
          const Text('• Elevación y altura personalizables'),
          const Text('• Auto-ajuste del espaciado según cantidad de items'),
        ],
      ),
    );
  }
}
