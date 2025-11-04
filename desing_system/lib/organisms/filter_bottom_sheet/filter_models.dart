/// Modelo para una sección de filtros
class FilterSection {
  /// Título de la sección
  final String title;

  /// Opciones disponibles en esta sección
  final List<FilterOption> options;

  /// Si la sección empieza expandida
  final bool initiallyExpanded;

  const FilterSection({
    required this.title,
    required this.options,
    this.initiallyExpanded = true,
  });
}

/// Modelo para una opción de filtro individual
class FilterOption {
  /// ID único de la opción
  final String id;

  /// Etiqueta a mostrar
  final String label;

  /// Si está seleccionada
  final bool isSelected;

  const FilterOption({
    required this.id,
    required this.label,
    this.isSelected = false,
  });

  /// Crea una copia con valores actualizados
  FilterOption copyWith({
    String? id,
    String? label,
    bool? isSelected,
  }) {
    return FilterOption(
      id: id ?? this.id,
      label: label ?? this.label,
      isSelected: isSelected ?? this.isSelected,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FilterOption &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          label == other.label &&
          isSelected == other.isSelected;

  @override
  int get hashCode => id.hashCode ^ label.hashCode ^ isSelected.hashCode;
}
