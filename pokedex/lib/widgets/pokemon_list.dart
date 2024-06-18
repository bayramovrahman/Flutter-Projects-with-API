import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedex/model/pokemon_model.dart';
import 'package:pokedex/services/pokedex_api_service.dart';
import 'package:pokedex/widgets/pokelist_item.dart';

class PokemonList extends StatefulWidget {
  const PokemonList({super.key});

  @override
  State<PokemonList> createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  late Future<List<PokemonModel>> _pokemonListFuture;

  @override
  void initState() {
    _pokemonListFuture = PokedexApiService.getPokemonData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PokemonModel>>(
      future: _pokemonListFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Veri bekleniyor durumu
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          // Hata durumu
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        } else if (snapshot.hasData) {
          // Veri geldiği durum
          List<PokemonModel> myPokemonList = snapshot.data!;
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: ScreenUtil().orientation == Orientation.portrait ? 2 : 3,
              // crossAxisSpacing: 3.0,
              // mainAxisSpacing: 3.0,
            ),
            itemCount: myPokemonList.length,
            itemBuilder: (context, index) {
              PokemonModel myPokemonListIndex = myPokemonList[index];
              // Burada Pokemon listesini kullanarak istediğiniz işlemleri yapabilirsiniz.
              return PokeListItem(pokemon: myPokemonListIndex);
            },
          );
        } else {
          // Bu durum normalde FutureBuilder'ın durumu olmamalıdır, ancak yine de bir durum ekleyebilirsiniz.
          return const Center(
            child: Text('No data available.'),
          );
        }
      },
    );
  }
}
