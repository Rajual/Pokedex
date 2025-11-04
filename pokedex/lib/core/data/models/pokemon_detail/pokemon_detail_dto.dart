import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_detail_dto.freezed.dart';
part 'pokemon_detail_dto.g.dart';

/// DTO para el detalle completo de un Pokémon
/// GET https://pokeapi.co/api/v2/pokemon/{name}
@freezed
class PokemonDetailDto with _$PokemonDetailDto {
  const factory PokemonDetailDto({
    required int id,
    required String name,
    required int height,
    required int weight,
    required List<PokemonTypeSlotDto> types,
    required List<PokemonStatDto> stats,
    required PokemonSpritesDto sprites,
  }) = _PokemonDetailDto;

  factory PokemonDetailDto.fromJson(Map<String, dynamic> json) =>
      _$PokemonDetailDtoFromJson(json);
}

/// DTO para el slot de tipo de Pokémon
@freezed
class PokemonTypeSlotDto with _$PokemonTypeSlotDto {
  const factory PokemonTypeSlotDto({
    required int slot,
    required PokemonTypeInfoDto type,
  }) = _PokemonTypeSlotDto;

  factory PokemonTypeSlotDto.fromJson(Map<String, dynamic> json) =>
      _$PokemonTypeSlotDtoFromJson(json);
}

/// DTO para la información del tipo
@freezed
class PokemonTypeInfoDto with _$PokemonTypeInfoDto {
  const factory PokemonTypeInfoDto({
    required String name,
    required String url,
  }) = _PokemonTypeInfoDto;

  factory PokemonTypeInfoDto.fromJson(Map<String, dynamic> json) =>
      _$PokemonTypeInfoDtoFromJson(json);
}

/// DTO para las estadísticas del Pokémon
@freezed
class PokemonStatDto with _$PokemonStatDto {
  const factory PokemonStatDto({
    @JsonKey(name: 'base_stat') required int baseStat,
    required int effort,
    required PokemonStatInfoDto stat,
  }) = _PokemonStatDto;

  factory PokemonStatDto.fromJson(Map<String, dynamic> json) =>
      _$PokemonStatDtoFromJson(json);
}

/// DTO para la información de la estadística
@freezed
class PokemonStatInfoDto with _$PokemonStatInfoDto {
  const factory PokemonStatInfoDto({
    required String name,
    required String url,
  }) = _PokemonStatInfoDto;

  factory PokemonStatInfoDto.fromJson(Map<String, dynamic> json) =>
      _$PokemonStatInfoDtoFromJson(json);
}

/// DTO para los sprites del Pokémon
@freezed
class PokemonSpritesDto with _$PokemonSpritesDto {
  const factory PokemonSpritesDto({
    @JsonKey(name: 'front_default') String? frontDefault,
    PokemonOtherSpritesDto? other,
  }) = _PokemonSpritesDto;

  factory PokemonSpritesDto.fromJson(Map<String, dynamic> json) =>
      _$PokemonSpritesDtoFromJson(json);
}

/// DTO para sprites adicionales
@freezed
class PokemonOtherSpritesDto with _$PokemonOtherSpritesDto {
  const factory PokemonOtherSpritesDto({
    @JsonKey(name: 'official-artwork') PokemonArtworkDto? officialArtwork,
  }) = _PokemonOtherSpritesDto;

  factory PokemonOtherSpritesDto.fromJson(Map<String, dynamic> json) =>
      _$PokemonOtherSpritesDtoFromJson(json);
}

/// DTO para el artwork oficial
@freezed
class PokemonArtworkDto with _$PokemonArtworkDto {
  const factory PokemonArtworkDto({
    @JsonKey(name: 'front_default') String? frontDefault,
  }) = _PokemonArtworkDto;

  factory PokemonArtworkDto.fromJson(Map<String, dynamic> json) =>
      _$PokemonArtworkDtoFromJson(json);
}
