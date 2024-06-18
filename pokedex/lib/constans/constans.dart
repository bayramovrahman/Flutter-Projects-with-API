import 'package:flutter/material.dart';

class Constans {
  // Bu, bir sınıfın sadece sabit değerler içermesi ve bu sınıfın başka bir yerde kullanılmamasını sağlamak için kullanılan bir Dart dilidir. Bu yapı, sınıfın başka bir yerden oluşturulmasını engellemek ve sadece sabit değerlere erişimi sınırlamak amacıyla kullanılır.
  Constans._();

  static const String title = "Pokedex";

  static TextStyle titleTextStyle() {
    return const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 48,
    );
  }

  static TextStyle pokemonNameTextStyle() {
    return const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 24,
    );
  }

  static TextStyle typeChipTextStyle() {
    return const TextStyle(
      color: Colors.white,
      fontSize: 14,
    );
  }

  static TextStyle getPokeInfoTextStyle() {
    return const TextStyle(
      color: Colors.black,
      fontSize: 16.0,
    );
  }

  static TextStyle getPokeInfoLabelTextStyle() {
    return const TextStyle(
      color: Colors.black,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    );
  }

  // static _calculateFontSize(int size) {
  //   if (ScreenUtil().orientation == Orientation.portrait) {
  //     return size.sp;
  //   } else {
  //     return (size * 1.5).sp;
  //   }
  // }
}
