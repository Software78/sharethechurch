import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:sharethechurch/screens/login/controller.dart';

import '../register/controller.dart';
import 'view.dart';

class LoginOrSignupScreen extends StatefulWidget {
  const LoginOrSignupScreen({Key? key}) : super(key: key);

  @override
  State<LoginOrSignupScreen> createState() => LoginOrSignupController();
}

class LoginOrSignupController extends State<LoginOrSignupScreen> {
  login() {
    Get.to(() => const LoginScreen());
  }

  signup() {
        Get.to(() => const RegisterScreen());

  }

  @override
  Widget build(BuildContext context) {
    return LoginOrSignupView(this);
  }
}
