part of 'models.dart';

class Transactions extends Equatable {
  /// ------------------------------------------------
  /// [Transactions Class]
  /// This class is used to modeling transactions data
  /// ------------------------------------------------

  //* Property model
  final String userID;
  final String title;
  final String subtitle;
  final DateTime time;
  final int amount;
  final String picture;

  //* Constructor model
  Transactions({
    @required this.userID,
    @required this.title,
    @required this.subtitle,
    @required this.time,
    this.amount,
    this.picture,
  });

  //* Passing property model to list of object
  @override
  List<Object> get props => [
    userID,
    title,
    subtitle,
    time,
    amount,
    picture,
  ];
}