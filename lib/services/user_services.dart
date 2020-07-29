part of 'services.dart';

class UserServices {
  /// --------------------------------------------------
  /// [User Services Class]
  /// This class is used to handling user data firestore
  /// --------------------------------------------------

  //* Instancing firestore user collection
  static CollectionReference _userCollection = Firestore.instance.collection("users");

  //* Method to saving user data to firestore
  static Future<void> updateUser(User user) async {
    _userCollection.document(user.id).setData({
      'email': user.email,
      'name': user.name,
      'profilePicture': user.profilePicture ?? "",
      'selectedGenres': user.selectedGenres,
      'selectedLanguage': user.selectedLanguage,
      'balance': user.balance,
    });
  }

  //* Method to getting user data from firestore
  static Future<User> getUser(String id) async {
    DocumentSnapshot snapshot = await _userCollection.document(id).get();

    return User(
      id,
      snapshot.data['email'],
      name: snapshot.data['name'],
      profilePicture: snapshot.data['profilePicture'],
      selectedGenres: (snapshot.data['selectedGenres'] as List).map((e) => e.toString()).toList(),
      selectedLanguage: snapshot.data['selectedLanguage'],
      balance: snapshot.data['balance'],
    );
  }
}