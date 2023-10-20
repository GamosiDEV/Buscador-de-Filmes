import 'package:flutter/material.dart';
import 'package:movie_database/Controller/movie_info_controller.dart';
import 'package:movie_database/Model/movies_model.dart';
import 'package:movie_database/View/movie_info_content_view.dart';

class MovieInfoView extends StatefulWidget {
  final MoviesModel movie;
  const MovieInfoView({super.key, required this.movie});

  @override
  State<MovieInfoView> createState() => _MovieInfoViewState();
}

class _MovieInfoViewState extends State<MovieInfoView> {
  var selectedMovie;

  MovieInfoController _movieInfoController = MovieInfoController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      updateMovieData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        widget.movie.title,
        overflow: TextOverflow.fade,
      )),
      body: FutureBuilder(
        future: selectedMovie,
        builder: (context, snapshot) {
          if (!snapshot.hasData ||
              snapshot.hasError ||
              snapshot.connectionState != ConnectionState.done) {
            return Container();
          }
          return MovieInfoContentView(
            movie: snapshot.data as MoviesModel,
          );
        },
      ),
    );
  }

  updateMovieData() async {
    selectedMovie = Future.value(
        await _movieInfoController.updateMovieData(widget.movie.imdbID));
    setState(() {});
  }
}
