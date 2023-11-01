// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:flutter_pagination_bloc_test/features/evolution_pokemon/domain/params/pokemon_evolution_params.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_pagination_bloc_test/features/evolution_pokemon/domain/entities/pokemons_evolution_entity.dart';
import 'package:flutter_pagination_bloc_test/features/evolution_pokemon/domain/use_case/pokemon_evolution_use_case.dart';
import 'package:injectable/injectable.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../../core/errors/network_exceptions.dart';

part 'pokemons_evolution_cubit.freezed.dart';
part 'pokemons_evolution_state.dart';

const limit = 10;
const initialPage = 0;

@injectable
class PokemonsEvolutionCubit extends Cubit<PokemonsEvolutionState> {
  final PokemonEvolutionUseCase _pokemonEvolutionUseCase;
  PokemonsEvolutionCubit(
    this._pokemonEvolutionUseCase,
  ) : super(const PokemonsEvolutionState.loading());

  int currentPage = initialPage;
  bool canLoadMorePokemons = true;

  Future<void> getEvolutionsPokemons() async {
    if (!canLoadMorePokemons) {
      return;
    }
    final params =
        PokemonEvolutionParams(limit: limit, offset: currentPage * limit);
    final response = _pokemonEvolutionUseCase(params);
    response.bimap(
      (l) => emit(PokemonsEvolutionState.error(l)),
      (r) {
        canLoadMorePokemons = r.canLoadMore;
        currentPage++;
        emit(PokemonsEvolutionState.success(
          pokemons: state.maybeWhen(
            orElse: () => [...r.pokemons],
            success: (pokemons, canLoadMore) => [...pokemons, ...r.pokemons],
          ),
          canLoadMore: canLoadMorePokemons,
        ));
      },
    ).run();

    // response.mapLeft((l) {}).run();
  }

  final RefreshController refreshController = RefreshController();
  @override
  Future<void> close() {
    refreshController.dispose();
    return super.close();
  }
}
