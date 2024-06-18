// ignore_for_file: no_leading_underscores_for_local_identifiers
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/model/pokemon_model.dart';

class PokedexApiService {
  // API'ye yapılan istek için kullanılacak URL adresi.
  static const String _url = "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";

  // Pokemon verilerini almak için kullanılacak asenkron fonksiyon.
  static Future<List<PokemonModel>> getPokemonData() async {
    // Alınan Pokemon verilerinin listesini tutmak için bir liste tanımlanıyor.
    List<PokemonModel> _myPokemonList = [];

    try {
      // Dio paketi kullanılarak API'ye istek yapılıyor.
      Response response = await Dio().get(_url);

      // HTTP yanıt kodu kontrol ediliyor.
      if (response.statusCode == 200) {
        // Yanıt verisi JSON formatına çözülüyor.
        var jsonData = jsonDecode(response.data);

        // JSON verileri kontrol ediliyor.
        if (jsonData != null && jsonData.containsKey('pokemon')) {
          // "pokemon" anahtarına sahip JSON verisi alınıyor.
          var pokemonList = jsonData['pokemon'];

          // Alınan JSON verisi bir liste mi kontrol ediliyor.
          if (pokemonList is List) {
            // JSON verileri PokemonModel sınıfına dönüştürülüp, listeye ekleniyor.
            _myPokemonList = pokemonList.map((e) => PokemonModel.fromJson(e)).toList();
          } else {
            // Eğer "pokemon" anahtarı bir liste değilse, hata mesajı yazdırılıyor ve null döndürülüyor.
            debugPrint('JSON Error: "pokemon" key is not a List.');
            return [];
          }
        } else {
          // Eğer "pokemon" anahtarı yoksa, hata mesajı yazdırılıyor ve null döndürülüyor.
          debugPrint('JSON Error: "pokemon" key not found in the response data.');
          return [];
        }
      } else {
        // Eğer HTTP yanıt kodu 200 değilse, hata mesajı yazdırılıyor ve null döndürülüyor.
        debugPrint('HTTP Error: ${response.statusCode}');
        return [];
      }
    } catch (error) {
      // Hata durumunda, DioException, FormatException gibi spesifik hatalar kontrol ediliyor.
      if (error is DioException) {
        debugPrint('Dio Error: ${error.message}');
      } else if (error is FormatException) {
        debugPrint('Format Error: ${error.message}');
      } else {
        // Diğer hata durumlarında genel bir hata mesajı yazdırılıyor.
        debugPrint('Unexpected Error: $error');
      }

      // Hata durumunda null döndürülüyor.
      return [];
    }

    // Pokemon verileri başarıyla alındıysa, listeyi döndürülüyor.
    return _myPokemonList;
  }
}
