import 'package:flutter/material.dart';
import 'package:flutter_sample_app/entity/pokemon_list_entity.dart';
import 'package:flutter_sample_app/notifier/pokemon_notifier.dart';
import 'package:flutter_sample_app/util/data_state.dart';
import 'package:flutter_sample_app/widget/pokemon/pokemon_detail.dart';
import 'package:provider/provider.dart';

class PokemonListView extends StatelessWidget {
  const PokemonListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PokemonNotifier>(builder: (context, pokemon, child) {
      switch (pokemon.state) {
        case DataState.uninitialized:
          Future(() => pokemon.fetchPokemons());
          return _PokemonListView(pokemon.pokemons, false);
        case DataState.refreshing:
          return _PokemonListView(pokemon.pokemons, true);
        case DataState.initialFetching:
          return const SizedBox();
        case DataState.moreFetching:
          return _PokemonListView(pokemon.pokemons, true);
        case DataState.fetched:
          return _PokemonListView(pokemon.pokemons, false);
        case DataState.noMoreData:
          return _PokemonListView(pokemon.pokemons, false);
        case DataState.error:
          return const SizedBox();
      }
    });
  }
}

class _PokemonListView extends StatelessWidget {
  final List<PokemonEntity> pokemons;
  bool isLoading;
  late BuildContext _buildContext;

  _PokemonListView(this.pokemons, this.isLoading);

  @override
  Widget build(BuildContext context) {
    _buildContext = context;
    return _scrollNotificationWidget();
  }

  Widget _scrollNotificationWidget() {
    return NotificationListener<ScrollNotification>(
      onNotification: _scrollNotification,
      child: RefreshIndicator(
          onRefresh: () async {
            await _onRefresh();
          },
          child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
              itemCount: pokemons.length,
              itemBuilder: (context, index) {
                return _PokemonListItem(pokemon: pokemons[index]);
              })),
    );
  }

  bool _scrollNotification(ScrollNotification scrollInfo) {
    if (!isLoading &&
        scrollInfo.metrics.extentAfter <
            scrollInfo.metrics.viewportDimension * 1.5) {
      isLoading = true;
      Provider.of<PokemonNotifier>(_buildContext, listen: false)
          .fetchPokemons();
    }
    return true;
  }

  _onRefresh() async {
    if (!isLoading) {
      isLoading = true;
      Provider.of<PokemonNotifier>(_buildContext, listen: false)
          .fetchPokemons(isRefresh: true);
    }
  }
}

class _PokemonListItem extends StatelessWidget {
  final PokemonEntity? pokemon;
  const _PokemonListItem({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (pokemon != null) {
      return ListTile(
        leading: Image.network(
          pokemon!.imageUrlString,
          height: 50,
          width: 50,
        ),
        title: Text(pokemon!.name),
        trailing: const Icon(Icons.navigate_next_outlined),
        onTap: () => {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => PokemonDetailView(pokemon: pokemon)))
        },
      );
    } else {
      return const ListTile(title: Text('...'));
    }
  }
}
