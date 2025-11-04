import 'package:flutter/material.dart';
import 'package:desing_system/desing_system.dart';

/// Pantalla de demostración del FilterBottomSheet
class FilterBottomSheetScreen extends StatefulWidget {
  const FilterBottomSheetScreen({super.key});

  @override
  State<FilterBottomSheetScreen> createState() =>
      _FilterBottomSheetScreenState();
}

class _FilterBottomSheetScreenState extends State<FilterBottomSheetScreen> {
  Map<String, List<String>> _selectedFilters = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filter Bottom Sheet'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Filtros seleccionados actuales
          if (_selectedFilters.isNotEmpty) ...[
            Card(
              color: AppColors.primary.withOpacity(0.1),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Filtros Seleccionados:',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 8),
                    ..._selectedFilters.entries.map((entry) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 4),
                        child: Text(
                          '${entry.key}: ${entry.value.join(", ")}',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      );
                    }).toList(),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],

          _buildExampleCard(
            context,
            title: 'Ejemplo 1: Filtro de Tipos Pokémon',
            description: 'Filtro por tipos (basado en el diseño)',
            onPressed: () => _showPokemonTypeFilter(context),
          ),
          const SizedBox(height: 16),
          _buildExampleCard(
            context,
            title: 'Ejemplo 2: Múltiples Secciones',
            description: 'Filtros con varias categorías',
            onPressed: () => _showMultipleSectionsFilter(context),
          ),
          const SizedBox(height: 16),
          _buildExampleCard(
            context,
            title: 'Ejemplo 3: Con Selecciones Previas',
            description: 'Filtro con opciones pre-seleccionadas',
            onPressed: () => _showPreselectedFilter(context),
          ),
          const SizedBox(height: 16),
          _buildExampleCard(
            context,
            title: 'Ejemplo 4: Una Sección Colapsada',
            description: 'Secciones que inician colapsadas',
            onPressed: () => _showCollapsedSectionFilter(context),
          ),
        ],
      ),
    );
  }

  Widget _buildExampleCard(
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

  // Ejemplo 1: Filtro de tipos Pokémon (basado en el diseño)
  void _showPokemonTypeFilter(BuildContext context) {
    FilterBottomSheet.show(
      context: context,
      title: 'Filtra por tus preferencias',
      sections: [
        FilterSection(
          title: 'Tipo',
          options: [
            const FilterOption(id: 'agua', label: 'Agua'),
            const FilterOption(id: 'dragon', label: 'Dragón'),
            const FilterOption(id: 'electrico', label: 'Eléctrico'),
            const FilterOption(id: 'hada', label: 'Hada'),
            const FilterOption(id: 'fantasma', label: 'Fantasma'),
            const FilterOption(id: 'fuego', label: 'Fuego'),
            const FilterOption(id: 'hielo', label: 'Hielo'),
            const FilterOption(id: 'planta', label: 'Planta'),
            const FilterOption(id: 'normal', label: 'Normal'),
            const FilterOption(id: 'psiquico', label: 'Psíquico'),
            const FilterOption(id: 'roca', label: 'Roca'),
            const FilterOption(id: 'siniestro', label: 'Siniestro'),
            const FilterOption(id: 'tierra', label: 'Tierra'),
            const FilterOption(id: 'veneno', label: 'Veneno'),
            const FilterOption(id: 'volador', label: 'Volador'),
          ],
        ),
      ],
      onApply: (selected) {
        setState(() {
          _selectedFilters = selected;
        });
        _showSnackBar(context, 'Filtros aplicados: ${selected.length} sección(es)');
      },
    );
  }

  // Ejemplo 2: Múltiples secciones
  void _showMultipleSectionsFilter(BuildContext context) {
    FilterBottomSheet.show(
      context: context,
      title: 'Filtros avanzados',
      sections: [
        FilterSection(
          title: 'Tipo',
          options: const [
            FilterOption(id: 'fire', label: 'Fuego'),
            FilterOption(id: 'water', label: 'Agua'),
            FilterOption(id: 'grass', label: 'Planta'),
            FilterOption(id: 'electric', label: 'Eléctrico'),
          ],
        ),
        FilterSection(
          title: 'Generación',
          options: const [
            FilterOption(id: 'gen1', label: 'Generación I (Kanto)'),
            FilterOption(id: 'gen2', label: 'Generación II (Johto)'),
            FilterOption(id: 'gen3', label: 'Generación III (Hoenn)'),
            FilterOption(id: 'gen4', label: 'Generación IV (Sinnoh)'),
          ],
        ),
        FilterSection(
          title: 'Estado',
          options: const [
            FilterOption(id: 'legendary', label: 'Legendario'),
            FilterOption(id: 'mythical', label: 'Mítico'),
            FilterOption(id: 'regular', label: 'Regular'),
          ],
        ),
      ],
      onApply: (selected) {
        setState(() {
          _selectedFilters = selected;
        });
        _showSnackBar(context, 'Filtros aplicados: ${selected.length} sección(es)');
      },
    );
  }

  // Ejemplo 3: Con selecciones previas
  void _showPreselectedFilter(BuildContext context) {
    FilterBottomSheet.show(
      context: context,
      title: 'Editar filtros',
      sections: [
        FilterSection(
          title: 'Tipo',
          options: const [
            FilterOption(id: 'fire', label: 'Fuego', isSelected: true),
            FilterOption(id: 'water', label: 'Agua', isSelected: true),
            FilterOption(id: 'grass', label: 'Planta'),
            FilterOption(id: 'electric', label: 'Eléctrico'),
          ],
        ),
        FilterSection(
          title: 'Rareza',
          options: const [
            FilterOption(id: 'common', label: 'Común'),
            FilterOption(id: 'rare', label: 'Raro', isSelected: true),
            FilterOption(id: 'epic', label: 'Épico'),
            FilterOption(id: 'legendary', label: 'Legendario'),
          ],
        ),
      ],
      onApply: (selected) {
        setState(() {
          _selectedFilters = selected;
        });
        _showSnackBar(context, 'Filtros actualizados');
      },
    );
  }

  // Ejemplo 4: Sección colapsada
  void _showCollapsedSectionFilter(BuildContext context) {
    FilterBottomSheet.show(
      context: context,
      title: 'Filtros opcionales',
      sections: [
        FilterSection(
          title: 'Tipo Principal',
          initiallyExpanded: true,
          options: const [
            FilterOption(id: 'fire', label: 'Fuego'),
            FilterOption(id: 'water', label: 'Agua'),
            FilterOption(id: 'grass', label: 'Planta'),
          ],
        ),
        FilterSection(
          title: 'Tipo Secundario',
          initiallyExpanded: false,
          options: const [
            FilterOption(id: 'flying', label: 'Volador'),
            FilterOption(id: 'poison', label: 'Veneno'),
            FilterOption(id: 'ground', label: 'Tierra'),
          ],
        ),
        FilterSection(
          title: 'Habilidades Especiales',
          initiallyExpanded: false,
          options: const [
            FilterOption(id: 'speed', label: 'Alta velocidad'),
            FilterOption(id: 'defense', label: 'Alta defensa'),
            FilterOption(id: 'attack', label: 'Alto ataque'),
          ],
        ),
      ],
      onApply: (selected) {
        setState(() {
          _selectedFilters = selected;
        });
        _showSnackBar(context, 'Filtros aplicados');
      },
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
