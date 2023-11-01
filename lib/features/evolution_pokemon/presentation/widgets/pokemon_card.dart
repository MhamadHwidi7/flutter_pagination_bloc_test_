import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pagination_bloc_test/features/evolution_pokemon/domain/entities/pokemons_evolution_entity.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard({
    super.key,
    required this.pokemon,
  });

  final PokemonEvolutionEntity pokemon;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: ListTile(
        title: Text(pokemon.pokemonUrl,
            style: Theme.of(context).textTheme.titleLarge),
      ),
    );
  }
}
