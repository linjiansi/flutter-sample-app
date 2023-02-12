import 'package:flutter_sample_app/data/api/model/pokemon_list_response.dart';
import 'package:flutter_sample_app/entity/pokemon_list_entity.dart';
import 'package:flutter_sample_app/mapper/mapper.dart';

class PokemonListMapper extends Mapper<PokemonListEntity, PokemonListResponse> {

  @override
  PokemonListEntity toEntity(PokemonListResponse response) {
    return PokemonListEntity(
      response.name,
      response.url
    );
  }
}
