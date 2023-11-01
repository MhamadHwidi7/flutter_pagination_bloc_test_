import 'package:flutter_pagination_bloc_test/core/errors/network_exceptions.dart';
import 'package:flutter_pagination_bloc_test/features/evolution_pokemon/domain/entities/pokemons_evolution_entity.dart';
import 'package:flutter_pagination_bloc_test/features/evolution_pokemon/domain/params/pokemon_evolution_params.dart';
import 'package:fpdart/fpdart.dart';

abstract class BasePokemonEvolutionRepository {
  TaskEither<NetworkExceptions, PokemonEvolutionListEntity>
      getEvolutionPokemonPaginated(PokemonEvolutionParams params);
}
