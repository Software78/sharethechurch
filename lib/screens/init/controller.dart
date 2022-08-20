import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:sharethechurch/screens/welcome_screen/controller.dart';

import 'view.dart';

class InitScreen extends StatefulWidget {
  const InitScreen({Key? key}) : super(key: key);

  @override
  State<InitScreen> createState() => InitController();
}

class InitController extends State<InitScreen> {
  navigate() async {
    await Future.delayed(const Duration(seconds: 2));
    Get.off(()=>const WelcomeScreen());
  }

  @override
  Widget build(BuildContext context) {
    return InitView(this);
  }
}
