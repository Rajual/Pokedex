import 'package:flutter/material.dart';
import '../../atoms/app_button/app_button.dart';
import '../../atoms/app_button/utils/enum.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_dimensions.dart';
import 'filter_models.dart';

/// Organismo FilterBottomSheet para mostrar filtros en un bottom sheet
/// 
/// Reutiliza:
/// - AppButton: Para botones de Aplicar y Cancelar
/// - TextTheme: Para títulos, etiquetas y texto
/// - Checkbox: Widget nativo de Flutter
/// 
/// Ejemplo de uso:
/// ```dart
/// FilterBottomSheet.show(
///   context: context,
///   title: 'Filtra por tus preferencias',
///   sections: [
///     FilterSection(
///       title: 'Tipo',
///       options: [
///         FilterOption(id: 'fire', label: 'Fuego'),
///         FilterOption(id: 'water', label: 'Agua'),
///       ],
///     ),
///   ],
///   onApply: (selectedIds) => print(selectedIds),
/// )
/// ```
class FilterBottomSheet extends StatefulWidget {
  /// Título del bottom sheet
  final String title;

  /// Secciones de filtros
  final List<FilterSection> sections;

  /// Callback cuando se aplican los filtros
  final Function(Map<String, List<String>>) onApply;

  /// Callback cuando se cancela (opcional)
  final VoidCallback? onCancel;

  /// Texto del botón aplicar
  final String applyButtonText;

  /// Texto del botón cancelar
  final String cancelButtonText;

  /// Altura máxima del bottom sheet (fracción de pantalla)
  final double maxHeightFraction;

  /// Si se muestra el handle de arrastre
  final bool showDragHandle;

  const FilterBottomSheet({
    super.key,
    required this.title,
    required this.sections,
    required this.onApply,
    this.onCancel,
    this.applyButtonText = 'Aplicar',
    this.cancelButtonText = 'Cancelar',
    this.maxHeightFraction = 0.85,
    this.showDragHandle = true,
  });

  /// Muestra el bottom sheet como modal
  static Future<void> show({
    required BuildContext context,
    required String title,
    required List<FilterSection> sections,
    required Function(Map<String, List<String>>) onApply,
    VoidCallback? onCancel,
    String applyButtonText = 'Aplicar',
    String cancelButtonText = 'Cancelar',
    double maxHeightFraction = 0.85,
    bool showDragHandle = true,
  }) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => FilterBottomSheet(
        title: title,
        sections: sections,
        onApply: onApply,
        onCancel: onCancel,
        applyButtonText: applyButtonText,
        cancelButtonText: cancelButtonText,
        maxHeightFraction: maxHeightFraction,
        showDragHandle: showDragHandle,
      ),
    );
  }

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  late Map<String, List<FilterOption>> _sectionOptions;

  @override
  void initState() {
    super.initState();
    // Inicializa el estado de las opciones por sección
    _sectionOptions = {};
    for (var section in widget.sections) {
      _sectionOptions[section.title] = List.from(section.options);
    }
  }

  void _toggleOption(String sectionTitle, String optionId) {
    setState(() {
      final options = _sectionOptions[sectionTitle];
      if (options != null) {
        final index = options.indexWhere((opt) => opt.id == optionId);
        if (index != -1) {
          options[index] = options[index].copyWith(
            isSelected: !options[index].isSelected,
          );
        }
      }
    });
  }

  void _onApply() {
    // Recopila todos los IDs seleccionados por sección
    final selectedBySection = <String, List<String>>{};
    
    _sectionOptions.forEach((sectionTitle, options) {
      final selectedIds = options
          .where((opt) => opt.isSelected)
          .map((opt) => opt.id)
          .toList();
      
      if (selectedIds.isNotEmpty) {
        selectedBySection[sectionTitle] = selectedIds;
      }
    });

    widget.onApply(selectedBySection);
    Navigator.of(context).pop();
  }

  void _onCancel() {
    if (widget.onCancel != null) {
      widget.onCancel!();
    }
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenHeight = MediaQuery.of(context).size.height;
    final maxHeight = screenHeight * widget.maxHeightFraction;

    return Container(
      constraints: BoxConstraints(
        maxHeight: maxHeight,
      ),
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Drag handle
          if (widget.showDragHandle)
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: AppColors.gray300,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),

          // Header con título y botón cerrar
          Padding(
            padding: EdgeInsets.fromLTRB(
              AppDimensions.lg,
              widget.showDragHandle ? AppDimensions.md : AppDimensions.lg,
              AppDimensions.sm,
              AppDimensions.md,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    widget.title,
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.gray900,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: _onCancel,
                  color: AppColors.gray600,
                ),
              ],
            ),
          ),

          const Divider(height: 1),

          // Lista de secciones con scroll
          Flexible(
            child: ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(
                horizontal: AppDimensions.lg,
                vertical: AppDimensions.md,
              ),
              itemCount: widget.sections.length,
              itemBuilder: (context, index) {
                final section = widget.sections[index];
                final options = _sectionOptions[section.title] ?? [];

                return _FilterSectionWidget(
                  section: section,
                  options: options,
                  onOptionToggle: (optionId) =>
                      _toggleOption(section.title, optionId),
                );
              },
            ),
          ),

          const Divider(height: 1),

          // Botones de acción
          Padding(
            padding: EdgeInsets.all(AppDimensions.lg),
            child: Column(
              children: [
                AppButton(
                  label: widget.applyButtonText,
                  onPressed: _onApply,
                  type: ButtonType.primary,
                  size: ButtonSize.large,
                  width: double.infinity,
                ),
                SizedBox(height: AppDimensions.sm),
                AppButton(
                  label: widget.cancelButtonText,
                  onPressed: _onCancel,
                  type: ButtonType.secondary,
                  size: ButtonSize.large,
                  width: double.infinity,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Widget interno para renderizar una sección de filtros
class _FilterSectionWidget extends StatefulWidget {
  final FilterSection section;
  final List<FilterOption> options;
  final Function(String) onOptionToggle;

  const _FilterSectionWidget({
    required this.section,
    required this.options,
    required this.onOptionToggle,
  });

  @override
  State<_FilterSectionWidget> createState() => _FilterSectionWidgetState();
}

class _FilterSectionWidgetState extends State<_FilterSectionWidget> {
  late bool _isExpanded;

  @override
  void initState() {
    super.initState();
    _isExpanded = widget.section.initiallyExpanded;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header de la sección (título + icono expandir/colapsar)
        InkWell(
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: AppDimensions.sm),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    widget.section.title,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.gray900,
                    ),
                  ),
                ),
                Icon(
                  _isExpanded ? Icons.expand_less : Icons.expand_more,
                  color: AppColors.gray600,
                ),
              ],
            ),
          ),
        ),

        // Lista de opciones (checkboxes)
        if (_isExpanded)
          ...widget.options.map((option) {
            return _CheckboxOption(
              option: option,
              onChanged: (value) {
                widget.onOptionToggle(option.id);
              },
            );
          }).toList(),

        SizedBox(height: AppDimensions.md),
      ],
    );
  }
}

/// Widget interno para una opción con checkbox
class _CheckboxOption extends StatelessWidget {
  final FilterOption option;
  final Function(bool?) onChanged;

  const _CheckboxOption({
    required this.option,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: () => onChanged(!option.isSelected),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: AppDimensions.xs,
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                option.label,
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: AppColors.gray800,
                ),
              ),
            ),
            Checkbox(
              value: option.isSelected,
              onChanged: onChanged,
              activeColor: AppColors.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
