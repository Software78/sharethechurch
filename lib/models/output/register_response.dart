import 'package:firebase_auth/firebase_auth.dart';

class RegisterResponse {
  final String? message;
  final bool status;
  final UserCredential? credential;

  RegisterResponse({
    required this.status,
    this.message,
    this.credential,
  });

}
