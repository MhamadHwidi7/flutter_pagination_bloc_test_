// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pokemon _$PokemonFromJson(Map<String, dynamic> json) => Pokemon(
      json['name'] as String,
      json['url'] as String,
    );

Map<String, dynamic> _$PokemonToJson(Pokemon instance) => <String, dynamic>{
      'name': instance.pokemonName,
      'url': instance.pokemonImage,
    };

PokemonList _$PokemonListFromJson(Map<String, dynamic> json) => PokemonList(
      canLoadMore: PokemonList._fromJson(json['next'] as String),
      pokemons: (json['result'] as List<dynamic>)
          .map((e) => Pokemon.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PokemonListToJson(PokemonList instance) =>
    <String, dynamic>{
      'next': instance.canLoadMore,
      'result': instance.pokemons,
    };
