// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_detail_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PokemonDetailDto _$PokemonDetailDtoFromJson(Map<String, dynamic> json) =>
    _PokemonDetailDto(
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

Map<String, dynamic> _$PokemonDetailDtoToJson(_PokemonDetailDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'height': instance.height,
      'weight': instance.weight,
      'types': instance.types,
      'stats': instance.stats,
      'sprites': instance.sprites,
    };

_PokemonTypeSlotDto _$PokemonTypeSlotDtoFromJson(Map<String, dynamic> json) =>
    _PokemonTypeSlotDto(
      slot: (json['slot'] as num).toInt(),
      type: PokemonTypeInfoDto.fromJson(json['type'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PokemonTypeSlotDtoToJson(_PokemonTypeSlotDto instance) =>
    <String, dynamic>{'slot': instance.slot, 'type': instance.type};

_PokemonTypeInfoDto _$PokemonTypeInfoDtoFromJson(Map<String, dynamic> json) =>
    _PokemonTypeInfoDto(
      name: json['name'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$PokemonTypeInfoDtoToJson(_PokemonTypeInfoDto instance) =>
    <String, dynamic>{'name': instance.name, 'url': instance.url};

_PokemonStatDto _$PokemonStatDtoFromJson(Map<String, dynamic> json) =>
    _PokemonStatDto(
      baseStat: (json['base_stat'] as num).toInt(),
      effort: (json['effort'] as num).toInt(),
      stat: PokemonStatInfoDto.fromJson(json['stat'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PokemonStatDtoToJson(_PokemonStatDto instance) =>
    <String, dynamic>{
      'base_stat': instance.baseStat,
      'effort': instance.effort,
      'stat': instance.stat,
    };

_PokemonStatInfoDto _$PokemonStatInfoDtoFromJson(Map<String, dynamic> json) =>
    _PokemonStatInfoDto(
      name: json['name'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$PokemonStatInfoDtoToJson(_PokemonStatInfoDto instance) =>
    <String, dynamic>{'name': instance.name, 'url': instance.url};

_PokemonSpritesDto _$PokemonSpritesDtoFromJson(Map<String, dynamic> json) =>
    _PokemonSpritesDto(
      frontDefault: json['front_default'] as String?,
      other: json['other'] == null
          ? null
          : PokemonOtherSpritesDto.fromJson(
              json['other'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$PokemonSpritesDtoToJson(_PokemonSpritesDto instance) =>
    <String, dynamic>{
      'front_default': instance.frontDefault,
      'other': instance.other,
    };

_PokemonOtherSpritesDto _$PokemonOtherSpritesDtoFromJson(
  Map<String, dynamic> json,
) => _PokemonOtherSpritesDto(
  officialArtwork: json['official-artwork'] == null
      ? null
      : PokemonArtworkDto.fromJson(
          json['official-artwork'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$PokemonOtherSpritesDtoToJson(
  _PokemonOtherSpritesDto instance,
) => <String, dynamic>{'official-artwork': instance.officialArtwork};

_PokemonArtworkDto _$PokemonArtworkDtoFromJson(Map<String, dynamic> json) =>
    _PokemonArtworkDto(frontDefault: json['front_default'] as String?);

Map<String, dynamic> _$PokemonArtworkDtoToJson(_PokemonArtworkDto instance) =>
    <String, dynamic>{'front_default': instance.frontDefault};
