import 'package:flutter_sample_app/data/api/response/pokemon_list_response.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: "https://pokeapi.co/api/v2")
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET("/pokemon")
  Future<PokemonListResponse> fetchPokemons(
    @Query("offset") int offset,
    @Query("limit") int limit,
  );
}
