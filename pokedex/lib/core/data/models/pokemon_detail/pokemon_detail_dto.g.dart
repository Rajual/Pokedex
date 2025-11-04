// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_detail_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonDetailDto _$PokemonDetailDtoFromJson(Map<String, dynamic> json) =>
    PokemonDetailDto(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      height: (json['height'] as num).toInt(),
      weight: (json['weight'] as num).toInt(),
      types: (json['types'] as List<dynamic>)
          .map((e) => PokemonTypeSlotDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      stats: (json['stats'] as List<dynamic>)
          .map((e) => PokemonStatDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      sprites: PokemonSpritesDto.fromJson(
        json['sprites'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$PokemonDetailDtoToJson(PokemonDetailDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'height': instance.height,
      'weight': instance.weight,
      'types': instance.types,
      'stats': instance.stats,
      'sprites': instance.sprites,
    };

PokemonTypeSlotDto _$PokemonTypeSlotDtoFromJson(Map<String, dynamic> json) =>
    PokemonTypeSlotDto(
      slot: (json['slot'] as num).toInt(),
      type: PokemonTypeInfoDto.fromJson(json['type'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PokemonTypeSlotDtoToJson(PokemonTypeSlotDto instance) =>
    <String, dynamic>{'slot': instance.slot, 'type': instance.type};

PokemonTypeInfoDto _$PokemonTypeInfoDtoFromJson(Map<String, dynamic> json) =>
    PokemonTypeInfoDto(
      name: json['name'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$PokemonTypeInfoDtoToJson(PokemonTypeInfoDto instance) =>
    <String, dynamic>{'name': instance.name, 'url': instance.url};

PokemonStatDto _$PokemonStatDtoFromJson(Map<String, dynamic> json) =>
    PokemonStatDto(
      baseStat: (json['base_stat'] as num).toInt(),
      effort: (json['effort'] as num).toInt(),
      stat: PokemonStatInfoDto.fromJson(json['stat'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PokemonStatDtoToJson(PokemonStatDto instance) =>
    <String, dynamic>{
      'base_stat': instance.baseStat,
      'effort': instance.effort,
      'stat': instance.stat,
    };

PokemonStatInfoDto _$PokemonStatInfoDtoFromJson(Map<String, dynamic> json) =>
    PokemonStatInfoDto(
      name: json['name'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$PokemonStatInfoDtoToJson(PokemonStatInfoDto instance) =>
    <String, dynamic>{'name': instance.name, 'url': instance.url};

PokemonSpritesDto _$PokemonSpritesDtoFromJson(Map<String, dynamic> json) =>
    PokemonSpritesDto(
      frontDefault: json['front_default'] as String?,
      other: json['other'] == null
          ? null
          : PokemonOtherSpritesDto.fromJson(
              json['other'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$PokemonSpritesDtoToJson(PokemonSpritesDto instance) =>
    <String, dynamic>{
      'front_default': instance.frontDefault,
      'other': instance.other,
    };

PokemonOtherSpritesDto _$PokemonOtherSpritesDtoFromJson(
  Map<String, dynamic> json,
) => PokemonOtherSpritesDto(
  officialArtwork: json['official-artwork'] == null
      ? null
      : PokemonArtworkDto.fromJson(
          json['official-artwork'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$PokemonOtherSpritesDtoToJson(
  PokemonOtherSpritesDto instance,
) => <String, dynamic>{'official-artwork': instance.officialArtwork};

PokemonArtworkDto _$PokemonArtworkDtoFromJson(Map<String, dynamic> json) =>
    PokemonArtworkDto(frontDefault: json['front_default'] as String?);

Map<String, dynamic> _$PokemonArtworkDtoToJson(PokemonArtworkDto instance) =>
    <String, dynamic>{'front_default': instance.frontDefault};
