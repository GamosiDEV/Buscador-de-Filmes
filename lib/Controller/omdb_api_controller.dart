import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_database/Model/movies_model.dart';

class OmdbApiController {
  String allDataApiUrl =
      'http://www.omdbapi.com/?apikey=b3087fac&'; //key: b3087fac

  Future<http.Response> getApiDataByString(String uri) async {
    return await http.get(Uri.parse(uri));
  }

  Future<List<MoviesModel>> getMovieListByText(String text) async {
    final response = await getApiDataByString(allDataApiUrl + "s=" + text);
    var json = jsonDecode(response.body);

    List<MoviesModel> listOfMovies = [];
    if (json['Search'] != null) {
      for (var movie in json['Search']) {
        listOfMovies.add(MoviesModel.fromJsonToList(movie));
      }
    }
    return listOfMovies;
  }

  Future<List<MoviesModel>> searchMovieWithDifferentPage(
      String text, int actualPage) async {
    final response = await getApiDataByString(
        allDataApiUrl + "s=" + text + "&page=$actualPage");
    var json = jsonDecode(response.body);

    List<MoviesModel> listOfMovies = [];
    if (json['Search'] != null) {
      for (var movie in json['Search']) {
        listOfMovies.add(MoviesModel.fromJsonToList(movie));
      }
    }
    return listOfMovies;
  }

  Future<MoviesModel> updateMovieData(String id) async {
    final response = await getApiDataByString(allDataApiUrl + "i=$id");
    var json = jsonDecode(response.body);

    MoviesModel updatedMovie = MoviesModel.fromJsonAllData(json);
    return updatedMovie;
  }
}
