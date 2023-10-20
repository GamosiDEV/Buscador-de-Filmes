import 'package:flutter/material.dart';
import 'package:movie_database/Model/movies_model.dart';
import 'package:movie_database/View/movie_info_content_view.dart';

class ShowMovieListView extends StatelessWidget {
  final List<MoviesModel> listOfMovies;
  final int pageNumber;
  final VoidCallback nextPageActionCallback;
  final VoidCallback previousPageActionCallback;
  final ValueSetter<MoviesModel> openMovieCardCallback;

  const ShowMovieListView(
      {super.key,
      required this.listOfMovies,
      required this.nextPageActionCallback,
      required this.previousPageActionCallback,
      required this.pageNumber,
      required this.openMovieCardCallback});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listOfMovies.length == 10
          ? listOfMovies.length + 1
          : listOfMovies.length,
      itemBuilder: (context, index) {
        if (index == listOfMovies.length) {
          return Row(
            children: [
              pageNumber > 1
                  ? InkWell(
                      onTap: () => previousPageActionCallback(),
                      child: const Card(
                        child: Center(
                          child: Column(
                            children: [
                              Icon(Icons.arrow_back),
                              Text('Pagina Anterior'),
                            ],
                          ),
                        ),
                      ),
                    )
                  : Container(),
              Spacer(),
              InkWell(
                onTap: () => nextPageActionCallback(),
                child: const Card(
                  child: Center(
                    child: Column(
                      children: [
                        Icon(Icons.arrow_forward),
                        Text('Proxima pagina'),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        }
        return InkWell(
          onTap: () {
            openMovieCardCallback(listOfMovies[index]);
          },
          child: Card(
            child: Row(
              children: [
                SizedBox.fromSize(
                    child: Image.network(listOfMovies[index].poster == 'N/A'
                        ? MovieInfoContentView.GENERIC_IMAGE
                        : listOfMovies[index].poster),
                    size: Size.fromRadius(60)),
                Expanded(
                  child: Column(
                    children: [
                      Text(listOfMovies[index].title,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      Text(
                          listOfMovies[index].year +
                              ' - ' +
                              listOfMovies[index].type,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16))
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
