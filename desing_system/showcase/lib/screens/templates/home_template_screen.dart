import 'package:flutter/material.dart';
import 'package:desing_system/desing_system.dart';

/// Pantalla de demostración del HomeTemplate
class HomeTemplateScreen extends StatelessWidget {
  const HomeTemplateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeTemplate(
      uiModel: HomeTemplateUiModel(
        navigationItems: const [
          AppBottomNavigationItemUiModel(
            icon: Icons.home,
            label: 'Pokedex',
          ),
          AppBottomNavigationItemUiModel(
            icon: Icons.public,
            label: 'Regiones',
          ),
          AppBottomNavigationItemUiModel(
            icon: Icons.favorite,
            label: 'Favoritos',
          ),
          AppBottomNavigationItemUiModel(
            icon: Icons.person,
            label: 'Perfil',
          ),
        ],
        pages: [
          _PokedexPage(),
          _RegionsPage(),
          _FavoritesPage(),
          _ProfilePage(),
        ],
        initialSelectedIndex: 0,
        activeColor: const Color(0xFF1E88E5),
        inactiveColor: Colors.grey,
        keepPagesAlive: true,
        onPageChanged: (index) {
          debugPrint('Page changed to index: $index');
        },
      ),
    );
  }
}

/// Página de ejemplo: Pokedex
class _PokedexPage extends StatefulWidget {
  @override
  State<_PokedexPage> createState() => _PokedexPageState();
}

class _PokedexPageState extends State<_PokedexPage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokedex'),
        backgroundColor: const Color(0xFF1E88E5),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.catching_pokemon,
              size: 100,
              color: Color(0xFF1E88E5),
            ),
            const SizedBox(height: 24),
            const Text(
              'Página Pokedex',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Aquí se mostraría la lista de Pokemon',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 32),
            // Contador para demostrar que el estado se mantiene
            Text(
              'Contador (estado): $_counter',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                setState(() => _counter++);
              },
              child: const Text('Incrementar'),
            ),
            const SizedBox(height: 16),
            const Text(
              '💡 Cambia de tab y regresa para ver\nque el estado se mantiene',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}

/// Página de ejemplo: Regiones
class _RegionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Regiones'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.public,
              size: 100,
              color: Colors.green,
            ),
            const SizedBox(height: 24),
            const Text(
              'Página Regiones',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Aquí se mostrarían las regiones Pokemon',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 32),
            _buildRegionCard('Kanto', Colors.red),
            const SizedBox(height: 12),
            _buildRegionCard('Johto', Colors.orange),
            const SizedBox(height: 12),
            _buildRegionCard('Hoenn', Colors.blue),
          ],
        ),
      ),
    );
  }

  Widget _buildRegionCard(String name, Color color) {
    return Container(
      width: 200,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color),
      ),
      child: Text(
        name,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: color,
        ),
      ),
    );
  }
}

/// Página de ejemplo: Favoritos
class _FavoritesPage extends StatefulWidget {
  @override
  State<_FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<_FavoritesPage> {
  final List<String> _favorites = ['Pikachu', 'Charizard', 'Bulbasaur'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favoritos'),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.favorite,
              size: 100,
              color: Colors.red,
            ),
            const SizedBox(height: 24),
            const Text(
              'Página Favoritos',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Tienes ${_favorites.length} Pokemon favoritos',
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 32),
            ..._favorites.map((pokemon) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Chip(
                    avatar: const Icon(Icons.favorite, color: Colors.red, size: 18),
                    label: Text(pokemon),
                    deleteIcon: const Icon(Icons.close, size: 18),
                    onDeleted: () {
                      setState(() => _favorites.remove(pokemon));
                    },
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

/// Página de ejemplo: Perfil
class _ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundColor: Colors.purple,
              child: Icon(
                Icons.person,
                size: 60,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Ash Ketchum',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Entrenador Pokemon',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 32),
            _buildStatRow('Pokemon Capturados', '150'),
            const SizedBox(height: 12),
            _buildStatRow('Medallas', '8'),
            const SizedBox(height: 12),
            _buildStatRow('Nivel', '45'),
          ],
        ),
      ),
    );
  }

  Widget _buildStatRow(String label, String value) {
    return Container(
      width: 250,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 14),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.purple,
            ),
          ),
        ],
      ),
    );
  }
}
