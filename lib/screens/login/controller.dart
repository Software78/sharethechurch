import 'package:flutter/material.dart';

import 'view.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => LoginController();
}

class LoginController extends State<LoginScreen> {
  late TextEditingController emailController;
  late TextEditingController passwordController;

  bool showPassword = false;

  toggleShowPassword() {
    setState(() {
      showPassword = !showPassword;
    });
  }

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  login() {}

  forgotPassword() {}

  @override
  Widget build(BuildContext context) {
    return LoginView(this);
  }
}
