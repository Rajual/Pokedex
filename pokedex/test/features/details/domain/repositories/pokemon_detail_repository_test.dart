import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pokedex/core/common/result.dart';
import 'package:pokedex/features/details/domain/entities/pokemon_detail_entity.dart';
import 'package:pokedex/features/details/domain/repositories/pokemon_detail_repository.dart';

// Mock class for PokemonDetailRepository
class MockPokemonDetailRepository extends Mock implements PokemonDetailRepository {}

void main() {
  late MockPokemonDetailRepository mockRepository;

  setUp(() {
    mockRepository = MockPokemonDetailRepository();
  });

  group('PokemonDetailRepository', () {
    test('should load Pokemon detail data successfully', () async {
      // Arrange
      const pokemonId = '1';
      const expectedEntity = PokemonDetailEntity(
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

      when(mockRepository.loadPokemonDetail(pokemonId))
          .thenAnswer((_) async => Result.success(expectedEntity));

      // Act
      final result = await mockRepository.loadPokemonDetail(pokemonId);

      // Assert
      expect(result.isSuccess, true);
      expect(result.success, expectedEntity);
      verify(mockRepository.loadPokemonDetail(pokemonId)).called(1);
    });

    test('should return failure when Pokemon not found', () async {
      // Arrange
      const pokemonId = '999';
      final failure = PokemonDetailFailure.notFound(pokemonId);

      when(mockRepository.loadPokemonDetail(pokemonId))
          .thenAnswer((_) async => Result.failure(failure));

      // Act
      final result = await mockRepository.loadPokemonDetail(pokemonId);

      // Assert
      expect(result.isFailure, true);
      expect(result.failure, failure);
      verify(mockRepository.loadPokemonDetail(pokemonId)).called(1);
    });

    test('should toggle favorite status successfully', () async {
      // Arrange
      const pokemonId = '1';

      when(mockRepository.toggleFavorite(pokemonId))
          .thenAnswer((_) async => Result.success(true));

      // Act
      final result = await mockRepository.toggleFavorite(pokemonId);

      // Assert
      expect(result.isSuccess, true);
      expect(result.success, true);
      verify(mockRepository.toggleFavorite(pokemonId)).called(1);
    });

    test('should check if Pokemon is favorite', () async {
      // Arrange
      const pokemonId = '1';
      const isFavorite = true;

      when(mockRepository.isFavorite(pokemonId))
          .thenAnswer((_) async => Result.success(isFavorite));

      // Act
      final result = await mockRepository.isFavorite(pokemonId);

      // Assert
      expect(result.isSuccess, true);
      expect(result.success, isFavorite);
      verify(mockRepository.isFavorite(pokemonId)).called(1);
    });

    test('should handle network errors', () async {
      // Arrange
      const pokemonId = '1';
      final failure = PokemonDetailFailure.localizationError('Connection failed');

      when(mockRepository.loadPokemonDetail(pokemonId))
          .thenAnswer((_) async => Result.failure(failure));

      // Act
      final result = await mockRepository.loadPokemonDetail(pokemonId);

      // Assert
      expect(result.isFailure, true);
      expect(result.failure, failure);
    });
  });
}