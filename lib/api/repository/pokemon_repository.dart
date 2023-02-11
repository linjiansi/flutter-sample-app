import 'package:flutter_sample_app/api/model/pokemon_list_response.dart';
import 'package:flutter_sample_app/api/repository/repository.dart';

class PokemonRepository extends Repository {
  Future<PokemonListResponse> fetchPokemons({
    required int offset,
    int limit = 20,
  }) async {
    return apiClient.fetchPokemons(offset, limit);
  }
}