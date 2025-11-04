import 'package:flutter/material.dart';
import 'package:desing_system/desing_system.dart';

/// Pantalla de demostración del PokemonDetailTemplate
class PokemonDetailTemplateScreen extends StatefulWidget {
  const PokemonDetailTemplateScreen({super.key});

  @override
  State<PokemonDetailTemplateScreen> createState() =>
      _PokemonDetailTemplateScreenState();
}

class _PokemonDetailTemplateScreenState
    extends State<PokemonDetailTemplateScreen> {
  int _selectedExample = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokemon Detail Template'),
      ),
      body: Column(
        children: [
          // Selector de ejemplos
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.grey[200],
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Ejemplos (${_selectedExample + 1}/4)',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: _selectedExample > 0
                      ? () => setState(() => _selectedExample--)
                      : null,
                ),
                IconButton(
                  icon: const Icon(Icons.arrow_forward),
                  onPressed: _selectedExample < 3
                      ? () => setState(() => _selectedExample++)
                      : null,
                ),
              ],
            ),
          ),
          // Preview del ejemplo
          Expanded(
            child: _buildExample(_selectedExample),
          ),
        ],
      ),
    );
  }

  Widget _buildExample(int index) {
    switch (index) {
      case 0:
        return _buildBulbasaur();
      case 1:
        return _buildCharizard();
      case 2:
        return _buildPikachu();
      case 3:
        return _buildGyarados();
      default:
        return const SizedBox();
    }
  }

  Widget _buildBulbasaur() {
    bool isFavorite = false;
    return StatefulBuilder(
      builder: (context, setState) {
        return PokemonDetailTemplate(
          uiModel: PokemonDetailTemplateUiModel(
            number: '001',
            name: 'Bulbasaur',
            imageUrl:
                'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png',
            types: [PokemonType.grass, PokemonType.poison],
            description:
                'Tiene una semilla de planta en su espalda desde que nace. La semilla crece lentamente.',
            weight: '6,9 kg',
            height: '0,7 m',
            category: 'SEMILLA',
            ability: 'Espesura',
            malePercentage: 87.5,
            femalePercentage: 12.5,
            weaknesses: [
              PokemonType.fire,
              PokemonType.psychic,
              PokemonType.flying,
              PokemonType.ice,
            ],
            primaryColor: const Color(0xFF48D0B0),
            isFavorite: isFavorite,
            onFavoriteToggle: () => setState(() => isFavorite = !isFavorite),
            onBack: () => debugPrint('Back pressed'),
          ),
        );
      },
    );
  }

  Widget _buildCharizard() {
    bool isFavorite = true;
    return StatefulBuilder(
      builder: (context, setState) {
        return PokemonDetailTemplate(
          uiModel: PokemonDetailTemplateUiModel(
            number: '006',
            name: 'Charizard',
            imageUrl:
                'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/6.png',
            types: [PokemonType.fire, PokemonType.flying],
            description:
                'Escupe fuego tan caliente que puede derretir cualquier cosa. Su aliento puede llegar a temperaturas increíblemente altas.',
            weight: '90,5 kg',
            height: '1,7 m',
            category: 'LLAMA',
            ability: 'Mar Llamas',
            malePercentage: 87.5,
            femalePercentage: 12.5,
            weaknesses: [
              PokemonType.water,
              PokemonType.electric,
              PokemonType.rock,
            ],
            primaryColor: const Color(0xFFFB6C6C),
            isFavorite: isFavorite,
            onFavoriteToggle: () => setState(() => isFavorite = !isFavorite),
            onBack: () => debugPrint('Back pressed'),
          ),
        );
      },
    );
  }

  Widget _buildPikachu() {
    bool isFavorite = false;
    return StatefulBuilder(
      builder: (context, setState) {
        return PokemonDetailTemplate(
          uiModel: PokemonDetailTemplateUiModel(
            number: '025',
            name: 'Pikachu',
            imageUrl:
                'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/25.png',
            types: [PokemonType.electric],
            description:
                'Cuando varios de estos Pokémon se reúnen, su electricidad puede causar tormentas de rayos.',
            weight: '6,0 kg',
            height: '0,4 m',
            category: 'RATÓN',
            ability: 'Electricidad Estática',
            malePercentage: 50.0,
            femalePercentage: 50.0,
            weaknesses: [PokemonType.ground],
            primaryColor: const Color(0xFFFFCE4B),
            isFavorite: isFavorite,
            onFavoriteToggle: () => setState(() => isFavorite = !isFavorite),
            onBack: () => debugPrint('Back pressed'),
          ),
        );
      },
    );
  }

  Widget _buildGyarados() {
    bool isFavorite = true;
    return StatefulBuilder(
      builder: (context, setState) {
        return PokemonDetailTemplate(
          uiModel: PokemonDetailTemplateUiModel(
            number: '130',
            name: 'Gyarados',
            imageUrl:
                'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/130.png',
            types: [PokemonType.water, PokemonType.flying],
            description:
                'Es extremadamente violento y destructivo. En las ciudades costeras viven aterrorizados por sus ataques.',
            weight: '235,0 kg',
            height: '6,5 m',
            category: 'ATROCIDAD',
            ability: 'Intimidación',
            malePercentage: 50.0,
            femalePercentage: 50.0,
            weaknesses: [
              PokemonType.electric,
              PokemonType.rock,
            ],
            primaryColor: const Color(0xFF76BCFD),
            isFavorite: isFavorite,
            onFavoriteToggle: () => setState(() => isFavorite = !isFavorite),
            onBack: () => debugPrint('Back pressed'),
          ),
        );
      },
    );
  }
}
