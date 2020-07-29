part of 'models.dart';

class Movie extends Equatable {
  /// -----------------------------------------
  /// [Movie Class]
  /// This class is used to modeling movie data
  /// -----------------------------------------

  //* Property model
  final int id;
  final String title;
  final double voteAverage;
  final String overview;
  final String posterPath;
  final String backdropPath;

  //* Constructor model
  Movie({
    @required this.id,
    @required this.title,
    @required this.voteAverage,
    @required this.overview,
    @required this.posterPath,
    @required this.backdropPath,
  });

  //* Create method 'fromJson' to return movie object from json data
  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
    id: json['id'],
    title: json['title'],
    voteAverage: (json['vote_average'] as num).toDouble(),
    overview: json['overview'],
    posterPath: json['poster_path'],
    backdropPath: json['backdrop_path'],
  );

  //* Passing property model to list of object
  @override
  List<Object> get props => [
    id,
    title,
    voteAverage,
    overview,
    posterPath,
    backdropPath,
  ];
}
