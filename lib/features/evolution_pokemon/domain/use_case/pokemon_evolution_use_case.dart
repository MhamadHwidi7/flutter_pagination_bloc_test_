import 'package:flutter_pagination_bloc_test/core/errors/network_exceptions.dart';
import 'package:flutter_pagination_bloc_test/features/evolution_pokemon/domain/entities/pokemons_evolution_entity.dart';
import 'package:flutter_pagination_bloc_test/features/evolution_pokemon/domain/params/pokemon_evolution_params.dart';
import 'package:flutter_pagination_bloc_test/features/evolution_pokemon/domain/respository/base_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@Singleton()
class PokemonEvolutionUseCase {
  final BasePokemonEvolutionRepository _basePokemonEvolutionRepository;

  PokemonEvolutionUseCase(this._basePokemonEvolutionRepository);
  TaskEither<NetworkExceptions, PokemonEvolutionListEntity> call(
      PokemonEvolutionParams params) {
    return _basePokemonEvolutionRepository.getEvolutionPokemonPaginated(params);
  }
}
