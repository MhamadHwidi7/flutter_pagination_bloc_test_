part of 'pokemons_evolution_cubit.dart';

@freezed
class PokemonsEvolutionState with _$PokemonsEvolutionState {
  const factory PokemonsEvolutionState.loading() = _Loading;
  const factory PokemonsEvolutionState.success(
      {required List<PokemonEvolutionEntity> pokemons,
      required bool canLoadMore}) = _Success;
  const factory PokemonsEvolutionState.error(NetworkExceptions exception) =
      _Error;
}
