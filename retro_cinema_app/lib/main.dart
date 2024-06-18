import 'package:retro_cinema_app/pages/main_page.dart';
import 'package:retro_cinema_app/pages/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    SplashPage(
      key: UniqueKey(),
      onInitializationComplete: () => runApp(
        const ProviderScope(
          child: MyApp(),
        ),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'home',
      routes: {
        'home': (context) => MainPage(),
      },
      theme: ThemeData(
        // Uygulamanın genel renk paletini belirler.
        primarySwatch: Colors.blue,
        // visualDensity => Adaptif platform yoğunluğunu belirler. Bu, cihazın fiziksel yoğunluğuna bağlı olarak arayüz elemanlarının boyutlarını ve düzenini ayarlamak için kullanılır.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      title: "Flickd App",
    );
  }
}
