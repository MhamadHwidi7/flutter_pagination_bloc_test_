import 'package:freezed_annotation/freezed_annotation.dart';
part 'pokemons_evolution_entity.g.dart';

@JsonSerializable()
class PokemonEvolutionEntity {
  @JsonKey(name: 'url')
  final String pokemonUrl;

  PokemonEvolutionEntity({required this.pokemonUrl});
  factory PokemonEvolutionEntity.fromJson(Map<String, dynamic> json) =>
      _$PokemonEvolutionEntityFromJson(json);
  Map<String, dynamic> toJson() => _$PokemonEvolutionEntityToJson(this);
}

@JsonSerializable()
class PokemonEvolutionListEntity {
  @JsonKey(name: 'results')
  final List<PokemonEvolutionEntity> pokemons;
  @JsonKey(name: 'next', fromJson: _fromJson)
  final bool canLoadMore;

  PokemonEvolutionListEntity(
      {required this.pokemons, required this.canLoadMore});
  factory PokemonEvolutionListEntity.fromJson(
      Map<String, dynamic> jsonResponse) {
    final canLoadNextPage = jsonResponse['next'] != null;
    final myPokeList = (jsonResponse['results'] as List)
        .map((e) => PokemonEvolutionEntity.fromJson(e))
        .toList();
    return PokemonEvolutionListEntity(
        canLoadMore: canLoadNextPage, pokemons: myPokeList);
  }
  static bool _fromJson(String value) => value == 'true';
}
