part of 'models.dart';

class Registration {
  /// -----------------------------------------------------
  /// [Registration Class]
  /// This class is used to modeling user registration data
  /// -----------------------------------------------------

  //* Property model
  String name;
  String email;
  String password;
  List<String> selectedGenres;
  String selectedLang;
  File profileImage;

  //* Constructor model
  Registration({
    this.name = "",
    this.email = "",
    this.password = "",
    this.selectedGenres = const [],
    this.selectedLang = "",
    this.profileImage,
  });
}