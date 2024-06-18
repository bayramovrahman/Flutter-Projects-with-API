import 'package:flutter/material.dart';
import 'package:pokedex/widgets/pokemon_app_title.dart';
import 'package:pokedex/widgets/pokemon_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrientationBuilder(
        builder: (context, orientation) => const Column(
          children: [
            PokemonAppTitle(),
            Expanded(child: PokemonList()),
          ],
        ),
      )
    );
  }
}
