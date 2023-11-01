// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemons_evolution_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonEvolutionEntity _$PokemonEvolutionEntityFromJson(
        Map<String, dynamic> json) =>
    PokemonEvolutionEntity(
      pokemonUrl: json['url'] as String,
    );

Map<String, dynamic> _$PokemonEvolutionEntityToJson(
        PokemonEvolutionEntity instance) =>
    <String, dynamic>{
      'url': instance.pokemonUrl,
    };

PokemonEvolutionListEntity _$PokemonEvolutionListEntityFromJson(
        Map<String, dynamic> json) =>
    PokemonEvolutionListEntity(
      pokemons: (json['results'] as List<dynamic>)
          .map(
              (e) => PokemonEvolutionEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      canLoadMore: PokemonEvolutionListEntity._fromJson(json['next'] as String),
    );

Map<String, dynamic> _$PokemonEvolutionListEntityToJson(
        PokemonEvolutionListEntity instance) =>
    <String, dynamic>{
      'results': instance.pokemons,
      'next': instance.canLoadMore,
    };
