part of 'models.dart';

class Credit extends Equatable {
  /// ------------------------------------------
  /// [Credit Class]
  /// This class is used to modeling credit data
  /// ------------------------------------------

  //* Property model
  final String name;
  final String profilePath;

  //* Constructor model
  Credit({this.name, this.profilePath});

  //* Passing property model to list of object
  @override
  List<Object> get props => [name, profilePath];
}