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
    return listOfMovies.length != 0
        ? ListView.builder(
            itemCount: listOfMovies.length + 1,
            itemBuilder: (context, index) {
              if (index == listOfMovies.length) {
                return Row(
                  children: [
                    pageNumber > 1
                        ? ElevatedButton(
                            onPressed: previousPageActionCallback,
                            child: const Center(
                              child: Column(
                                children: [
                                  Icon(Icons.arrow_back),
                                  Text('Pagina Anterior'),
                                ],
                              ),
                            ),
                          )
                        : Container(),
                    const Spacer(),
                    listOfMovies.length == 10
                        ? ElevatedButton(
                            onPressed: nextPageActionCallback,
                            child: const Center(
                              child: Column(
                                children: [
                                  Icon(Icons.arrow_forward),
                                  Text('Proxima pagina'),
                                ],
                              ),
                            ),
                          )
                        : Container(),
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
                          child: Image.network(
                            listOfMovies[index].poster,
                            errorBuilder: (context, error, stackTrace) {
                              return Icon(
                                Icons.question_mark,
                                size: 50,
                              );
                            },
                          ),
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
          )
        : const Center(
            child: Column(
              children: [
                Icon(
                  Icons.question_mark,
                  size: 150,
                ),
                Text(
                  'Nada encontrado, tente digitar algo diferente !',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                )
              ],
            ),
          );
  }
}
