import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';
import 'package:sharethechurch/models/input/login_input.dart';
import 'package:sharethechurch/screens/forgot_password/controller.dart';

import '../../bloc/bloc.dart';
import 'view.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => LoginController();
}

class LoginController extends State<LoginScreen> {
  late TextEditingController emailController;
  late TextEditingController passwordController;

  bool showPassword = true;

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

  login() {
    context.read<LoginBloc>().add(
          LoginUser(
            input: LoginInput(
              username: emailController.text,
              password: passwordController.text,
            ),
          ),
        );
  }

  loginLoading() {
    print('loading');
  }

  loginSuccess() {
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('login successful')));
  }

  loginError(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  forgotPassword() {
    Get.to(() => const ForgotPasswordScreen());
  }

  @override
  Widget build(BuildContext context) {
    return LoginView(this);
  }
}
