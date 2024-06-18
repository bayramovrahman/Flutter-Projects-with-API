import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/constans/ui_helper.dart';
import 'package:pokedex/model/pokemon_model.dart';

class PokemonImages extends StatelessWidget {
  final PokemonModel pokemon;

  const PokemonImages({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    String pokemonImageURL = "assets/images/pokeball.png";
    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomRight,
          child: Image.asset(
            pokemonImageURL,
            width: UIHelper.pokemonImageSize(),
            height: UIHelper.pokemonImageSize(),
            fit: BoxFit.fitHeight,
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Hero(
            tag: pokemon.id!,
            child: CachedNetworkImage(
              imageUrl: pokemon.img ?? '',
              placeholder: (context, url) => CircularProgressIndicator(
                color: UIHelper.getColorFromType(pokemon.type![0]),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              width: UIHelper.pokemonImageSize(),
              height: UIHelper.pokemonImageSize(),
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
      ],
    );
  }
}
