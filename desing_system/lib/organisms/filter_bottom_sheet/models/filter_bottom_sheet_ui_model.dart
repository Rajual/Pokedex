import '../filter_models.dart';

/// UI Model for FilterBottomSheet component
class FilterBottomSheetUiModel {
  /// Title of the bottom sheet
  final String title;

  /// List of filter sections
  final List<FilterSection> sections;

  /// Text for the apply button
  final String applyButtonText;

  /// Text for the cancel button
  final String cancelButtonText;

  /// Maximum height fraction of screen
  final double maxHeightFraction;

  /// Whether to show drag handle
  final bool showDragHandle;

  const FilterBottomSheetUiModel({
    required this.title,
    required this.sections,
    this.applyButtonText = 'Aplicar',
    this.cancelButtonText = 'Cancelar',
    this.maxHeightFraction = 0.85,
    this.showDragHandle = true,
  });

  /// Create from JSON
  factory FilterBottomSheetUiModel.fromJson(Map<String, dynamic> json) {
    return FilterBottomSheetUiModel(
      title: json['title'] as String,
      sections: (json['sections'] as List<dynamic>)
          .map((section) => FilterSection.fromJson(section as Map<String, dynamic>))
          .toList(),
      applyButtonText: json['applyButtonText'] as String? ?? 'Aplicar',
      cancelButtonText: json['cancelButtonText'] as String? ?? 'Cancelar',
      maxHeightFraction: json['maxHeightFraction'] as double? ?? 0.85,
      showDragHandle: json['showDragHandle'] as bool? ?? true,
    );
  }

  /// Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'sections': sections.map((section) => section.toJson()).toList(),
      'applyButtonText': applyButtonText,
      'cancelButtonText': cancelButtonText,
      'maxHeightFraction': maxHeightFraction,
      'showDragHandle': showDragHandle,
    };
  }
}