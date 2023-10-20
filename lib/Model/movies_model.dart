class MoviesModel {
  var title;
  var year;
  var runtime;
  var genre;
  var director;
  var imdbRating;
  var metascore;
  var plot;
  var poster;
  var type;
  var imdbID;

  MoviesModel(
      {this.title,
      this.year,
      this.runtime,
      this.genre,
      this.director,
      this.imdbRating,
      this.metascore,
      this.plot,
      this.poster,
      this.type,
      this.imdbID});

  factory MoviesModel.fromJsonAllData(Map<String, dynamic> json) {
    return MoviesModel(
        title: json['Title'],
        year: json['Year'],
        runtime: json['Runtime'],
        genre: json['Genre'],
        metascore: json['Metascore'],
        director: json['Director'],
        imdbRating: json['imdbRating'],
        poster: json['Poster'],
        plot: json['Plot'],
        type: json['Type'],
        imdbID: json['imdbID']);
  }

  factory MoviesModel.fromJsonToList(Map<String, dynamic> json) {
    return MoviesModel(
        title: json['Title'],
        year: json['Year'],
        poster: json['Poster'],
        type: json['Type'],
        imdbID: json['imdbID']);
  }
}
