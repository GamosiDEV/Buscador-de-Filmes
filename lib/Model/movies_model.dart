class MoviesModel {
  var title;
  var year;
  var released;
  var runtime;
  var genre;
  var director;
  var imdbRating;
  var awards;
  var plot;
  var poster;
  var type;

MoviesModel(
  {
    this.title,
    this.year,
    this.released,
    this.runtime,
    this.genre,
    this.director,
    this.imdbRating,
    this.awards,
    this.plot,
    this.poster,
    this.type
  }
);

  factory MoviesModel.fromJsonAllData(Map<String,dynamic> json) {
    return MoviesModel(
      title: json['Title'],
      year: json['Year'],
      released: json['Released'],
      runtime: json['Runtime'],
      genre: json['Genre'],
      director: json['Director'],
      imdbRating: json['imdbRating'],
      awards: json['Awards'],
      poster: json['Poster'],
      plot: json['Plot'],
    );
  }

  factory MoviesModel.fromJsonToList(Map<String,dynamic> json) {
    return MoviesModel(
      title: json['Title'],
      year: json['Year'],
      poster: json['Poster'],
      type: json['Type']
    );
  }
  
}