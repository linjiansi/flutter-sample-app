import 'package:flutter/material.dart';
import 'package:flutter_sample_app/pokemon_detail.dart';

void main() {
  runApp(const PokemonApp());
}

class PokemonApp extends StatelessWidget {
  const PokemonApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ThemeMode mode = ThemeMode.system;
    return MaterialApp(
      title: 'Pokemon App',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: mode,
      home: const PokemonListPage(),
    );
  }
}

class PokemonListPage extends StatelessWidget {
  const PokemonListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView.builder(
          itemCount: 1000,
          itemBuilder: (_, index) => PokemonListItem(index: index)
          )
      ),
    );
  }
}

class PokemonListItem extends StatelessWidget {
  const PokemonListItem({
    Key? key,
    required this.index
    }) : super(key: key);

  final int index;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(
        "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/25.png",
        height: 50,
        width: 50,
      ),
      title: const Text('pikachu'),
      subtitle: const Text('electric'),
      trailing: const Icon(Icons.navigate_next_outlined),
      onTap: () => {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => const PokemonDetailView())
        )
      },
    );
  }
}

