// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:retro_cinema_app/models/main_page_data.dart';
import 'package:retro_cinema_app/models/movie.dart';
import 'package:retro_cinema_app/models/search_category.dart';
import 'package:retro_cinema_app/services/movie_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

class MainPageDataController extends StateNotifier<MainPageData> {
  MainPageDataController([MainPageData? state])
      : super(state ?? MainPageData.inital()) {
    getMovies();
  }

  final MovieService _movieService = GetIt.instance.get<MovieService>();

  Future<void> getMovies() async {
    try {
      List<Movie>? _movies = [];

      if (state.searchText!.isEmpty) {
        if (state.searchCategory == SearchCategory.popular) {
          _movies = await (_movieService.getPopularMovies(page: state.page));
        } else if (state.searchCategory == SearchCategory.upcoming) {
          _movies = await (_movieService.getUpcomingMovies(page: state.page));
        } else if (state.searchCategory == SearchCategory.none) {
          _movies = [];
        }
      } else {
        _movies = await (_movieService.searchMovies(state.searchText));
      }
      state = state.copyWith(
          movies: [...state.movies!, ..._movies!], page: state.page! + 1);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void updateSearchCategory(String? _category) {
    try {
      state = state.copyWith(
        movies: [],
        page: 1,
        searchCategory: _category,
        searchText: '',
      );
      getMovies();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void updateTextSearch(String _searchText) {
    try {
      state = state.copyWith(
        movies: [],
        page: 1,
        searchCategory: SearchCategory.none,
        searchText: _searchText,
      );
      getMovies();
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
