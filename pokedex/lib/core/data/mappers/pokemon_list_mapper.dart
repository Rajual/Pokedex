import '../models/domain/pokemon.dart';
import '../models/pokemon_list_response/pokemon_list_response_dto.dart';

/// Mapper for PokemonListResponseDto to domain models
class PokemonListMapper {
  PokemonListMapper._();

  /// Maps PokemonListResponseDto to PokemonListResponse domain model
  static PokemonListResponse mapToDomain(PokemonListResponseDto dto) {
    try {
      final results = dto.results
          .map((item) => _mapListItemToDomain(item))
          .toList();

      return PokemonListResponse(
        count: dto.count,
        next: dto.next,
        previous: dto.previous,
        results: results,
      );
    } catch (e) {
      throw PokemonMapperException(
        'Failed to map PokemonListResponseDto to domain model',
        originalError: e,
      );
    }
  }

  /// Maps PokemonListItemDto to PokemonListItem domain model
  static PokemonListItem _mapListItemToDomain(PokemonListItemDto dto) {
    try {
      return PokemonListItem(
        id: dto.id,
        name: _capitalizeFirst(dto.name),
        url: dto.url,
      );
    } catch (e) {
      throw PokemonMapperException(
        'Failed to map PokemonListItemDto to domain model',
        originalError: e,
      );
    }
  }

  /// Capitalizes the first letter of a string
  static String _capitalizeFirst(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1).toLowerCase();
  }
}

/// Extension methods for PokemonListResponseDto
extension PokemonListResponseDtoMapper on PokemonListResponseDto {
  /// Converts DTO to domain model
  PokemonListResponse toDomain() => PokemonListMapper.mapToDomain(this);
}

/// Extension methods for PokemonListItemDto
extension PokemonListItemDtoMapper on PokemonListItemDto {
  /// Converts DTO to domain model
  PokemonListItem toDomain() => PokemonListMapper._mapListItemToDomain(this);
}

/// Custom exception for mapper errors
class PokemonMapperException implements Exception {
  final String message;
  final Object? originalError;

  PokemonMapperException(this.message, {this.originalError});

  @override
  String toString() {
    if (originalError != null) {
      return 'PokemonMapperException: $message\nOriginal error: $originalError';
    }
    return 'PokemonMapperException: $message';
  }
}