import 'package:flutter_sample_app/data/api/response/pokemon_list_response.dart';
import 'package:flutter_sample_app/entity/pokemon_list_entity.dart';
import 'package:flutter_sample_app/mapper/mapper.dart';

class PokemonListMapper extends Mapper<PokemonListEntity, PokemonListResponse> {
  @override
  PokemonListEntity toEntity(PokemonListResponse response) {
    return PokemonListEntity(
        response.results
            .map((item) => PokemonEntity(item.name, item.url))
            .toList(),
        response.count);
  }
}
