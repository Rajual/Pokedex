import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/core/data/mappers/pokemon_list_mapper.dart';
import 'package:pokedex/core/data/models/pokemon_list_response/pokemon_list_response_dto.dart';

void main() {
  group('PokemonListMapper', () {
    test('should map PokemonListResponseDto to PokemonListResponse correctly', () {
      // Arrange
      final dto = PokemonListResponseDto(
        count: 2,
        next: 'https://pokeapi.co/api/v2/pokemon?offset=20&limit=20',
        previous: null,
        results: [
          PokemonListItemDto(name: 'bulbasaur', url: 'https://pokeapi.co/api/v2/pokemon/1/'),
          PokemonListItemDto(name: 'ivysaur', url: 'https://pokeapi.co/api/v2/pokemon/2/'),
        ],
      );

      // Act
      final result = PokemonListMapper.mapToDomain(dto);

      // Assert
      expect(result.count, 2);
      expect(result.next, 'https://pokeapi.co/api/v2/pokemon?offset=20&limit=20');
      expect(result.previous, null);
      expect(result.results.length, 2);

      expect(result.results[0].id, 1);
      expect(result.results[0].name, 'Bulbasaur');
      expect(result.results[0].url, 'https://pokeapi.co/api/v2/pokemon/1/');

      expect(result.results[1].id, 2);
      expect(result.results[1].name, 'Ivysaur');
      expect(result.results[1].url, 'https://pokeapi.co/api/v2/pokemon/2/');
    });

    test('should handle empty results list', () {
      // Arrange
      final dto = PokemonListResponseDto(
        count: 0,
        next: null,
        previous: null,
        results: [],
      );

      // Act
      final result = PokemonListMapper.mapToDomain(dto);

      // Assert
      expect(result.count, 0);
      expect(result.results.isEmpty, true);
    });

    test('should capitalize Pokemon names correctly', () {
      // Arrange
      final dto = PokemonListResponseDto(
        count: 1,
        results: [
          PokemonListItemDto(name: 'charizard', url: 'https://pokeapi.co/api/v2/pokemon/6/'),
        ],
      );

      // Act
      final result = PokemonListMapper.mapToDomain(dto);

      // Assert
      expect(result.results[0].name, 'Charizard');
    });

    test('should extract Pokemon ID from URL correctly', () {
      // Arrange
      final dto = PokemonListResponseDto(
        count: 1,
        results: [
          PokemonListItemDto(name: 'pikachu', url: 'https://pokeapi.co/api/v2/pokemon/25/'),
        ],
      );

      // Act
      final result = PokemonListMapper.mapToDomain(dto);

      // Assert
      expect(result.results[0].id, 25);
    });

    test('should throw PokemonMapperException on mapping error', () {
      // Arrange - Create a malformed DTO that would cause an error
      final dto = PokemonListResponseDto(
        count: 1,
        results: [
          PokemonListItemDto(name: '', url: 'invalid-url'),
        ],
      );

      // Act & Assert
      expect(
        () => PokemonListMapper.mapToDomain(dto),
        throwsA(isA<PokemonMapperException>()),
      );
    });
  });

  group('PokemonListResponseDtoMapper extension', () {
    test('should convert DTO to domain model', () {
      // Arrange
      final dto = PokemonListResponseDto(
        count: 1,
        results: [
          PokemonListItemDto(name: 'squirtle', url: 'https://pokeapi.co/api/v2/pokemon/7/'),
        ],
      );

      // Act
      final result = dto.toDomain();

      // Assert
      expect(result.count, 1);
      expect(result.results[0].name, 'Squirtle');
      expect(result.results[0].id, 7);
    });
  });

  group('PokemonListItemDtoMapper extension', () {
    test('should convert DTO to domain model', () {
      // Arrange
      final dto = PokemonListItemDto(
        name: 'wartortle',
        url: 'https://pokeapi.co/api/v2/pokemon/8/',
      );

      // Act
      final result = dto.toDomain();

      // Assert
      expect(result.name, 'Wartortle');
      expect(result.id, 8);
      expect(result.url, 'https://pokeapi.co/api/v2/pokemon/8/');
    });
  });
}