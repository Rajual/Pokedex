import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_list_response_dto.freezed.dart';
part 'pokemon_list_response_dto.g.dart';

/// DTO para la respuesta de la lista de Pokémons
/// GET https://pokeapi.co/api/v2/pokemon
@freezed
@JsonSerializable()
class PokemonListResponseDto with _$PokemonListResponseDto {
  const PokemonListResponseDto({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });

  @override
  final int count;
  @override
  final String? next;
  @override
  final String? previous;
  @override
  final List<PokemonListItemDto> results;

  factory PokemonListResponseDto.fromJson(Map<String, dynamic> json) =>
      _$PokemonListResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonListResponseDtoToJson(this);
}

/// DTO para cada item en la lista de Pokémons
@freezed
@JsonSerializable()
class PokemonListItemDto with _$PokemonListItemDto {
  const PokemonListItemDto({
    required this.name,
    required this.url,
  });

  @override
  final String name;
  @override
  final String url;

  /// Extrae el ID del Pokémon desde la URL
  /// URL format: https://pokeapi.co/api/v2/pokemon/25/
  int get id {
    final segments = url.split('/');
    // Remove empty strings and get the last valid segment
    final validSegments = segments.where((s) => s.isNotEmpty).toList();
    return int.parse(validSegments.last);
  }

  factory PokemonListItemDto.fromJson(Map<String, dynamic> json) =>
      _$PokemonListItemDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonListItemDtoToJson(this);
}
