import 'package:flutter_pagination_bloc_test/core/api/api_consumer.dart';
import 'package:flutter_pagination_bloc_test/core/api/end_points.dart';
import 'package:flutter_pagination_bloc_test/features/pokemon/domain/entity/pokemon_entity.dart';
import 'package:flutter_pagination_bloc_test/features/pokemon/domain/params/pokemon_params.dart';
import 'package:injectable/injectable.dart';

abstract class HomeBaseRemoteDataSource {
  Future<PokemonList> getPokemonsPaginated(PokemonParams params);
}

@Singleton(as: HomeBaseRemoteDataSource)
class HomeRemoteDataSource implements HomeBaseRemoteDataSource {
  final ApiConsumer _apiConsumer;

  HomeRemoteDataSource(this._apiConsumer);
  @override
  Future<PokemonList> getPokemonsPaginated(PokemonParams params) async {
    final response = await _apiConsumer.get(
      EndPoints.getPokemons,
      queryParameters: params.toJson(),
    );
    return PokemonList.fromJson(response);
  }
}
