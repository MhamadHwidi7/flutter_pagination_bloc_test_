import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pagination_bloc_test/core/errors/network_exceptions.dart';
import 'package:flutter_pagination_bloc_test/features/pokemon/presentation/manager/get_pokemons_cubit.dart';
import 'package:flutter_pagination_bloc_test/features/pokemon/presentation/widgets/custom_pagination_widget.dart';
import 'package:flutter_pagination_bloc_test/features/pokemon/presentation/widgets/pokemon_tile.dart';
import 'package:flutter_pagination_bloc_test/injection.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider<GetPokemonsCubit>(
        create: (context) => getIt<GetPokemonsCubit>()..getPokemons(),
        child: Scaffold(
          appBar: AppBar(
            title: const Text('pokemons'),
          ),
          body: Builder(
            builder: (context) {
              final pokemonCubitContext = context.read<GetPokemonsCubit>();
              return BlocConsumer<GetPokemonsCubit, GetPokemonsState>(
                listener: (context, state) =>
                    state.whenOrNull(success: (_, canLoadMoreData) {
                  pokemonCubitContext.refreshController.refreshCompleted();
                  if (!canLoadMoreData) {
                    pokemonCubitContext.refreshController.loadNoData();
                  } else {
                    pokemonCubitContext.refreshController.loadComplete();
                  }
                  return null;
                }),
                builder: (context, state) => state.when(
                  loading: () => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  success: (pokemons, canLoadMore) => CustomPaginationWidget(
                    refreshController: pokemonCubitContext.refreshController,
                    onLoading: () async {
                      pokemonCubitContext.getPokemons();
                    },
                    listTobePaginated: ListView.builder(
                      itemCount: pokemons.length,
                      itemBuilder: (context, index) {
                        final pokemon = pokemons[index];
                        return PokemonTile(pokemon: pokemon);
                      },
                    ),
                  ),
                  error: (exception) => Center(
                    child: Text(
                      NetworkExceptions.getErrorMessage(exception),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      );
}
