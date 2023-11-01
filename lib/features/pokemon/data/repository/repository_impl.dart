import 'package:dartz/dartz.dart';
import 'package:flutter_pagination_bloc_test/core/errors/network_exceptions.dart';
import 'package:flutter_pagination_bloc_test/core/network/network_info.dart';
import 'package:flutter_pagination_bloc_test/features/pokemon/data/data_source/remote_data_source/remote_data_source.dart';
import 'package:flutter_pagination_bloc_test/features/pokemon/domain/entity/pokemon_entity.dart';
import 'package:flutter_pagination_bloc_test/features/pokemon/domain/params/pokemon_params.dart';
import 'package:flutter_pagination_bloc_test/features/pokemon/domain/repository/base_repository.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: HomeBaseRepository)
class HomeRepositoryImpl implements HomeBaseRepository {
  final NetworkInfo _networkInfo;
  final HomeBaseRemoteDataSource _homeBaseRemoteDataSource;

  HomeRepositoryImpl(this._networkInfo, this._homeBaseRemoteDataSource);
  @override
  Future<Either<NetworkExceptions, PokemonList>> getPokemonsPaginated(
      PokemonParams params) async {
    if (await _networkInfo.isConnected) {
      try {
        final response =
            await _homeBaseRemoteDataSource.getPokemonsPaginated(params);
        return Right(response);
      } on Exception catch (exc) {
        return Left(
          NetworkExceptions.getException(exc),
        );
      }
    } else {
      return const Left(NetworkExceptions.noInternetConnection());
    }
  }
}
