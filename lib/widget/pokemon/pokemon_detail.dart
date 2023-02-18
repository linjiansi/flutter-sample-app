import 'package:flutter/material.dart';
import 'package:flutter_sample_app/entity/pokemon_list_entity.dart';

class PokemonDetailView extends StatelessWidget {
  final PokemonEntity? pokemon;
  const PokemonDetailView({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
          Stack(
            children: [
              Container(
                padding: const EdgeInsets.all(32),
                child: Image.network(
                  pokemon!.imageUrlString,
                  height: 100,
                  width: 100,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                child: const Text(
                  'No.25',
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
          Text(
            pokemon!.name,
            style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          ),
          Chip(
              label: Text(
                'electric',
                style: TextStyle(
                    color: Colors.yellow.computeLuminance() > 0.5
                        ? Colors.black
                        : Colors.white),
              ),
              backgroundColor: Colors.yellow)
        ])));
  }
}
