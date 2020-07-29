part of 'services.dart';

class AuthServices {
  /// -------------------------------------------------------
  /// [Auth Services Class]
  /// This class is used to handling firebase authentication
  /// -------------------------------------------------------

  //* Instancing firebase authentication SDK
  static FirebaseAuth _auth = FirebaseAuth.instance;

  //* Method to create a new user account
  static Future<SignInSignUpResult> signUp(String email, String name, String password, List<String> selectedGenres, String selectedLanguage) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      User user = result.user.convertToUser(
        name: name,
        selectedGenres: selectedGenres,
        selectedLanguage: selectedLanguage,
      );

      await UserServices.updateUser(user);

      return SignInSignUpResult(user: user);
    }
    catch (e) {
      return SignInSignUpResult(message: e.toString().split(',')[1].trim());
    }
  }

  //* Method to sign in a user account
  static Future<SignInSignUpResult> signIn(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      User user = await result.user.fromFireStore();

      return SignInSignUpResult(user: user);
    }
    catch (e) {
      return SignInSignUpResult(message: e.toString().split(',')[1].trim());
    }
  }

  //* Method to request reset password link
  static Future<void> resetPassword(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

  //* Method to sign out a user account
  static Future<void> signOut() async {
    await _auth.signOut();
  }

  //* Method to listen user authentication state from firebase
  static Stream<FirebaseUser> get userStream => _auth.onAuthStateChanged;
}

//* Class to generate result authentication result that contain user & message
class SignInSignUpResult {
  final User user;
  final String message;

  SignInSignUpResult({this.user, this.message});
}