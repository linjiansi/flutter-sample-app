class PokemonListEntity {
  final List<PokemonEntity> items;
  PokemonListEntity(this.items);
}

class PokemonEntity {
  final String name;
  final String url;

  PokemonEntity(this.name, this.url);

  int get id => int.parse( url.split('/').last);
}
