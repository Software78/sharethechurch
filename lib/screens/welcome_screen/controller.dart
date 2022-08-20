import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:sharethechurch/screens/login_or_signup/controller.dart';

import 'view.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => WelcomeController();
}

class WelcomeController extends State<WelcomeScreen> {
  getStarted() {
    Get.to(() => const LoginOrSignupScreen());
  }

  @override
  Widget build(BuildContext context) {
    return WelcomeView(this);
  }
}
