import '../app_type_tag.dart';

/// UI Model for AppTypeTag component
/// Contains all the serializable configuration needed to render an AppTypeTag
class AppTypeTagUiModel {
  final PokemonType type;
  final TypeTagSize size;
  final bool fullWidth;

  const AppTypeTagUiModel({
    required this.type,
    this.size = TypeTagSize.medium,
    this.fullWidth = false,
  });

  /// Factory constructor to create from JSON
  factory AppTypeTagUiModel.fromJson(Map<String, dynamic> json) {
    return AppTypeTagUiModel(
      type: PokemonType.values.firstWhere(
        (e) => e.name == json['type'],
        orElse: () => PokemonType.normal,
      ),
      size: TypeTagSize.values.firstWhere(
        (e) => e.name == json['size'],
        orElse: () => TypeTagSize.medium,
      ),
      fullWidth: json['fullWidth'] as bool? ?? false,
    );
  }

  /// Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'type': type.name,
      'size': size.name,
      'fullWidth': fullWidth,
    };
  }

  /// Create a copy with modified properties
  AppTypeTagUiModel copyWith({
    PokemonType? type,
    TypeTagSize? size,
    bool? fullWidth,
  }) {
    return AppTypeTagUiModel(
      type: type ?? this.type,
      size: size ?? this.size,
      fullWidth: fullWidth ?? this.fullWidth,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AppTypeTagUiModel &&
        other.type == type &&
        other.size == size &&
        other.fullWidth == fullWidth;
  }

  @override
  int get hashCode {
    return Object.hash(
      type,
      size,
      fullWidth,
    );
  }

  @override
  String toString() {
    return 'AppTypeTagUiModel(type: $type, size: $size, fullWidth: $fullWidth)';
  }
}