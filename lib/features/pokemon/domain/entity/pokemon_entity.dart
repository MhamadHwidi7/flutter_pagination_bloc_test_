import 'package:json_annotation/json_annotation.dart';

part 'pokemon_entity.g.dart';

@JsonSerializable()
class Pokemon {
  @JsonKey(name: 'name')
  final String pokemonName;
  @JsonKey(name: 'url')
  final String pokemonImage;

  int get id => int.parse(pokemonImage.split('/')[6]);
  String get imageUrl =>
      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png';
  factory Pokemon.fromJson(Map<String, dynamic> json) =>
      _$PokemonFromJson(json);

  Pokemon(this.pokemonName, this.pokemonImage);
  Map<String, dynamic> toJson() => _$PokemonToJson(this);
}

@JsonSerializable()
class PokemonList {
  @JsonKey(name: 'next', fromJson: _fromJson)
  final bool canLoadMore;
  @JsonKey(name: 'result')
  final List<Pokemon> pokemons;

  factory PokemonList.fromJson(Map<String, dynamic> json) {
    ///when the next parameter is not null this means that there are extra pages

    final canLoadNextPage = json['next'] != null;
    final pokemonListings = (json['results'] as List)
        .map((listingJson) => Pokemon.fromJson(listingJson))
        .toList();

    return PokemonList(pokemons: pokemonListings, canLoadMore: canLoadNextPage);
  }

  PokemonList({required this.canLoadMore, required this.pokemons});

  static bool _fromJson(String value) => value == 'true';
}
