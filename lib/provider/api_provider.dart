import 'package:moviez/models/movie_model.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/geners.dart';

final genersList = StateNotifierProvider<GenerNotifier, List<String>>((ref) {
  return GenerNotifier();


});



final searchMovieNotier=StateNotifierProvider<SearchMovie,List<MovieModel>>((ref) => SearchMovie());





class SearchMovie extends StateNotifier<List<MovieModel>>{
  SearchMovie():super([]);



  Future<List<MovieModel>> searchMovie(String searchText)async{

    String url='https://api.themoviedb.org/3/search/movie?api_key=f413316ed2a9bc31774222972282db3d&language=en-US&query=$searchText&page=1&include_adult=false';

  final res = await http.get(Uri.parse(url));

  final movies = json.decode(res.body);

  // debugPrint('Josn Data----------------------------:$movies');
  final _movieList = movies['results'].map<MovieModel>(
    (mov) {
      // debugPrint('movie ----------------:$mov');
      final _movie = MovieModel.fromJson(mov);

      return _movie;
    },
  ).toList();
   return _movieList;
  }
  


}


class GenerNotifier extends StateNotifier<List<String>> {
  GenerNotifier() : super([]);

  List<String> getGenerList(List<int> idList){
  List<String> movieGen = [];

     for (int i = 0; i < geners.length; i++) {
      for (int j = 0; j < idList.length; j++) {
        if (geners[i]['id'] ==idList[j]) {
          movieGen.add(geners[i]['name']);
          print(geners[i]['name']);
        }
      }
    }
    return movieGen;
  }
}

final getPopularMovies = FutureProvider<List<MovieModel>>((ref) async {
  const String url =
      'https://api.themoviedb.org/3/movie/popular?api_key=f413316ed2a9bc31774222972282db3d&language=en-US&page=1';

  final res = await http.get(Uri.parse(url));

  final movies = json.decode(res.body);

  // debugPrint('Josn Data----------------------------:$movies');
  final _movieList = movies['results'].map<MovieModel>(
    (mov) {
      // debugPrint('movie ----------------:$mov');
      final _movie = MovieModel.fromJson(mov);

      return _movie;
    },
  ).toList();

  // print(_movieList);
  return _movieList;
});

final getTopRated = FutureProvider<List<MovieModel>>((ref) async {
  const String url =
      'https://api.themoviedb.org/3/movie/top_rated?api_key=f413316ed2a9bc31774222972282db3d&language=en-US&page=1';
  final res = await http.get(Uri.parse(url));

  final movies = json.decode(res.body);

  // debugPrint('Josn Data----------------------------:$movies');
  final _movieList = movies['results'].map<MovieModel>(
    (mov) {
      // debugPrint('movie ----------------:$mov');
      final _movie = MovieModel.fromJson(mov);

      return _movie;
    },
  ).toList();

  // print(_movieList);
  return _movieList;
});

final getUpcomingMovies = FutureProvider<List<MovieModel>>((ref) async {
  const String url =
      'https://api.themoviedb.org/3/movie/upcoming?api_key=f413316ed2a9bc31774222972282db3d&language=en-US&page=1';
  final res = await http.get(Uri.parse(url));

  final movies = json.decode(res.body);

  // debugPrint('Josn Data----------------------------:$movies');
  final _movieList = movies['results'].map<MovieModel>(
    (mov) {
      // debugPrint('movie ----------------:$mov');
      final _movie = MovieModel.fromJson(mov);

      return _movie;
    },
  ).toList();

  // print(_movieList);
  return _movieList;
});

final getNowPlayingMovies = FutureProvider<List<MovieModel>>((ref) async {
  const String url =
      'https://api.themoviedb.org/3/movie/now_playing?api_key=f413316ed2a9bc31774222972282db3d&language=en-US';
  final res = await http.get(Uri.parse(url));

  final movies = json.decode(res.body);

  // debugPrint('Josn Data----------------------------:$movies');
  final _movieList = movies['results'].map<MovieModel>(
    (mov) {
      // debugPrint('movie ----------------:$mov');
      final _movie = MovieModel.fromJson(mov);

      return _movie;
    },
  ).toList();

  // print(_movieList);
  return _movieList;
});
