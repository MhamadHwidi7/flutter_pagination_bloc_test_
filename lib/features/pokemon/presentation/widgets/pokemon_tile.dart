import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pagination_bloc_test/core/resources/spacing_constants.dart';
import 'package:flutter_pagination_bloc_test/features/pokemon/domain/entity/pokemon_entity.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PokemonTile extends StatelessWidget {
  const PokemonTile({
    super.key,
    required this.pokemon,
  });

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10).h,
        height: 100.h,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              imageUrl: pokemon.imageUrl,
              placeholder: (context, url) => Container(
                height: 100.h,
                width: 100.h,
                color: Colors.grey,
                child: const Icon(Icons.image),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.cancel),
              height: 100.h,
              width: 100.h,
              fit: BoxFit.cover,
            ),
            SpacingConstants.w10,
            Text(
              pokemon.pokemonName,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ),
      ),
    );
  }
}
