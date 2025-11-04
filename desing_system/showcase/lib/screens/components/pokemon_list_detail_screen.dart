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
        imagePath: 'https://picsum.photos/200/200?random=25',
        backgroundColor: const Color(0xFFF7D02C),
        isFavorite: false,
      ),
      Pokemon(
        name: 'Charmander',
        number: 4,
        primaryType: PokemonType.fire,
        types: [PokemonType.fire],
        imagePath: 'https://picsum.photos/200/200?random=4',
        backgroundColor: const Color(0xFFEA5D60),
        isFavorite: true,
      ),
      Pokemon(
        name: 'Squirtle',
        number: 7,
        primaryType: PokemonType.water,
        types: [PokemonType.water],
        imagePath: 'https://picsum.photos/200/200?random=7',
        backgroundColor: const Color(0xFF6390F0),
        isFavorite: false,
      ),
      Pokemon(
        name: 'Bulbasaur',
        number: 1,
        primaryType: PokemonType.grass,
        types: [PokemonType.grass, PokemonType.poison],
        imagePath: 'https://picsum.photos/200/200?random=1',
        backgroundColor: const Color(0xFF78C850),
        isFavorite: true,
      ),
      Pokemon(
        name: 'Charizard',
        number: 6,
        primaryType: PokemonType.fire,
        types: [PokemonType.fire, PokemonType.flying],
        imagePath: 'https://picsum.photos/200/200?random=6',
        backgroundColor: const Color(0xFFEA5D60),
        isFavorite: false,
      ),
      Pokemon(
        name: 'Blastoise',
        number: 9,
        primaryType: PokemonType.water,
        types: [PokemonType.water],
        imagePath: 'https://picsum.photos/200/200?random=9',
        backgroundColor: const Color(0xFF6390F0),
        isFavorite: false,
      ),
      Pokemon(
        name: 'Venusaur',
        number: 3,
        primaryType: PokemonType.grass,
        types: [PokemonType.grass, PokemonType.poison],
        imagePath: 'https://picsum.photos/200/200?random=3',
        backgroundColor: const Color(0xFF78C850),
        isFavorite: true,
      ),
      Pokemon(
        name: 'Mewtwo',
        number: 150,
        primaryType: PokemonType.psychic,
        types: [PokemonType.psychic],
        imagePath: 'https://picsum.photos/200/200?random=150',
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle(context, 'Complete Pokemon List View'),
            Container(
              height: 400,
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
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
                      ),
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
                            child: const Text(
                              '''PokemonListView(
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
                              style: TextStyle(
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
              ),
            ),

            _buildSectionTitle(context, 'Configuration Options'),
            Container(
              height: 350,
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Without Search Bar:', style: TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8),
                      Expanded(
                        child: PokemonListView(
                          pokemonList: _pokemonList.take(3).toList(),
                          onFavoriteChanged: (index, isFavorite) {},
                          showSearchBar: false,
                          cardSize: CardSize.small,
                        ),
                      ),
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
                            child: const Text(
                              '''// Without search bar
PokemonListView(
  pokemonList: pokemonList,
  onFavoriteChanged: (index, isFavorite) {},
  showSearchBar: false,
)''',
                              style: TextStyle(
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
              ),
            ),

            _buildSectionTitle(context, 'Different Card Sizes'),
            Container(
              height: 200,
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Expanded(
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
                            Expanded(
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
                      const SizedBox(width: 8),
                      Expanded(
                        child: Column(
                          children: [
                            Expanded(
                              child: PokemonListView(
                                pokemonList: _pokemonList.skip(2).take(1).toList(),
                                onFavoriteChanged: (index, isFavorite) {},
                                showSearchBar: false,
                                cardSize: CardSize.large,
                              ),
                            ),
                            const SizedBox(height: 4),
                            const Text('Large', style: TextStyle(fontSize: 12)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
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
            const SizedBox(height: 20),
          ],
        ),
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
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          child,
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
    );
  }
}