import 'package:movie_database/Controller/omdb_api_controller.dart';
import 'package:movie_database/Model/movies_model.dart';

class MovieInfoController {
  final OmdbApiController _apiController = OmdbApiController();

  Future<MoviesModel> updateMovieData(String id) async {
    return await _apiController.updateMovieData(id);
  }
}
