class PokemonListEntity {
  PokemonListEntity(this.items, this.totalCount);

  final List<PokemonEntity> items;
  final int totalCount;
}

class PokemonEntity {
  PokemonEntity(this.name, this.url);

  final String name;
  final String url;

  int get id =>
      int.parse(url.split('/').where((element) => element.isNotEmpty).last);

  String get imageUrlString =>
      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$id.png';
}
