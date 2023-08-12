import 'package:flutter_sample_app/entity/pokemon_list_entity.dart';
import 'package:flutter_sample_app/mapper/pokemon_list_mapper.dart';
import 'package:flutter_sample_app/repository/repository.dart';

class PokemonRepository extends Repository {
  Future<PokemonListEntity> fetchPokemons({
    required int offset,
    int limit = 20,
  }) async {
    final response = await apiClient.fetchPokemons(offset, limit);
    return PokemonListMapper().toEntity(response);
  }
}
