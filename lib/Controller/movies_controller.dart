import 'package:movie_database/Controller/omdb_api_controller.dart';
import 'package:movie_database/Model/movies_model.dart';

class MoviesController {

  final OmdbApiController _apiController = OmdbApiController();

  Future<List<MoviesModel>> searchMovie(searchedText) async {
    return await _apiController.getMovieListByText(searchedText);
  }

  Future<List<MoviesModel>> searchMovieWithDifferentPage(searchedText, int actualPage) async {
    return await _apiController.searchMovieWithDifferentPage(searchedText, actualPage);
  }

  
  
}