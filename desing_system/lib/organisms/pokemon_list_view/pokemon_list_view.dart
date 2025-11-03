import 'package:flutter/material.dart';
import '../../molecules/app_card/app_card.dart';
import '../../molecules/app_card/card_enums.dart';
import '../../molecules/app_type_tag/app_type_tag.dart';
import '../../molecules/search_bar/search_bar.dart' show CustomSearchBar;

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
  /// Lista de Pokémon a mostrar
  final List<Pokemon> pokemonList;

  /// Callback cuando cambia el favorito
  final Function(int index, bool isFavorite) onFavoriteChanged;

  /// Callback cuando cambia la búsqueda
  final Function(String query)? onSearchChanged;

  /// Placeholder de búsqueda
  final String searchPlaceholder;

  /// Tamaño del card
  final CardSize cardSize;

  /// Mostrar SearchBar
  final bool showSearchBar;

  /// Si está filtrando
  final bool isSearching;

  const PokemonListView({
    required this.pokemonList,
    required this.onFavoriteChanged,
    this.onSearchChanged,
    this.searchPlaceholder = 'Procurar Pokémon...',
    this.cardSize = CardSize.medium,
    this.showSearchBar = true,
    this.isSearching = false,
    super.key,
  });

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
        if (widget.showSearchBar)
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: CustomSearchBar(
              hintText: widget.searchPlaceholder,
              onChanged: _filterList,
              showClearIcon: true,
              showSearchIcon: true,
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
                  child: AppCard(
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
                    size: widget.cardSize,
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
