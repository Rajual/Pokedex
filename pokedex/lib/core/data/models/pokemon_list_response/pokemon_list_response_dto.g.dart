// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_list_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonListResponseDto _$PokemonListResponseDtoFromJson(
  Map<String, dynamic> json,
) => PokemonListResponseDto(
  count: (json['count'] as num).toInt(),
  next: json['next'] as String?,
  previous: json['previous'] as String?,
  results: (json['results'] as List<dynamic>)
      .map((e) => PokemonListItemDto.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$PokemonListResponseDtoToJson(
  PokemonListResponseDto instance,
) => <String, dynamic>{
  'count': instance.count,
  'next': instance.next,
  'previous': instance.previous,
  'results': instance.results,
};

PokemonListItemDto _$PokemonListItemDtoFromJson(Map<String, dynamic> json) =>
    PokemonListItemDto(
      name: json['name'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$PokemonListItemDtoToJson(PokemonListItemDto instance) =>
    <String, dynamic>{'name': instance.name, 'url': instance.url};
