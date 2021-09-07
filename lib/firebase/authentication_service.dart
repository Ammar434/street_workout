import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  AuthenticationService(this._firebaseAuth);
  final FirebaseAuth _firebaseAuth;
  Stream<User?>? get authStateChanged => _firebaseAuth.authStateChanges();
  Future<String?> signIn(
      {required String email, required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return "Signed In";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<String?> signUp(
      {required String email, required String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return "Signed In";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future signOut() async {
    try {
      await _firebaseAuth.signOut();
      return "Signed In";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }
}
