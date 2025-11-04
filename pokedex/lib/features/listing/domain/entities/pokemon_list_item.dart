/// Domain entity representing a Pokemon in the listing
class PokemonListItem {
  final int id;
  final String name;
  final String imageUrl;
  final String primaryType;
  final String? secondaryType;

  const PokemonListItem({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.primaryType,
    this.secondaryType,
  });

  /// Check if this Pokemon matches the search query
  /// Matches by name (case insensitive) or by ID (formatted as #001, #025, etc.)
  bool matchesSearch(String query) {
    if (query.isEmpty) return true;

    final lowerQuery = query.toLowerCase();
    final lowerName = name.toLowerCase();

    // Match by name
    if (lowerName.contains(lowerQuery)) return true;

    // Match by ID (formatted as #001, #025, etc.)
    final formattedId = '#${id.toString().padLeft(3, '0')}';
    if (formattedId.contains(lowerQuery)) return true;

    // Match by plain ID number
    if (id.toString().contains(lowerQuery)) return true;

    return false;
  }

  /// Check if this Pokemon matches the type filter
  /// If typeFilter is null, all Pokemon match
  /// If typeFilter is not null, Pokemon must have that type as primary or secondary
  bool matchesTypeFilter(String? typeFilter) {
    if (typeFilter == null || typeFilter.isEmpty) return true;

    final lowerFilter = typeFilter.toLowerCase();
    final lowerPrimary = primaryType.toLowerCase();
    final lowerSecondary = secondaryType?.toLowerCase() ?? '';

    return lowerPrimary == lowerFilter || lowerSecondary == lowerFilter;
  }

  /// Get formatted display name with ID
  String get displayName => '#${id.toString().padLeft(3, '0')} $name';

  /// Get all types as a list
  List<String> get allTypes {
    final types = [primaryType];
    if (secondaryType != null) {
      types.add(secondaryType!);
    }
    return types;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PokemonListItem &&
        other.id == id &&
        other.name == name &&
        other.imageUrl == imageUrl &&
        other.primaryType == primaryType &&
        other.secondaryType == secondaryType;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        imageUrl.hashCode ^
        primaryType.hashCode ^
        secondaryType.hashCode;
  }

  @override
  String toString() {
    return 'PokemonListItem(id: $id, name: $name, primaryType: $primaryType, secondaryType: $secondaryType)';
  }
}