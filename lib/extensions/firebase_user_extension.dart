part of 'extensions.dart';

extension FirebaseUserExtension on FirebaseUser {
  /// -------------------------------------------------------------
  /// [FIREBASE USER EXTENSION]
  /// Used to make additional method/getter from FirebaseUser class
  /// -------------------------------------------------------------

  //* Method to converting user data to user model
  User convertToUser({
    String name = "No Name",
    List<String> selectedGenres = const [],
    String selectedLanguage = "English",
    int balance = 50000,
  }) => User(
    this.uid,
    this.email,
    name: name,
    selectedGenres: selectedGenres,
    selectedLanguage: selectedLanguage,
    balance: balance,
  );

  //* Method to getting user data from firestore
  Future<User> fromFireStore() async => await UserServices.getUser(this.uid);
}
