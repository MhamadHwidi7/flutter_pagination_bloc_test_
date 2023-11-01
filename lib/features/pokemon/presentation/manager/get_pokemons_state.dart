part of 'get_pokemons_cubit.dart';

@freezed
class GetPokemonsState with _$GetPokemonsState {
  const factory GetPokemonsState.loading() = _Loading;
  const factory GetPokemonsState.success(
      {required List<Pokemon> pokemons, required bool canLoadMore}) = _Success;
  const factory GetPokemonsState.error(NetworkExceptions exception) = _Error;
}
