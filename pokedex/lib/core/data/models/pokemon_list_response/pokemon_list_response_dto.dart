import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_list_response_dto.freezed.dart';
part 'pokemon_list_response_dto.g.dart';

/// DTO para la respuesta de la lista de Pokémons
/// GET https://pokeapi.co/api/v2/pokemon
@freezed
class PokemonListResponseDto with _$PokemonListResponseDto {
  const factory PokemonListResponseDto({
    required int count,
    String? next,
    String? previous,
    required List<PokemonListItemDto> results,
  }) = _PokemonListResponseDto;

  factory PokemonListResponseDto.fromJson(Map<String, dynamic> json) =>
      _$PokemonListResponseDtoFromJson(json);
}

/// DTO para cada item en la lista de Pokémons
@freezed
class PokemonListItemDto with _$PokemonListItemDto {
  const factory PokemonListItemDto({
    required String name,
    required String url,
  }) = _PokemonListItemDto;

  const PokemonListItemDto._();

  factory PokemonListItemDto.fromJson(Map<String, dynamic> json) =>
      _$PokemonListItemDtoFromJson(json);

  /// Extrae el ID del Pokémon desde la URL
  /// URL format: https://pokeapi.co/api/v2/pokemon/25/
  int get id {
    final segments = url.split('/');
    // Remove empty strings and get the last valid segment
    final validSegments = segments.where((s) => s.isNotEmpty).toList();
    return int.parse(validSegments.last);
  }
}
