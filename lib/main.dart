import 'package:flutter/material.dart';
import 'package:flutter_sample_app/pokemon_detail.dart';

void main() {
  runApp(const PokemonApp());
}

class PokemonApp extends StatelessWidget {
  const PokemonApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: TopPage(),
    );
  }
}

class TopPage extends StatelessWidget {
  const TopPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Text('detail'),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const PokemonDetailView())
            );
          },
        )
      ),
    );
  }
}

