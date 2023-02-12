import 'package:flutter/material.dart';
import 'package:flutter_sample_app/entity/pokemon_list_entity.dart';
import 'package:flutter_sample_app/notifier/pokemon_notifier.dart';
import 'package:flutter_sample_app/widget/pokemon/pokemon_detail.dart';
import 'package:provider/provider.dart';

class PokemonListView extends StatelessWidget {
  const PokemonListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PokemonNotifier>(
        builder: (context, pokemon, child) => ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
              itemCount: 20,
              itemBuilder: (context, index) {
                if (pokemon.pokemons.isEmpty) {
                  pokemon.fetchPokemons();
                  return PokemonListItem(pokemon: pokemon.byId(index + 1));
                } else {
                  return PokemonListItem(pokemon: pokemon.byId(index + 1));
                }
              },
            ));
  }
}

class PokemonListItem extends StatelessWidget {
  final PokemonEntity? pokemon;

  const PokemonListItem({Key? key, required this.pokemon}) : super(key: key);

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
          Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const PokemonDetailView()))
        },
      );
    } else {
      return const ListTile(title: Text('...'));
    }
  }
}
