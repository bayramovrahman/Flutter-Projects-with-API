import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedex/constans/constans.dart';
import 'package:pokedex/constans/ui_helper.dart';
import 'package:pokedex/model/pokemon_model.dart';
import 'package:pokedex/pages/poke_detail_page.dart';
import 'package:pokedex/widgets/pokemon_images.dart';

class PokeListItem extends StatelessWidget {
  final PokemonModel pokemon;
  const PokeListItem({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => PokeDetailPage(pokemon: pokemon),
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0.w),
        ),
        elevation: 3.0,
        shadowColor: Colors.white,
        color: UIHelper.getColorFromType(pokemon.type![0]),
        child: Padding(
          padding: UIHelper.getDefaultPadding(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(pokemon.name ?? "N/A",
                  style: Constans.pokemonNameTextStyle()),
              Chip(
                label: Text(
                  pokemon.type![0],
                  style: Constans.typeChipTextStyle(),
                ),
              ),
              Expanded(
                child: PokemonImages(pokemon: pokemon),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
