import 'package:flutter/material.dart';
import 'package:flutter_sample_app/entity/pokemon_list_entity.dart';
import 'package:flutter_sample_app/repository/pokemon_repository.dart';

class PokemonNotifier extends ChangeNotifier {
  final Map<int, PokemonEntity> _pokemons = {};
  final repository = PokemonRepository();
  final _limit = 20;
  int _offset = 0;

  Map<int, PokemonEntity> get pokemons => _pokemons;

  PokemonEntity? byId(int id) => _pokemons[id];

  void addPokemon(PokemonEntity pokemon) {
    _pokemons[pokemon.id] = pokemon;
    notifyListeners();
  }

  void fetchPokemons() async {
    PokemonListEntity entity;

    try {
      entity = await repository.fetchPokemons(offset: _offset, limit: _limit);
    } catch (e) {
      entity = PokemonListEntity([]);
      notifyListeners();
    }

    _offset += _limit;

    for (var element in entity.items) {
      addPokemon(element);
    }
  }
}
