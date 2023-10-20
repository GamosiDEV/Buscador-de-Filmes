import 'package:flutter/material.dart';
import 'package:movie_database/Model/movies_model.dart';

class MovieInfoContentView extends StatelessWidget {
  final MoviesModel movie;
  const MovieInfoContentView({super.key, required this.movie});

  static final String GENERIC_IMAGE =
      'https://cdn-icons-png.flaticon.com/512/10449/10449616.png';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: SizedBox.fromSize(
                child: Image.network(
                    movie.poster == 'N/A' ? GENERIC_IMAGE : movie.poster),
                size: Size.fromRadius(200)),
          ),
          movie.plot != 'N/A'
              ? Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 4.0, 0.0, 4.0),
                  child: Text(movie.plot),
                )
              : Container(),
          movie.title != 'N/A'
              ? Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 4.0, 0.0, 4.0),
                  child: Text(
                    'Titulo Completo: ' + movie.title,
                    maxLines: 2,
                  ),
                )
              : Container(),
          movie.year != 'N/A'
              ? Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 4.0, 0.0, 4.0),
                  child: Text('Ano de Lançamento: ' + movie.year),
                )
              : Container(),
          movie.director != 'N/A'
              ? Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 4.0, 0.0, 4.0),
                  child: Text('Dirigido por: ' + movie.director),
                )
              : Container(),
          movie.genre != 'N/A'
              ? Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 4.0, 0.0, 4.0),
                  child: Text('Genero: ' + movie.genre),
                )
              : Container(),
          movie.runtime != 'N/A'
              ? Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 4.0, 0.0, 4.0),
                  child: Text('Tempo de Filme: ' + movie.runtime),
                )
              : Container(),
          movie.imdbRating != 'N/A'
              ? Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 4.0, 0.0, 4.0),
                  child: Text('Nota IMDB: ' + movie.imdbRating),
                )
              : Container(),
          movie.metascore != 'N/A'
              ? Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 4.0, 0.0, 4.0),
                  child: Text('Nota Metascore: ' + movie.metascore),
                )
              : Container(),
          Container(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              child: Text('Adicionar aos Favoritos'),
            ),
          )
        ],
      ),
    );
  }
}
