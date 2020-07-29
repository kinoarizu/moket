part of 'models.dart';

class User extends Equatable {
  /// ----------------------------------------
  /// [User Class]
  /// This class is used to modeling user data
  /// ----------------------------------------

  //* Property model
  final String id;
  final String email;
  final String name;
  final String profilePicture;
  final List<String> selectedGenres;
  final String selectedLanguage;
  final int balance;

  //* Constructor model
  User(
    this.id,
    this.email, {
    this.name,
    this.profilePicture,
    this.selectedGenres,
    this.selectedLanguage,
    this.balance,
  });

  //* Method to override property value of model
  User copyWith({
    String name,
    String profilePicture,
    int balance,
  }) => User(
    this.id,
    this.email,
    name: name ?? this.name,
    profilePicture: profilePicture ?? this.profilePicture,
    selectedGenres: this.selectedGenres,
    selectedLanguage: this.selectedLanguage,
    balance: balance ?? this.balance,
  );

  //* Override 'toString' method to generate user as constatnt string
  @override
  String toString() {
    return "[$id] - $name, $email";
  }

  //* Passing property model to list of object
  @override
  List<Object> get props => [
    id,
    email,
    name,
    profilePicture,
    selectedGenres,
    selectedLanguage,
    balance,
  ];
}
