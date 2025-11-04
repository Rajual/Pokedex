import 'package:http/http.dart' as http;
import '../models/pokemon_detail/pokemon_detail_dto.dart';
import 'base_pokeapi_gateway.dart';

/// Gateway específico para el endpoint de detalle de Pokémon
/// 
/// Endpoint: GET https://pokeapi.co/api/v2/pokemon/{id or name}
/// 
/// Responsabilidades:
/// - Obtener información detallada de un Pokémon específico
/// - Soportar búsqueda por nombre o ID
class PokemonDetailGateway extends BasePokeApiGateway {
  PokemonDetailGateway({
    http.Client? client,
    super.baseUrl,
  }) : super(client: client);

  /// Obtiene el detalle completo de un Pokémon por nombre o ID
  /// 
  /// [nameOrId] - Nombre o ID del Pokémon
  ///   - Por nombre: "bulbasaur", "pikachu", etc.
  ///   - Por ID: "1", "25", etc.
  /// 
  /// Ejemplo:
  /// ```dart
  /// final gateway = PokemonDetailGateway();
  /// 
  /// // Por nombre
  /// final bulbasaur = await gateway.getPokemonDetail('bulbasaur');
  /// 
  /// // Por ID
  /// final pikachu = await gateway.getPokemonDetail('25');
  /// ```
  /// 
  /// Throws [PokeApiException] si:
  /// - El Pokémon no existe (404)
  /// - Hay un error de red
  /// - La respuesta es inválida
  Future<PokemonDetailDto> getPokemonDetail(String nameOrId) async {
    return get<PokemonDetailDto>(
      endpoint: '/pokemon/$nameOrId',
      fromJson: PokemonDetailDto.fromJson,
      errorMessage: 'Error al obtener detalle del Pokémon',
    );
  }
}
