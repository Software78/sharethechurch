import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:sharethechurch/screens/create_church_account/controller.dart';
import 'package:sharethechurch/screens/create_individual_account/controller.dart';

import 'view.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => RegisterController();
}

class RegisterController extends State<RegisterScreen> {
  createIndividualAccount() {
    Get.to(() => const CreateIndividualAccountScreen());
  }

  createChurchAccount() {
    Get.to(() => const CreateChurchAccountScreen());
  }

  @override
  Widget build(BuildContext context) {
    return RegisterView(this);
  }
}
