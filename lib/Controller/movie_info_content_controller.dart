import 'package:movie_database/Controller/firebase_controller.dart';
import 'package:movie_database/Model/movies_model.dart';

class MovieInfoContentController {
  FirebaseController _firebaseController = FirebaseController();

  void addToFavorites(MoviesModel movie) async {
    return _firebaseController.addToFavorites(movie);
  }
}
