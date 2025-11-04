import 'package:http/http.dart' as http;
import '../models/pokemon_list_response/pokemon_list_response_dto.dart';
import 'base_pokeapi_gateway.dart';

/// Gateway específico para el endpoint de lista de Pokémons
/// 
/// Endpoint: GET https://pokeapi.co/api/v2/pokemon
/// 
/// Responsabilidades:
/// - Obtener lista paginada de Pokémons
/// - Manejo de parámetros de paginación (limit, offset)
class PokemonListGateway extends BasePokeApiGateway {
  PokemonListGateway({
    http.Client? client,
    super.baseUrl,
  }) : super(client: client);

  /// Obtiene una lista paginada de Pokémons
  /// 
  /// [limit] - Cantidad de resultados a retornar (default: 20, max: 100)
  /// [offset] - Desplazamiento para paginación (default: 0)
  /// 
  /// Ejemplo:
  /// ```dart
  /// final gateway = PokemonListGateway();
  /// final response = await gateway.getPokemonList(limit: 20, offset: 0);
  /// print('Total: ${response.count}');
  /// ```
  /// 
  /// Throws [PokeApiException] si hay un error en la petición
  Future<PokemonListResponseDto> getPokemonList({
    int limit = 20,
    int offset = 0,
  }) async {
    return get<PokemonListResponseDto>(
      endpoint: '/pokemon',
      queryParameters: {
        'limit': limit.toString(),
        'offset': offset.toString(),
      },
      fromJson: PokemonListResponseDto.fromJson,
      errorMessage: 'Error al obtener lista de Pokémons',
    );
  }
}
