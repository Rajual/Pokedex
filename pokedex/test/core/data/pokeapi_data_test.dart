import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/core/data/exports.dart';
import 'package:desing_system/molecules/app_type_tag/app_type_tag.dart';

void main() {
  group('PokeAPI Data Layer Tests', () {
    test('PokemonListResponseDto deserializes correctly', () {
      final json = {
        'count': 1302,
        'next': 'https://pokeapi.co/api/v2/pokemon?offset=20&limit=20',
        'previous': null,
        'results': [
          {
            'name': 'bulbasaur',
            'url': 'https://pokeapi.co/api/v2/pokemon/1/',
          },
          {
            'name': 'ivysaur',
            'url': 'https://pokeapi.co/api/v2/pokemon/2/',
          },
        ],
      };

      final response = PokemonListResponseDto.fromJson(json);

      expect(response.count, 1302);
      expect(response.next, 'https://pokeapi.co/api/v2/pokemon?offset=20&limit=20');
      expect(response.previous, null);
      expect(response.results.length, 2);
      expect(response.results[0].name, 'bulbasaur');
      expect(response.results[0].id, 1);
      expect(response.results[1].name, 'ivysaur');
      expect(response.results[1].id, 2);
    });

    test('PokemonDetailDto deserializes correctly', () {
      final json = {
        'id': 1,
        'name': 'bulbasaur',
        'height': 7,
        'weight': 69,
        'types': [
          {
            'slot': 1,
            'type': {
              'name': 'grass',
              'url': 'https://pokeapi.co/api/v2/type/12/',
            },
          },
          {
            'slot': 2,
            'type': {
              'name': 'poison',
              'url': 'https://pokeapi.co/api/v2/type/4/',
            },
          },
        ],
        'stats': [
          {
            'base_stat': 45,
            'effort': 0,
            'stat': {
              'name': 'hp',
              'url': 'https://pokeapi.co/api/v2/stat/1/',
            },
          },
          {
            'base_stat': 49,
            'effort': 0,
            'stat': {
              'name': 'attack',
              'url': 'https://pokeapi.co/api/v2/stat/2/',
            },
          },
          {
            'base_stat': 49,
            'effort': 0,
            'stat': {
              'name': 'defense',
              'url': 'https://pokeapi.co/api/v2/stat/3/',
            },
          },
          {
            'base_stat': 65,
            'effort': 1,
            'stat': {
              'name': 'special-attack',
              'url': 'https://pokeapi.co/api/v2/stat/4/',
            },
          },
          {
            'base_stat': 65,
            'effort': 0,
            'stat': {
              'name': 'special-defense',
              'url': 'https://pokeapi.co/api/v2/stat/5/',
            },
          },
          {
            'base_stat': 45,
            'effort': 0,
            'stat': {
              'name': 'speed',
              'url': 'https://pokeapi.co/api/v2/stat/6/',
            },
          },
        ],
        'sprites': {
          'front_default': 'https://example.com/sprites/1.png',
          'other': {
            'official-artwork': {
              'front_default': 'https://example.com/artwork/1.png',
            },
          },
        },
      };

      final pokemon = PokemonDetailDto.fromJson(json);

      expect(pokemon.id, 1);
      expect(pokemon.name, 'bulbasaur');
      expect(pokemon.height, 7);
      expect(pokemon.weight, 69);
      expect(pokemon.types.length, 2);
      expect(pokemon.types[0].type.name, 'grass');
      expect(pokemon.types[1].type.name, 'poison');
      expect(pokemon.stats.length, 6);
      expect(pokemon.stats[0].baseStat, 45);
      expect(pokemon.sprites.frontDefault, 'https://example.com/sprites/1.png');
      expect(pokemon.sprites.other?.officialArtwork?.frontDefault, 
          'https://example.com/artwork/1.png');
    });

    test('PokemonMapper maps types correctly', () {
      // Test basic type mapping
      expect(PokemonType.water.label, 'Agua');
      expect(PokemonType.fire.label, 'Fuego');
      expect(PokemonType.grass.label, 'Planta');
      expect(PokemonType.electric.label, 'Eléctrico');
      expect(PokemonType.poison.label, 'Veneno');
      expect(PokemonType.normal.label, 'Normal');
    });

    test('PokemonDetailDto basic properties work correctly', () {
      final json = {
        'id': 1,
        'name': 'bulbasaur',
        'height': 7,
        'weight': 69,
        'types': [
          {
            'slot': 1,
            'type': {
              'name': 'grass',
              'url': 'https://pokeapi.co/api/v2/type/12/',
            },
          },
          {
            'slot': 2,
            'type': {
              'name': 'poison',
              'url': 'https://pokeapi.co/api/v2/type/4/',
            },
          },
        ],
        'stats': [
          {
            'base_stat': 45,
            'effort': 0,
            'stat': {
              'name': 'hp',
              'url': 'https://pokeapi.co/api/v2/stat/1/',
            },
          },
          {
            'base_stat': 49,
            'effort': 0,
            'stat': {
              'name': 'attack',
              'url': 'https://pokeapi.co/api/v2/stat/2/',
            },
          },
          {
            'base_stat': 49,
            'effort': 0,
            'stat': {
              'name': 'defense',
              'url': 'https://pokeapi.co/api/v2/stat/3/',
            },
          },
          {
            'base_stat': 65,
            'effort': 1,
            'stat': {
              'name': 'special-attack',
              'url': 'https://pokeapi.co/api/v2/stat/4/',
            },
          },
          {
            'base_stat': 65,
            'effort': 0,
            'stat': {
              'name': 'special-defense',
              'url': 'https://pokeapi.co/api/v2/stat/5/',
            },
          },
          {
            'base_stat': 45,
            'effort': 0,
            'stat': {
              'name': 'speed',
              'url': 'https://pokeapi.co/api/v2/stat/6/',
            },
          },
        ],
        'sprites': {
          'front_default': 'https://example.com/sprites/1.png',
          'other': {
            'official-artwork': {
              'front_default': 'https://example.com/artwork/1.png',
            },
          },
        },
      };

      final pokemon = PokemonDetailDto.fromJson(json);

      // Test basic properties
      expect(pokemon.id, 1);
      expect(pokemon.name, 'bulbasaur');
      expect(pokemon.height, 7);
      expect(pokemon.weight, 69);

      // Test sprites
      expect(pokemon.sprites.frontDefault, 'https://example.com/sprites/1.png');
      expect(
        pokemon.sprites.other?.officialArtwork?.frontDefault,
        'https://example.com/artwork/1.png',
      );

      // Test types
      expect(pokemon.types.length, 2);
      expect(pokemon.types[0].type.name, 'grass');
      expect(pokemon.types[1].type.name, 'poison');

      // Test stats
      expect(pokemon.stats.length, 6);
      expect(pokemon.stats[0].baseStat, 45); // HP
      expect(pokemon.stats[1].baseStat, 49); // Attack
      expect(pokemon.stats[2].baseStat, 49); // Defense
      expect(pokemon.stats[3].baseStat, 65); // Special Attack
      expect(pokemon.stats[4].baseStat, 65); // Special Defense
      expect(pokemon.stats[5].baseStat, 45); // Speed
    });

    test('PokeApiException creates correctly', () {
      final exception = PokeApiException('Test error', statusCode: 404);
      
      expect(exception.message, 'Test error');
      expect(exception.statusCode, 404);
      expect(exception.toString(), 'PokeApiException: Test error');
    });
  });
}
