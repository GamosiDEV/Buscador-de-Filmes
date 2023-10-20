import 'package:flutter/material.dart';
import 'package:movie_database/Controller/favorites_controller.dart';
import 'package:movie_database/Model/movies_model.dart';
import 'package:movie_database/View/movie_info_view.dart';
import 'package:movie_database/View/show_favorites_list_view.dart';
import 'package:movie_database/View/show_movie_list_view.dart';

class FavoritesView extends StatefulWidget {
  const FavoritesView({super.key});

  @override
  State<FavoritesView> createState() => _FavoritesViewState();
}

class _FavoritesViewState extends State<FavoritesView> {
  var favoriteMoviesList;

  FavoritesController _favoritesController = FavoritesController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getListOfFavorites();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Favoritos"),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              onSubmitted: (value) {
                value == '' ? getListOfFavorites() : searchInFavorites(value);
              },
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(7.0))),
                hintText: 'Digite o nome do filme',
              ),
            ),
            Expanded(
              child: FutureBuilder(
                future: favoriteMoviesList,
                builder: (context, snapshot) {
                  if (!snapshot.hasData ||
                      snapshot.hasError ||
                      snapshot.connectionState != ConnectionState.done) {
                    return Container();
                  }
                  return ShowFavoritesListView(
                      listOfMovies: snapshot.data as List<MoviesModel>,
                      openMovieCardCallback: openMovieCard);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  getListOfFavorites() async {
    favoriteMoviesList =
        Future.value(await _favoritesController.getListOfFavorites());
    setState(() {});
  }

  searchInFavorites(String text) async {
    favoriteMoviesList =
        Future.value(await _favoritesController.searchInFavorites(text));
    setState(() {});
  }

  openMovieCard(MoviesModel movie) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => MovieInfoView(
                movie: movie,
              )),
    );
  }
}
