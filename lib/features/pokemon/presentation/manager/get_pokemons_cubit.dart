import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_pagination_bloc_test/core/errors/network_exceptions.dart';
import 'package:flutter_pagination_bloc_test/features/pokemon/domain/entity/pokemon_entity.dart';
import 'package:flutter_pagination_bloc_test/features/pokemon/domain/params/pokemon_params.dart';
import 'package:flutter_pagination_bloc_test/features/pokemon/domain/use_case/pokemon_use_case.dart';
import 'package:injectable/injectable.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

part 'get_pokemons_cubit.freezed.dart';
part 'get_pokemons_state.dart';

const initialPage = 0;
const limit = 20;

@injectable
class GetPokemonsCubit extends Cubit<GetPokemonsState> {
  final GetPokemonsPaginatedUseCase _getPokemonsPaginatedUseCase;
  GetPokemonsCubit(
    this._getPokemonsPaginatedUseCase,
  ) : super(const GetPokemonsState.loading());
  int currentPage = initialPage;
  bool canLoadMorePokemons = true;
  Future<void> getPokemons() async {
    if (!canLoadMorePokemons) {
      return;
    }
    PokemonParams params =
        PokemonParams(offset: currentPage * limit, limit: limit);

    final response = await _getPokemonsPaginatedUseCase(params);

    response.fold((l) => emit(GetPokemonsState.error(l)), (r) {
      canLoadMorePokemons = r.canLoadMore;
      currentPage++;
      emit(
        GetPokemonsState.success(
            pokemons: state.maybeWhen(
              orElse: () => [...r.pokemons],
              success: (pokemons, canLoadMore) => [...pokemons, ...r.pokemons],
            ),
            canLoadMore: canLoadMorePokemons),
      );
    });
  }

  final RefreshController refreshController = RefreshController();
  @override
  Future<void> close() {
    refreshController.dispose();
    return super.close();
  }
}
