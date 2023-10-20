import 'package:flutter/material.dart';
import 'package:movie_database/Model/movies_model.dart';

class ShowMovieListView extends StatelessWidget {
  final List<MoviesModel> listOfMovies;
  final int pageNumber;
  final VoidCallback nextPageAction;
  final VoidCallback previousPageAction;

  const ShowMovieListView(
      {super.key,
      required this.listOfMovies,
      required this.nextPageAction,
      required this.previousPageAction,
      required this.pageNumber});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listOfMovies.length == 10 ?  listOfMovies.length+1 : listOfMovies.length,
      itemBuilder: (context, index) {
        if (index == listOfMovies.length) {
          return Row(
            children: [
              pageNumber > 1
                  ? InkWell(
                      onTap: () => previousPageAction(),
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
                onTap: () => nextPageAction(),
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
        return Card(
          child: Row(
            children: [
              SizedBox.fromSize(child: Image.network(listOfMovies[index].poster),size: Size.fromRadius(60)),
              Expanded(
                child: Column(
                  children: [
                    Text(listOfMovies[index].title,overflow: TextOverflow.ellipsis,maxLines: 2, textAlign: TextAlign.center,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                    Text(listOfMovies[index].year+' - '+listOfMovies[index].type, textAlign: TextAlign.center,style: TextStyle(fontSize: 16))
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
