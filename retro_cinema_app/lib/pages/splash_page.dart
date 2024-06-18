// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:convert';
import 'package:retro_cinema_app/models/app_config.dart';
import 'package:retro_cinema_app/services/http_service.dart';
import 'package:retro_cinema_app/services/movie_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';

class SplashPage extends StatefulWidget {
  //  VoidCallback => geriye değer döndürmeyen (void) bir geri çağırım fonksiyonu.
  final VoidCallback onInitializationComplete;
  const SplashPage({super.key, required this.onInitializationComplete});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  double? _deviceHeight;
  double? _deviceWidth;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 2000)).then(
      (_) => _setup(context).then(
        (_) => widget.onInitializationComplete(),
      ),
    );
  }

  Future<void> _setup(BuildContext _context) async {
    final getIt = GetIt.instance;
    final configFile = await rootBundle.loadString('assets/config/main.json');
    final configData = jsonDecode(configFile);

    getIt.registerSingleton<AppConfig>(
      /*
         Bu yöntem, GetIt servis sağlayıcısına bir nesne olarak kaydeder. Uygulama içinde bu nesneye tek bir örnek (singleton)
         oluşturulmasını sağlar. Yani bu nesne, uygulama boyunca yalnızca bir kere oluşturulur ve daha sonra herhangi bir yerden
         erişilebilir.
      */
      AppConfig(
        API_KEY: configData['API_KEY'],
        BASE_API_URL: configData['BASE_API_URL'],
        BASE_IMAGE_API_URL: configData['BASE_IMAGE_API_URL'],
      ),
    );

    getIt.registerSingleton<HTTPService>(
      HTTPService(),
    );

    getIt.registerSingleton<MovieService>(
      MovieService(),
    );
  }

  @override
  Widget build(BuildContext context) {
    _deviceWidth = MediaQuery.of(context).size.width;
    _deviceHeight = MediaQuery.of(context).size.height;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flickd App",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Center(
        child: Container(
          // height => Cihazın genişliğinin %100'ü olarak ayarlanır.
          width: _deviceWidth! * 1.00,
          // height => Cihazın yüksekliğinin %100'ü olarak ayarlanır.
          height: _deviceHeight! * 1.00,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.contain,
              image: AssetImage(
                'assets/images/logo.png',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
