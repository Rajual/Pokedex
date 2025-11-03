import 'package:flutter/material.dart';
import 'package:desing_system/desing_system.dart';
import 'package:desing_system/organisms/pokemon_list_view/pokemon_list_view.dart';

class PokemonListDetailScreen extends StatefulWidget {
  const PokemonListDetailScreen({super.key});

  @override
  State<PokemonListDetailScreen> createState() => _PokemonListDetailScreenState();
}

class _PokemonListDetailScreenState extends State<PokemonListDetailScreen> {
  late List<Pokemon> _pokemonList;

  @override
  void initState() {
    super.initState();
    _pokemonList = [
      Pokemon(
        name: 'Pikachu',
        number: 25,
        primaryType: PokemonType.electric,
        types: [PokemonType.electric],
        imagePath: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/25.png',
        backgroundColor: const Color(0xFFF7D02C),
        isFavorite: false,
      ),
      Pokemon(
        name: 'Charmander',
        number: 4,
        primaryType: PokemonType.fire,
        types: [PokemonType.fire],
        imagePath: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/4.png',
        backgroundColor: const Color(0xFFEA5D60),
        isFavorite: true,
      ),
      Pokemon(
        name: 'Squirtle',
        number: 7,
        primaryType: PokemonType.water,
        types: [PokemonType.water],
        imagePath: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/7.png',
        backgroundColor: const Color(0xFF6390F0),
        isFavorite: false,
      ),
      Pokemon(
        name: 'Bulbasaur',
        number: 1,
        primaryType: PokemonType.grass,
        types: [PokemonType.grass, PokemonType.poison],
        imagePath: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png',
        backgroundColor: const Color(0xFF78C850),
        isFavorite: true,
      ),
      Pokemon(
        name: 'Charizard',
        number: 6,
        primaryType: PokemonType.fire,
        types: [PokemonType.fire, PokemonType.flying],
        imagePath: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/6.png',
        backgroundColor: const Color(0xFFEA5D60),
        isFavorite: false,
      ),
      Pokemon(
        name: 'Blastoise',
        number: 9,
        primaryType: PokemonType.water,
        types: [PokemonType.water],
        imagePath: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/9.png',
        backgroundColor: const Color(0xFF6390F0),
        isFavorite: false,
      ),
      Pokemon(
        name: 'Venusaur',
        number: 3,
        primaryType: PokemonType.grass,
        types: [PokemonType.grass, PokemonType.poison],
        imagePath: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/3.png',
        backgroundColor: const Color(0xFF78C850),
        isFavorite: true,
      ),
      Pokemon(
        name: 'Mewtwo',
        number: 150,
        primaryType: PokemonType.psychic,
        types: [PokemonType.psychic],
        imagePath: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/150.png',
        backgroundColor: const Color(0xFFF85888),
        isFavorite: false,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokemon List View'),
        backgroundColor: AppColors.primary,
      ),
      body: Column(
        children: [
          _buildSectionTitle(context, 'Complete Pokemon List View'),
          Expanded(
            child: _buildComponentCard(
              child: PokemonListView(
                pokemonList: _pokemonList,
                onFavoriteChanged: (index, isFavorite) {
                  setState(() {
                    _pokemonList[index].isFavorite = isFavorite;
                  });
                },
                onSearchChanged: (query) {
                  // Handle search query changes if needed
                },
                searchPlaceholder: 'Buscar Pokémon...',
                cardSize: CardSize.medium,
                showSearchBar: true,
              ),
              codeSnippet: '''
PokemonListView(
  pokemonList: pokemonList,
  onFavoriteChanged: (index, isFavorite) {
    setState(() {
      pokemonList[index].isFavorite = isFavorite;
    });
  },
  onSearchChanged: (query) {
    // Handle search query changes
  },
  searchPlaceholder: 'Buscar Pokémon...',
  cardSize: CardSize.medium,
  showSearchBar: true,
)''',
            ),
          ),

          _buildSectionTitle(context, 'Configuration Options'),
          _buildComponentCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Without Search Bar:', style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                SizedBox(
                  height: 200,
                  child: PokemonListView(
                    pokemonList: _pokemonList.take(3).toList(),
                    onFavoriteChanged: (index, isFavorite) {},
                    showSearchBar: false,
                    cardSize: CardSize.small,
                  ),
                ),
                const SizedBox(height: 16),
                const Text('Different Card Sizes:', style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 120,
                            child: PokemonListView(
                              pokemonList: _pokemonList.take(1).toList(),
                              onFavoriteChanged: (index, isFavorite) {},
                              showSearchBar: false,
                              cardSize: CardSize.small,
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Text('Small', style: TextStyle(fontSize: 12)),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 120,
                            child: PokemonListView(
                              pokemonList: _pokemonList.skip(1).take(1).toList(),
                              onFavoriteChanged: (index, isFavorite) {},
                              showSearchBar: false,
                              cardSize: CardSize.medium,
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Text('Medium', style: TextStyle(fontSize: 12)),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            codeSnippet: '''
// Without search bar
PokemonListView(
  pokemonList: pokemonList,
  onFavoriteChanged: (index, isFavorite) {},
  showSearchBar: false,
)

// Different card sizes
PokemonListView(
  pokemonList: pokemonList,
  onFavoriteChanged: (index, isFavorite) {},
  cardSize: CardSize.small,  // small, medium, large
)

// Custom search placeholder
PokemonListView(
  pokemonList: pokemonList,
  onFavoriteChanged: (index, isFavorite) {},
  searchPlaceholder: 'Find Pokemon...',
)''',
          ),

          _buildSectionTitle(context, 'Usage Notes'),
          Card(
            margin: const EdgeInsets.all(16.0),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'PokemonListView Component Notes:',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    '• Combines SearchBar + ListView of AppCards\n'
                    '• Real-time search by name or number\n'
                    '• Favorite toggle functionality\n'
                    '• Configurable card sizes\n'
                    '• Optional search bar\n'
                    '• Empty state handling\n'
                    '• Efficient list rendering\n'
                    '• Supports large Pokemon datasets',
                    style: TextStyle(height: 1.5),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
      ),
    );
  }

  Widget _buildComponentCard({required Widget child, required String codeSnippet}) {
    return Expanded(
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: child),
            ExpansionTile(
              title: const Text('View Code'),
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Text(
                    codeSnippet,
                    style: const TextStyle(
                      fontFamily: 'monospace',
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}