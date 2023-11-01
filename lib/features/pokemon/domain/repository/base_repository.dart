import 'package:dartz/dartz.dart';
import 'package:flutter_pagination_bloc_test/core/errors/network_exceptions.dart';
import 'package:flutter_pagination_bloc_test/features/pokemon/domain/entity/pokemon_entity.dart';
import 'package:flutter_pagination_bloc_test/features/pokemon/domain/params/pokemon_params.dart';

abstract class HomeBaseRepository {
  Future<Either<NetworkExceptions, PokemonList>> getPokemonsPaginated(
      PokemonParams params);
}
