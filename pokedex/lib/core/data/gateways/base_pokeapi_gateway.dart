import 'dart:convert';
import 'package:http/http.dart' as http;

/// Clase base para todos los gateways de PokeAPI
/// 
/// Proporciona funcionalidad común:
/// - Cliente HTTP configurado
/// - URL base de la API
/// - Manejo de errores HTTP
abstract class BasePokeApiGateway {
  final http.Client client;
  final String baseUrl;

  BasePokeApiGateway({
    http.Client? client,
    this.baseUrl = 'https://pokeapi.co/api/v2',
  }) : client = client ?? http.Client();

  /// Realiza una petición GET y deserializa la respuesta
  /// 
  /// [endpoint] - Ruta del endpoint (ej: '/pokemon')
  /// [fromJson] - Función para deserializar el JSON
  /// [errorMessage] - Mensaje de error personalizado
  Future<T> get<T>({
    required String endpoint,
    required T Function(Map<String, dynamic>) fromJson,
    required String errorMessage,
    Map<String, String>? queryParameters,
  }) async {
    try {
      final uri = Uri.parse('$baseUrl$endpoint')
          .replace(queryParameters: queryParameters);

      final response = await client.get(uri);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body) as Map<String, dynamic>;
        return fromJson(json);
      } else if (response.statusCode == 404) {
        throw PokeApiException(
          'Recurso no encontrado: $endpoint',
          statusCode: response.statusCode,
        );
      } else {
        throw PokeApiException(
          '$errorMessage: ${response.statusCode}',
          statusCode: response.statusCode,
        );
      }
    } catch (e) {
      if (e is PokeApiException) rethrow;
      throw PokeApiException('Error de conexión: $e');
    }
  }

  /// Cierra el cliente HTTP
  void dispose() {
    client.close();
  }
}

/// Excepción personalizada para errores de la PokeAPI
class PokeApiException implements Exception {
  final String message;
  final int? statusCode;

  PokeApiException(this.message, {this.statusCode});

  @override
  String toString() => 'PokeApiException: $message';
}
