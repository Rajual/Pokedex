import 'package:flutter/material.dart';
import '../../molecules/app_card/app_card.dart';
import '../../molecules/app_card/models/app_card_ui_model.dart';
import '../../molecules/app_type_tag/app_type_tag.dart';
import '../../molecules/search_bar/search_bar.dart' show CustomSearchBar;
import '../../molecules/search_bar/models/custom_search_bar_ui_model.dart';
import 'models/pokemon_list_view_ui_model.dart';

/// Modelo de Pokémon para el listado
/// 
/// Solo contiene la información necesaria que AppCard requiere
class Pokemon {
  final String name;
  final int number;
  final PokemonType primaryType;
  final List<PokemonType> types; // Soporta múltiples tipos
  final String imagePath;
  final Color backgroundColor;
  bool isFavorite;

  Pokemon({
    required this.name,
    required this.number,
    required this.primaryType,
    required this.types,
    required this.imagePath,
    required this.backgroundColor,
    this.isFavorite = false,
  })  : assert(types.isNotEmpty, 'Pokemon debe tener al menos un tipo'),
        assert(types.contains(primaryType), 'primaryType debe estar en types');

  /// Obtiene el tipo secundario (si existe)
  PokemonType? get secondaryType => types.length > 1 ? types[1] : null;
}

/// Organism que combina SearchBar + ListView de AppCards
///
/// Ejemplo:
/// ```dart
/// PokemonListView(
///   uiModel: PokemonListViewUiModel(),
///   pokemonList: pokemonList,
///   onFavoriteChanged: (index, isFav) {
///     setState(() => pokemonList[index].isFavorite = isFav);
///   },
///   onSearchChanged: (query) {
///     setState(() => searchQuery = query);
///   },
/// )
/// ```
class PokemonListView extends StatefulWidget {
  final PokemonListViewUiModel uiModel;

  /// Lista de Pokémon a mostrar
  final List<Pokemon> pokemonList;

  /// Callback cuando cambia el favorito
  final Function(int index, bool isFavorite) onFavoriteChanged;

  /// Callback cuando cambia la búsqueda
  final Function(String query)? onSearchChanged;

  const PokemonListView({
    required this.uiModel,
    required this.pokemonList,
    required this.onFavoriteChanged,
    this.onSearchChanged,
    super.key,
  });

  /// Factory constructor for backward compatibility
  factory PokemonListView.fromProperties({
    required List<Pokemon> pokemonList,
    required Function(int index, bool isFavorite) onFavoriteChanged,
    Function(String query)? onSearchChanged,
    String searchPlaceholder = 'Procurar Pokémon...',
    CardSize cardSize = CardSize.medium,
    bool showSearchBar = true,
    bool isSearching = false,
    Key? key,
  }) {
    return PokemonListView(
      uiModel: PokemonListViewUiModel(
        searchPlaceholder: searchPlaceholder,
        cardSize: cardSize,
        showSearchBar: showSearchBar,
        isSearching: isSearching,
      ),
      pokemonList: pokemonList,
      onFavoriteChanged: onFavoriteChanged,
      onSearchChanged: onSearchChanged,
      key: key,
    );
  }

  @override
  State<PokemonListView> createState() => _PokemonListViewState();
}

class _PokemonListViewState extends State<PokemonListView> {
  late List<Pokemon> _filteredList;
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _filteredList = widget.pokemonList;
  }

  @override
  void didUpdateWidget(PokemonListView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.pokemonList != widget.pokemonList) {
      _filteredList = widget.pokemonList;
      _filterList(_searchQuery);
    }
  }

  void _filterList(String query) {
    _searchQuery = query.toLowerCase();
    
    setState(() {
      if (_searchQuery.isEmpty) {
        _filteredList = widget.pokemonList;
      } else {
        _filteredList = widget.pokemonList
            .where((pokemon) =>
                pokemon.name.toLowerCase().contains(_searchQuery) ||
                pokemon.number.toString().contains(_searchQuery))
            .toList();
      }
    });

    widget.onSearchChanged?.call(_searchQuery);
  }

  int _getOriginalIndex(Pokemon item) {
    return widget.pokemonList.indexOf(item);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // SearchBar
        if (widget.uiModel.showSearchBar)
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: CustomSearchBar(
              uiModel: CustomSearchBarUiModel(
                hintText: widget.uiModel.searchPlaceholder,
              ),
              onChanged: _filterList,
            ),
          ),
        // Empty state
        if (_filteredList.isEmpty)
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.search_off,
                    size: 64,
                    color: Colors.grey[300],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'No hay Pokémon para mostrar',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Colors.grey[600],
                        ),
                  ),
                  if (_searchQuery.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        'Prueba con otro término de búsqueda',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Colors.grey[500],
                            ),
                      ),
                    ),
                ],
              ),
            ),
          )
        else
          // ListView
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              itemCount: _filteredList.length,
              itemBuilder: (context, index) {
                final pokemon = _filteredList[index];
                final originalIndex = _getOriginalIndex(pokemon);

                return Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: AppCard.fromProperties(
                    pokemonName: pokemon.name,
                    pokemonNumber: pokemon.number,
                    primaryType: pokemon.primaryType,
                    secondaryType: pokemon.secondaryType,
                    imagePath: pokemon.imagePath,
                    backgroundColor: pokemon.backgroundColor,
                    isFavorite: pokemon.isFavorite,
                    onFavoriteChanged: (isFav) {
                      setState(() {
                        pokemon.isFavorite = isFav;
                      });
                      widget.onFavoriteChanged(originalIndex, isFav);
                    },
                    size: widget.uiModel.cardSize,
                    style: CardStyle.elevated,
                  ),
                );
              },
            ),
          ),
      ],
    );
  }
}
