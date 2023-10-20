import 'package:movie_database/Controller/firebase_controller.dart';
import 'package:movie_database/Model/movies_model.dart';

class FavoritesController {
  FirebaseController _firebaseController = FirebaseController();

  Future<List<MoviesModel>> getListOfFavorites() async {
    return await _firebaseController.getListOfFavorites();
  }

  Future<List<MoviesModel>> searchInFavorites(String text) async {
    return await _firebaseController.searchInFavorites(text);
  }
}
