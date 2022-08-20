import 'package:firebase_auth/firebase_auth.dart';

class LoginResponse {
  final bool status;
  final String? message;
  final UserCredential? credential;

  LoginResponse({
    required this.status,
    this.credential,
    this.message,
  });
}
