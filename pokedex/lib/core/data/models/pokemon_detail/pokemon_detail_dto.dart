import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_detail_dto.freezed.dart';
part 'pokemon_detail_dto.g.dart';

/// DTO para el detalle completo de un Pokémon
/// GET https://pokeapi.co/api/v2/pokemon/{name}
@freezed
@JsonSerializable()
class PokemonDetailDto with _$PokemonDetailDto {
  const PokemonDetailDto({
    required this.id,
    required this.name,
    required this.height,
    required this.weight,
    required this.types,
    required this.stats,
    required this.sprites,
  });

  @override
  final int id;
  @override
  final String name;
  @override
  final int height;
  @override
  final int weight;
  @override
  final List<PokemonTypeSlotDto> types;
  @override
  final List<PokemonStatDto> stats;
  @override
  final PokemonSpritesDto sprites;

  factory PokemonDetailDto.fromJson(Map<String, dynamic> json) =>
      _$PokemonDetailDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonDetailDtoToJson(this);
}

/// DTO para el slot de tipo de Pokémon
@freezed
@JsonSerializable()
class PokemonTypeSlotDto with _$PokemonTypeSlotDto {
  const PokemonTypeSlotDto({
    required this.slot,
    required this.type,
  });

  @override
  final int slot;
  @override
  final PokemonTypeInfoDto type;

  factory PokemonTypeSlotDto.fromJson(Map<String, dynamic> json) =>
      _$PokemonTypeSlotDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonTypeSlotDtoToJson(this);
}

/// DTO para la información del tipo
@freezed
@JsonSerializable()
class PokemonTypeInfoDto with _$PokemonTypeInfoDto {
  const PokemonTypeInfoDto({
    required this.name,
    required this.url,
  });

  @override
  final String name;
  @override
  final String url;

  factory PokemonTypeInfoDto.fromJson(Map<String, dynamic> json) =>
      _$PokemonTypeInfoDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonTypeInfoDtoToJson(this);
}

/// DTO para las estadísticas del Pokémon
@freezed
@JsonSerializable()
class PokemonStatDto with _$PokemonStatDto {
  const PokemonStatDto({
    @JsonKey(name: 'base_stat') required this.baseStat,
    required this.effort,
    required this.stat,
  });

  @override
  final int baseStat;
  @override
  final int effort;
  @override
  final PokemonStatInfoDto stat;

  factory PokemonStatDto.fromJson(Map<String, dynamic> json) =>
      _$PokemonStatDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonStatDtoToJson(this);
}

/// DTO para la información de la estadística
@freezed
@JsonSerializable()
class PokemonStatInfoDto with _$PokemonStatInfoDto {
  const PokemonStatInfoDto({
    required this.name,
    required this.url,
  });

  @override
  final String name;
  @override
  final String url;

  factory PokemonStatInfoDto.fromJson(Map<String, dynamic> json) =>
      _$PokemonStatInfoDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonStatInfoDtoToJson(this);
}

/// DTO para los sprites del Pokémon
@freezed
@JsonSerializable()
class PokemonSpritesDto with _$PokemonSpritesDto {
  const PokemonSpritesDto({
    @JsonKey(name: 'front_default') this.frontDefault,
    this.other,
  });

  @override
  final String? frontDefault;
  @override
  final PokemonOtherSpritesDto? other;

  factory PokemonSpritesDto.fromJson(Map<String, dynamic> json) =>
      _$PokemonSpritesDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonSpritesDtoToJson(this);
}

/// DTO para sprites adicionales
@freezed
@JsonSerializable()
class PokemonOtherSpritesDto with _$PokemonOtherSpritesDto {
  const PokemonOtherSpritesDto({
    @JsonKey(name: 'official-artwork') this.officialArtwork,
  });

  @override
  final PokemonArtworkDto? officialArtwork;

  factory PokemonOtherSpritesDto.fromJson(Map<String, dynamic> json) =>
      _$PokemonOtherSpritesDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonOtherSpritesDtoToJson(this);
}

/// DTO para el artwork oficial
@freezed
@JsonSerializable()
class PokemonArtworkDto with _$PokemonArtworkDto {
  const PokemonArtworkDto({
    @JsonKey(name: 'front_default') this.frontDefault,
  });

  @override
  final String? frontDefault;

  factory PokemonArtworkDto.fromJson(Map<String, dynamic> json) =>
      _$PokemonArtworkDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonArtworkDtoToJson(this);
}
