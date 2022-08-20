import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserCredential> loginUser(String email, String password) async {
    return await _auth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  Future<UserCredential> registerUser(String email, String password) async {
    return await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
  }


  logout() async {
    await _auth.signOut();
  }

  forgotPassword(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }
}
