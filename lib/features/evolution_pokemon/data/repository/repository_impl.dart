import 'package:flutter_pagination_bloc_test/core/errors/network_exceptions.dart';
import 'package:flutter_pagination_bloc_test/core/network/network_info.dart';
import 'package:flutter_pagination_bloc_test/features/evolution_pokemon/data/data_source/remote_data_source.dart';
import 'package:flutter_pagination_bloc_test/features/evolution_pokemon/domain/entities/pokemons_evolution_entity.dart';
import 'package:flutter_pagination_bloc_test/features/evolution_pokemon/domain/params/pokemon_evolution_params.dart';
import 'package:flutter_pagination_bloc_test/features/evolution_pokemon/domain/respository/base_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: BasePokemonEvolutionRepository)
class PokemonEvolutionRepositoryImpl implements BasePokemonEvolutionRepository {
  final NetworkInfo _networkInfo;
  final EvolutionPokemonBaseRemoteDataSource _baseRemoteDataSource;

  PokemonEvolutionRepositoryImpl(this._networkInfo, this._baseRemoteDataSource);
  @override
  TaskEither<NetworkExceptions, PokemonEvolutionListEntity>
      getEvolutionPokemonPaginated(PokemonEvolutionParams params) {
    return TaskEither<NetworkExceptions, PokemonEvolutionListEntity>(() async {
      if (await _networkInfo.isConnected) {
        try {
          final result =
              await _baseRemoteDataSource.getEvolutionPokemonPaginated(params);
          return Either.right(result);
        } catch (e) {
          final error = NetworkExceptions.getException(e);
          return Either.left(error);
        }
      } else {
        return Either.left(const NetworkExceptions.noInternetConnection());
      }
    });
  }
}
