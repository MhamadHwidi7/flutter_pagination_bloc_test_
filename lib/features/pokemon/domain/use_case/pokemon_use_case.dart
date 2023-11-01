import 'package:dartz/dartz.dart';
import 'package:flutter_pagination_bloc_test/core/errors/network_exceptions.dart';
import 'package:flutter_pagination_bloc_test/features/pokemon/domain/entity/pokemon_entity.dart';
import 'package:flutter_pagination_bloc_test/features/pokemon/domain/params/pokemon_params.dart';
import 'package:flutter_pagination_bloc_test/features/pokemon/domain/repository/base_repository.dart';
import 'package:injectable/injectable.dart';

@Singleton()
class GetPokemonsPaginatedUseCase {
  final HomeBaseRepository _homeBaseRepository;

  GetPokemonsPaginatedUseCase(this._homeBaseRepository);
  Future<Either<NetworkExceptions, PokemonList>> call(
      PokemonParams params) async {
    return await _homeBaseRepository.getPokemonsPaginated(params);
  }
}
