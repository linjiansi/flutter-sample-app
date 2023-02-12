class PokemonListEntity {
  final String name;
  final String url;

  PokemonListEntity(this.name, this.url);

  String get id => url.split('/').last;
}
