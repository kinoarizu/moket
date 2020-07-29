part of 'models.dart';

class MovieDetail extends Movie {
  /// ------------------------------------------------
  /// [Movie Class]
  /// This class is used to modeling movie detail data
  /// ------------------------------------------------

  //* Property model
  final List<String> genres;
  final String language;

  //* Constructor model + parent model
  MovieDetail(Movie movie, {this.genres, this.language}) : super(
    id: movie.id,
    title: movie.title,
    voteAverage: movie.voteAverage,
    overview: movie.overview,
    posterPath: movie.posterPath,
    backdropPath: movie.backdropPath,
  );

  //* Getter to generate sentence of genre and language
  String get genresAndLanguage {
    String s = "";

    for (var genre in genres) {
      s += genre + (genre != genres.last ? ', ' : '');
    }

    return "$s - $language";
  }

  //* Passing property model + parent model to list of object
  @override
  List<Object> get props => super.props + [genres, language];
}