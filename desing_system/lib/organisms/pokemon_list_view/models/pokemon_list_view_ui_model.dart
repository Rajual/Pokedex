import '../../../molecules/app_card/models/app_card_ui_model.dart';

/// UI Model for PokemonListView component
/// Contains all the serializable configuration needed to render a PokemonListView
/// Note: Callbacks like onFavoriteChanged, onSearchChanged should be provided separately when creating the widget
class PokemonListViewUiModel {
  final String searchPlaceholder;
  final CardSize cardSize;
  final bool showSearchBar;
  final bool isSearching;

  const PokemonListViewUiModel({
    this.searchPlaceholder = 'Procurar Pokémon...',
    this.cardSize = CardSize.medium,
    this.showSearchBar = true,
    this.isSearching = false,
  });

  /// Factory constructor to create from JSON
  factory PokemonListViewUiModel.fromJson(Map<String, dynamic> json) {
    return PokemonListViewUiModel(
      searchPlaceholder: json['searchPlaceholder'] as String? ?? 'Procurar Pokémon...',
      cardSize: CardSize.values.firstWhere(
        (e) => e.name == json['cardSize'],
        orElse: () => CardSize.medium,
      ),
      showSearchBar: json['showSearchBar'] as bool? ?? true,
      isSearching: json['isSearching'] as bool? ?? false,
    );
  }

  /// Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'searchPlaceholder': searchPlaceholder,
      'cardSize': cardSize.name,
      'showSearchBar': showSearchBar,
      'isSearching': isSearching,
    };
  }

  /// Create a copy with modified properties
  PokemonListViewUiModel copyWith({
    String? searchPlaceholder,
    CardSize? cardSize,
    bool? showSearchBar,
    bool? isSearching,
  }) {
    return PokemonListViewUiModel(
      searchPlaceholder: searchPlaceholder ?? this.searchPlaceholder,
      cardSize: cardSize ?? this.cardSize,
      showSearchBar: showSearchBar ?? this.showSearchBar,
      isSearching: isSearching ?? this.isSearching,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PokemonListViewUiModel &&
        other.searchPlaceholder == searchPlaceholder &&
        other.cardSize == cardSize &&
        other.showSearchBar == showSearchBar &&
        other.isSearching == isSearching;
  }

  @override
  int get hashCode {
    return Object.hash(
      searchPlaceholder,
      cardSize,
      showSearchBar,
      isSearching,
    );
  }

  @override
  String toString() {
    return 'PokemonListViewUiModel(searchPlaceholder: $searchPlaceholder, cardSize: $cardSize, showSearchBar: $showSearchBar, isSearching: $isSearching)';
  }
}