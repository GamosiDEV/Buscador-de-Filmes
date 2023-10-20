import 'package:flutter/material.dart';
import 'package:movie_database/Controller/movies_controller.dart';
import 'package:movie_database/Model/movies_model.dart';
import 'package:movie_database/View/show_movie_list_view.dart';

class MoviesView extends StatefulWidget {
  const MoviesView({super.key});

  @override
  State<MoviesView> createState() => _MoviesViewState();
}

class _MoviesViewState extends State<MoviesView> {

  final MoviesController _moviesController = MoviesController();

  var searchedMovies;
  var actualSearchedText;
  int actualPage = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Procurar na lista"),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
                onSubmitted: (value) {
                  searchMovie(value);
                },
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(7.0))),
                  hintText: 'Digite o nome do filme',
                ),
              ),
            Expanded(
              child: FutureBuilder(
                future: searchedMovies,
                builder: (context, snapshot) {
                  if (!snapshot.hasData ||
                    snapshot.hasError ||
                    snapshot.connectionState != ConnectionState.done) {
                  return Container();
                }
                return ShowMovieListView(
                    listOfMovies: snapshot.data as List<MoviesModel>,
                    pageNumber: actualPage,
                    nextPageAction: goToNextPage,
                    previousPageAction: goToPreviousPage);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void searchMovie(String searchedText) async {
    actualSearchedText = searchedText.replaceAll(" ", "+");
    actualPage = 1;
    searchedMovies = Future.value(await _moviesController.searchMovie(actualSearchedText));
    setState(() {});
  }

  goToNextPage() async {
    actualPage++;
    searchedMovies = Future.value(await _moviesController.searchMovieWithDifferentPage(actualSearchedText,actualPage));
    setState(() {});
  }
  goToPreviousPage() async {
    actualPage--;
    searchedMovies = Future.value(await _moviesController.searchMovieWithDifferentPage(actualSearchedText,actualPage));
    setState(() {});
  }
}