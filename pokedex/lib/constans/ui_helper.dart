import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UIHelper {
  UIHelper._();

  static double getAppTitleWidgetHeight() {
    return ScreenUtil().orientation == Orientation.portrait ? 0.15.sh : 0.15.sw;
    // Bu ifade, eğer ekran oryantasyonu dikey/portre (portrait) ise, yükseklik (sh) üzerinden yüzde 15'lik bir değer elde eder (0.15.sh). Eğer ekran oryantasyonu yatay/manzara (landscape) ise, genişlik (sw) üzerinden yüzde 15'lik bir değer elde eder (0.15.sw). Yani, ekranın oryantasyonuna göre dinamik bir değer hesaplanmış olur.

    /*
      Orientation.portrait dikey/portre ekran oryantasyonunu ifade eder. 
      Orientation.landscape yatay/manzara ekran oryantasyonunu ifade eder. 
    */
  }

  static final Map<String, Color> _typeColorMap = {
    'Grass': Colors.green,
    'Fire': Colors.redAccent,
    'Water': Colors.blue,
    'Electric': Colors.yellow,
    'Rock': Colors.grey,
    'Ground': Colors.brown,
    'Bug': Colors.lightGreenAccent.shade700,
    'Psychic': Colors.indigo,
    'Fighting': Colors.orange,
    'Ghost': Colors.deepPurple,
    'Normal': Colors.black26,
    'Poison': Colors.deepPurpleAccent
  };

  static Color getColorFromType(String type) {
    if (_typeColorMap.containsKey(type)) {
      return _typeColorMap[type] ?? Colors.pink.shade300;
    } else {
      return Colors.pink.shade300;
    }
  }

  static EdgeInsets getDefaultPadding() {
    if (ScreenUtil().orientation == Orientation.portrait) {
      return EdgeInsets.all(12.h);
    } else {
      return EdgeInsets.all(8.w);
    }
  }

  static EdgeInsets getIconPadding() {
    if (ScreenUtil().orientation == Orientation.portrait) {
      return EdgeInsets.all(10.h);
    } else {
      return EdgeInsets.all(4.w);
    }
  }

  static double pokemonImageSize() {
    if (ScreenUtil().orientation == Orientation.portrait) {
      return 0.2.sw;
    } else {
      return 0.3.sh;
    }
  }
}
