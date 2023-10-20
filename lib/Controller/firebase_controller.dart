import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movie_database/Model/movies_model.dart';

class FirebaseController {
  final _firebaseFirestore = FirebaseFirestore.instance;
  static final FAVORITES = 'favorites';

  void addToFavorites(MoviesModel movie) async {
    await _firebaseFirestore
        .collection(FAVORITES)
        .doc(movie
            .imdbID) //Utilizando o ID unico do IMDB como token do documento para facilitar as buscas
        .set(movie.toJson());
  }

  Future<List<MoviesModel>> getListOfFavorites() async {
    List<MoviesModel> listOfMovies = [];

    await _firebaseFirestore.collection(FAVORITES).get().then((favorites) {
      for (final movie in favorites.docs) {
        listOfMovies.add(MoviesModel.fromJsonAllData(movie.data()));
      }
    });
    return listOfMovies;
  }
//

  Future<List<MoviesModel>> searchInFavorites(String text) async {
    List<MoviesModel> listOfMovies = [];

    await _firebaseFirestore.collection(FAVORITES).get().then((favorites) {
      for (final movie in favorites.docs) {
        if (movie
            .data()['Title']
            .toString()
            .toLowerCase()
            .contains(text.toLowerCase())) {
          listOfMovies.add(MoviesModel.fromJsonAllData(movie.data()));
        }
      }
    });
    return listOfMovies;
  }
}
