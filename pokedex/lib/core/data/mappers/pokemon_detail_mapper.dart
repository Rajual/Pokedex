import 'package:desing_system/molecules/app_type_tag/app_type_tag.dart';
import '../models/domain/pokemon.dart' as domain;
import '../models/pokemon_detail/pokemon_detail_dto.dart';
import 'pokemon_mapper.dart' as mapper;

/// Mapper for PokemonDetailDto to domain models
class PokemonDetailMapper {
  PokemonDetailMapper._();

  /// Maps PokemonDetailDto to Pokemon domain model
  static domain.Pokemon mapToDomain(PokemonDetailDto dto) {
    try {
      final types = _mapTypesToDomain(dto.types);
      final stats = _mapStatsToDomain(dto.stats);
      final sprites = _mapSpritesToDomain(dto.sprites);

      return domain.Pokemon(
        id: dto.id,
        name: _capitalizeFirst(dto.name),
        height: dto.height,
        weight: dto.weight,
        types: types,
        stats: stats,
        sprites: sprites,
        isFavorite: false, // Default value, can be set later
      );
    } catch (e) {
      throw PokemonMapperException(
        'Failed to map PokemonDetailDto to domain model for Pokemon ${dto.id}',
        originalError: e,
      );
    }
  }

  /// Maps list of PokemonTypeSlotDto to list of PokemonType
  static List<PokemonType> _mapTypesToDomain(List<PokemonTypeSlotDto> typeSlots) {
    return typeSlots
        .map((slot) => mapper.PokemonMapper.fromString(slot.type.name))
        .toList();
  }

  /// Maps list of PokemonStatDto to PokemonStats
  static domain.PokemonStats _mapStatsToDomain(List<PokemonStatDto> statDtos) {
    final statsMap = {for (var stat in statDtos) stat.stat.name: stat.baseStat};

    return domain.PokemonStats(
      hp: statsMap['hp'] ?? 0,
      attack: statsMap['attack'] ?? 0,
      defense: statsMap['defense'] ?? 0,
      specialAttack: statsMap['special-attack'] ?? 0,
      specialDefense: statsMap['special-defense'] ?? 0,
      speed: statsMap['speed'] ?? 0,
    );
  }

  /// Maps PokemonSpritesDto to PokemonSprites domain model
  static domain.PokemonSprites _mapSpritesToDomain(PokemonSpritesDto dto) {
    try {
      return domain.PokemonSprites(
        frontDefault: dto.frontDefault,
        officialArtwork: dto.other?.officialArtwork?.frontDefault,
      );
    } catch (e) {
      throw PokemonMapperException(
        'Failed to map PokemonSpritesDto to domain model',
        originalError: e,
      );
    }
  }

  /// Maps a list of PokemonDetailDto to a list of Pokemon domain models
  static List<domain.Pokemon> mapListToDomain(List<PokemonDetailDto> dtos) {
    try {
      return dtos.map((dto) => mapToDomain(dto)).toList();
    } catch (e) {
      throw PokemonMapperException(
        'Failed to map list of PokemonDetailDto to domain models',
        originalError: e,
      );
    }
  }

  /// Capitalizes the first letter of a string
  static String _capitalizeFirst(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1).toLowerCase();
  }

  /// Validates Pokemon data and throws appropriate exceptions
  static void validatePokemonData(PokemonDetailDto dto) {
    if (dto.id <= 0) {
      throw PokemonMapperException('Invalid Pokemon ID: ${dto.id}');
    }

    if (dto.name.trim().isEmpty) {
      throw PokemonMapperException('Pokemon name cannot be empty');
    }

    if (dto.types.isEmpty) {
      throw PokemonMapperException('Pokemon must have at least one type');
    }

    if (dto.stats.isEmpty) {
      throw PokemonMapperException('Pokemon must have stats');
    }
  }
}

/// Extension methods for PokemonDetailDto
extension PokemonDetailDtoMapper on PokemonDetailDto {
  /// Converts DTO to domain model
  domain.Pokemon toDomain() => PokemonDetailMapper.mapToDomain(this);

  /// Converts DTO to domain model with validation
  domain.Pokemon toDomainValidated() {
    PokemonDetailMapper.validatePokemonData(this);
    return PokemonDetailMapper.mapToDomain(this);
  }
}

/// Extension methods for List<PokemonDetailDto>
extension PokemonDetailDtoListMapper on List<PokemonDetailDto> {
  /// Converts list of DTOs to list of domain models
  List<domain.Pokemon> toDomain() => PokemonDetailMapper.mapListToDomain(this);
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