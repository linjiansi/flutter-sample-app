class PokemonListEntity {
  final List<PokemonEntity> items;
  final int totalCount;

  PokemonListEntity(this.items, this.totalCount);
}

class PokemonEntity {
  final String name;
  final String url;

  PokemonEntity(this.name, this.url);

  int get id =>
      int.parse(url.split('/').where((element) => element.isNotEmpty).last);

  String get imageUrlString =>
      "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$id.png";
}