import 'package:json_annotation/json_annotation.dart';

part 'pokemon_list_response.g.dart';

@JsonSerializable()
class PokemonListResponse {
  final int count;
  final String? next;
  final String? previous;
  final List<Result> results;

  PokemonListResponse(this.count, this.next, this.previous, this.results);

  factory PokemonListResponse.fromJson(Map<String, dynamic> json) =>
      _$PokemonListResponseFromJson(json);
}

@JsonSerializable()
class Result {
  final String name;
  final String url;

  Result(this.name, this.url);

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
}
