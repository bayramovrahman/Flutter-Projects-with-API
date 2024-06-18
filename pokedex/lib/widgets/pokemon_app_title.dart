import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedex/constans/constans.dart';
import 'package:pokedex/constans/ui_helper.dart';

class PokemonAppTitle extends StatefulWidget {
  const PokemonAppTitle({super.key});

  @override
  State<PokemonAppTitle> createState() => _PokemonAppTitleState();
}

class _PokemonAppTitleState extends State<PokemonAppTitle> {
  String pokemonImageURL = "assets/images/pokeball.png";

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: UIHelper.getAppTitleWidgetHeight(),
      child: Stack(
        children: [
          Padding(
            padding: UIHelper.getDefaultPadding(),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                Constans.title,
                style: Constans.titleTextStyle(),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Image.asset(
              pokemonImageURL,
              width: ScreenUtil().orientation == Orientation.portrait
                  ? 0.2.sh
                  : 0.2.sw,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
