import 'package:flutter_pagination_bloc_test/core/api/api_consumer.dart';
import 'package:flutter_pagination_bloc_test/core/api/end_points.dart';
import 'package:flutter_pagination_bloc_test/features/evolution_pokemon/domain/entities/pokemons_evolution_entity.dart';
import 'package:flutter_pagination_bloc_test/features/evolution_pokemon/domain/params/pokemon_evolution_params.dart';
import 'package:injectable/injectable.dart';

abstract class EvolutionPokemonBaseRemoteDataSource {
  Future<PokemonEvolutionListEntity> getEvolutionPokemonPaginated(
      PokemonEvolutionParams params);
}

@Singleton(as: EvolutionPokemonBaseRemoteDataSource)
class EvolutionPokemonRemoteDataSourceImpl
    implements EvolutionPokemonBaseRemoteDataSource {
  final ApiConsumer _apiConsumer;

  EvolutionPokemonRemoteDataSourceImpl(this._apiConsumer);
  @override
  Future<PokemonEvolutionListEntity> getEvolutionPokemonPaginated(
      PokemonEvolutionParams params) async {
    final response = await _apiConsumer.get(EndPoints.getEvolutionPokemons,
        queryParameters: params.toJson());
    final pokemonEvolutionList = PokemonEvolutionListEntity.fromJson(response);
    return pokemonEvolutionList;
  }
}
