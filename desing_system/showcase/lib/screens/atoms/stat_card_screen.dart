import 'package:flutter/material.dart';
import 'package:desing_system/desing_system.dart';

/// Pantalla de demostración del StatCard atom
class StatCardScreen extends StatelessWidget {
  const StatCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('StatCard Atom'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Sección: Tamaños
          _buildSectionTitle('Tamaños'),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    StatCard(
                      uiModel: StatCardUiModel(
                        icon: Icons.monitor_weight_outlined,
                        label: 'PESO',
                        value: '6,9 kg',
                        size: StatCardSize.small,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text('Small', style: TextStyle(fontSize: 12)),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  children: [
                    StatCard(
                      uiModel: StatCardUiModel(
                        icon: Icons.height,
                        label: 'ALTURA',
                        value: '0,7 m',
                        size: StatCardSize.medium,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text('Medium', style: TextStyle(fontSize: 12)),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  children: [
                    StatCard(
                      uiModel: StatCardUiModel(
                        icon: Icons.category_outlined,
                        label: 'CATEGORÍA',
                        value: 'SEMILLA',
                        size: StatCardSize.large,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text('Large', style: TextStyle(fontSize: 12)),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 32),

          // Sección: Variantes
          _buildSectionTitle('Variantes'),
          const SizedBox(height: 16),

          _buildSubtitle('Default'),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: StatCard(
                  uiModel: StatCardUiModel(
                    icon: Icons.flash_on_outlined,
                    label: 'HABILIDAD',
                    value: 'Espesura',
                    variant: StatCardVariant.defaultVariant,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: StatCard(
                  uiModel: StatCardUiModel(
                    icon: Icons.speed,
                    label: 'VELOCIDAD',
                    value: '45',
                    variant: StatCardVariant.defaultVariant,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          _buildSubtitle('Colored'),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: StatCard(
                  uiModel: StatCardUiModel(
                    icon: Icons.favorite,
                    label: 'HP',
                    value: '45',
                    variant: StatCardVariant.colored,
                    color: Colors.red,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: StatCard(
                  uiModel: StatCardUiModel(
                    icon: Icons.security,
                    label: 'DEFENSA',
                    value: '49',
                    variant: StatCardVariant.colored,
                    color: Colors.blue,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          _buildSubtitle('Outlined'),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: StatCard(
                  uiModel: StatCardUiModel(
                    icon: Icons.local_fire_department,
                    label: 'ATAQUE',
                    value: '49',
                    variant: StatCardVariant.outlined,
                    color: Colors.orange,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: StatCard(
                  uiModel: StatCardUiModel(
                    icon: Icons.stars,
                    label: 'ESPECIAL',
                    value: '65',
                    variant: StatCardVariant.outlined,
                    color: Colors.purple,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          _buildSubtitle('Elevated'),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: StatCard(
                  uiModel: StatCardUiModel(
                    icon: Icons.fitness_center,
                    label: 'FUERZA',
                    value: '82',
                    variant: StatCardVariant.elevated,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: StatCard(
                  uiModel: StatCardUiModel(
                    icon: Icons.psychology,
                    label: 'INTELIGENCIA',
                    value: '90',
                    variant: StatCardVariant.elevated,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 32),

          // Sección: Colores personalizados
          _buildSectionTitle('Colores Personalizados'),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: StatCard(
                  uiModel: StatCardUiModel(
                    icon: Icons.water_drop,
                    label: 'AGUA',
                    value: '100%',
                    variant: StatCardVariant.colored,
                    color: Colors.blue,
                    iconColor: Colors.blue.shade700,
                    labelColor: Colors.blue.shade700,
                    valueColor: Colors.blue.shade900,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: StatCard(
                  uiModel: StatCardUiModel(
                    icon: Icons.grass,
                    label: 'PLANTA',
                    value: '85%',
                    variant: StatCardVariant.colored,
                    color: Colors.green,
                    iconColor: Colors.green.shade700,
                    labelColor: Colors.green.shade700,
                    valueColor: Colors.green.shade900,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 32),

          // Sección: Estados
          _buildSectionTitle('Estados'),
          const SizedBox(height: 16),

          _buildSubtitle('Habilitado (clickeable)'),
          const SizedBox(height: 8),
          StatCard(
            uiModel: StatCardUiModel(
              icon: Icons.touch_app,
              label: 'TOCA AQUÍ',
              value: 'Habilitado',
              isEnabled: true,
            ),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('¡StatCard presionado!'),
                  duration: Duration(seconds: 1),
                ),
              );
            },
          ),

          const SizedBox(height: 16),

          _buildSubtitle('Deshabilitado'),
          const SizedBox(height: 8),
          StatCard(
            uiModel: StatCardUiModel(
              icon: Icons.block,
              label: 'BLOQUEADO',
              value: 'Deshabilitado',
              isEnabled: false,
            ),
            onTap: () {
              // No se ejecutará porque está deshabilitado
            },
          ),

          const SizedBox(height: 32),

          // Sección: Pokémon Stats (Ejemplo real)
          _buildSectionTitle('Ejemplo: Bulbasaur Stats'),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: StatCard(
                  uiModel: StatCardUiModel(
                    icon: Icons.monitor_weight_outlined,
                    label: 'PESO',
                    value: '6,9 kg',
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: StatCard(
                  uiModel: StatCardUiModel(
                    icon: Icons.height,
                    label: 'ALTURA',
                    value: '0,7 m',
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: StatCard(
                  uiModel: StatCardUiModel(
                    icon: Icons.category_outlined,
                    label: 'CATEGORÍA',
                    value: 'SEMILLA',
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: StatCard(
                  uiModel: StatCardUiModel(
                    icon: Icons.flash_on_outlined,
                    label: 'HABILIDAD',
                    value: 'Espesura',
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 32),

          // Sección: Grid de Stats Pokémon
          _buildSectionTitle('Ejemplo: Grid Completo de Stats'),
          const SizedBox(height: 16),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 1.5,
            children: [
              StatCard(
                uiModel: StatCardUiModel(
                  icon: Icons.favorite,
                  label: 'HP',
                  value: '45',
                  variant: StatCardVariant.colored,
                  color: Colors.red,
                  size: StatCardSize.small,
                ),
              ),
              StatCard(
                uiModel: StatCardUiModel(
                  icon: Icons.local_fire_department,
                  label: 'ATAQUE',
                  value: '49',
                  variant: StatCardVariant.colored,
                  color: Colors.orange,
                  size: StatCardSize.small,
                ),
              ),
              StatCard(
                uiModel: StatCardUiModel(
                  icon: Icons.security,
                  label: 'DEFENSA',
                  value: '49',
                  variant: StatCardVariant.colored,
                  color: Colors.blue,
                  size: StatCardSize.small,
                ),
              ),
              StatCard(
                uiModel: StatCardUiModel(
                  icon: Icons.bolt,
                  label: 'ESP. ATK',
                  value: '65',
                  variant: StatCardVariant.colored,
                  color: Colors.purple,
                  size: StatCardSize.small,
                ),
              ),
              StatCard(
                uiModel: StatCardUiModel(
                  icon: Icons.shield,
                  label: 'ESP. DEF',
                  value: '65',
                  variant: StatCardVariant.colored,
                  color: Colors.teal,
                  size: StatCardSize.small,
                ),
              ),
              StatCard(
                uiModel: StatCardUiModel(
                  icon: Icons.speed,
                  label: 'VELOCIDAD',
                  value: '45',
                  variant: StatCardVariant.colored,
                  color: Colors.amber,
                  size: StatCardSize.small,
                ),
              ),
            ],
          ),

          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildSubtitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: Colors.grey,
      ),
    );
  }
}
