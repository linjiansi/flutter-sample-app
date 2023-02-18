import 'package:flutter/material.dart';
import 'package:flutter_sample_app/entity/pokemon_list_entity.dart';
import 'package:flutter_sample_app/repository/pokemon_repository.dart';
import 'package:flutter_sample_app/util/data_state.dart';

class PokemonNotifier extends ChangeNotifier {
  int? totalCount;
  final repository = PokemonRepository();
  final _limit = 20;
  List<PokemonEntity> _pokemons = [];
  int _offset = 0;
  DataState _state = DataState.uninitialized;

  bool get _didLastLoad => _offset >= (totalCount ?? 0);
  List<PokemonEntity> get pokemons => _pokemons;
  DataState get state => _state;

  PokemonEntity? byId(int id) => _pokemons[id];

  void fetchPokemons({bool isRefresh = false}) async {
    _setupState(isRefresh);

    try {
      if (_didLastLoad && _state != DataState.initialFetching) {
        _state = DataState.noMoreData;
      } else {
        PokemonListEntity pokemonList =
            await repository.fetchPokemons(offset: _offset, limit: _limit);
        List<PokemonEntity> pokemons = pokemonList.items;
        _pokemons += pokemons;
        _offset += pokemons.length;
        _state = DataState.fetched;
        totalCount ??= pokemonList.totalCount;
      }
      notifyListeners();
    } catch (e) {
      _state = DataState.error;
      notifyListeners();
    }
  }

  _setupState(bool isRefresh) {
    if (!isRefresh) {
      _state = (_state == DataState.uninitialized)
          ? DataState.initialFetching
          : DataState.moreFetching;
    } else {
      _pokemons.clear();
      _offset = 0;
      _state = DataState.refreshing;
    }
    notifyListeners();
  }
}
