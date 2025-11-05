import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/features/details/domain/entities/pokemon_detail_entity.dart';
import 'package:desing_system/molecules/app_type_tag/app_type_tag.dart';

void main() {
  group('PokemonDetailEntity', () {
    test('should create PokemonDetailEntity with required fields', () {
      const entity = PokemonDetailEntity(
        number: '001',
        name: 'Bulbasaur',
        imageUrl: 'https://example.com/bulbasaur.png',
        types: [PokemonType.grass, PokemonType.poison],
        description: 'A strange seed was planted on its back at birth.',
        weight: '6,9 kg',
        height: '0,7 m',
        category: 'SEED',
        ability: 'Overgrow',
        malePercentage: 87.5,
        femalePercentage: 12.5,
        weaknesses: [PokemonType.fire, PokemonType.flying, PokemonType.psychic],
        primaryColor: Color(0xFF78C850),
      );

      expect(entity.number, '001');
      expect(entity.name, 'Bulbasaur');
      expect(entity.types, [PokemonType.grass, PokemonType.poison]);
      expect(entity.imageUrl, 'https://example.com/bulbasaur.png');
      expect(entity.description, 'A strange seed was planted on its back at birth.');
      expect(entity.weight, '6,9 kg');
      expect(entity.height, '0,7 m');
      expect(entity.category, 'SEED');
      expect(entity.ability, 'Overgrow');
      expect(entity.malePercentage, 87.5);
      expect(entity.femalePercentage, 12.5);
      expect(entity.weaknesses, [PokemonType.fire, PokemonType.flying, PokemonType.psychic]);
      expect(entity.primaryColor, const Color(0xFF78C850));
      expect(entity.isFavorite, false);
    });

    test('should create PokemonDetailEntity with optional fields', () {
      const entity = PokemonDetailEntity(
        number: '025',
        name: 'Pikachu',
        imageUrl: 'https://example.com/pikachu.png',
        types: [PokemonType.electric],
        description: 'When several of these Pokémon gather, their electricity could build and cause lightning storms.',
        weight: '6,0 kg',
        height: '0,4 m',
        category: 'MOUSE',
        ability: 'Static',
        malePercentage: 50.0,
        femalePercentage: 50.0,
        weaknesses: [PokemonType.ground],
        primaryColor: Color(0xFFF8D030),
        isFavorite: true,
      );

      expect(entity.types.length, 1);
      expect(entity.weaknesses, [PokemonType.ground]);
      expect(entity.malePercentage, 50.0);
      expect(entity.femalePercentage, 50.0);
      expect(entity.isFavorite, true);
    });

    test('should support copyWith method', () {
      const original = PokemonDetailEntity(
        number: '001',
        name: 'Bulbasaur',
        imageUrl: 'https://example.com/bulbasaur.png',
        types: [PokemonType.grass, PokemonType.poison],
        description: 'A strange seed was planted on its back at birth.',
        weight: '6,9 kg',
        height: '0,7 m',
        category: 'SEED',
        ability: 'Overgrow',
        malePercentage: 87.5,
        femalePercentage: 12.5,
        weaknesses: [PokemonType.fire, PokemonType.flying, PokemonType.psychic],
        primaryColor: Color(0xFF78C850),
      );

      final copied = original.copyWith(
        name: 'Ivysaur',
        height: '1,0 m',
        weight: '13,0 kg',
      );

      expect(copied.number, '001'); // unchanged
      expect(copied.name, 'Ivysaur'); // changed
      expect(copied.height, '1,0 m'); // changed
      expect(copied.weight, '13,0 kg'); // changed
      expect(copied.types, [PokemonType.grass, PokemonType.poison]); // unchanged
    });

    test('should handle empty weaknesses list', () {
      const entity = PokemonDetailEntity(
        number: '999',
        name: 'Test Pokemon',
        imageUrl: 'https://example.com/test.png',
        types: [PokemonType.normal],
        description: 'Test description',
        weight: '10,0 kg',
        height: '1,0 m',
        category: 'TEST',
        ability: 'Test Ability',
        malePercentage: 50.0,
        femalePercentage: 50.0,
        weaknesses: [],
        primaryColor: Color(0xFFE6E6E6),
      );

      expect(entity.weaknesses, isEmpty);
    });
  });
}