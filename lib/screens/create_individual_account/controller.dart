import 'package:flutter/material.dart';

import 'view.dart';

class CreateIndividualAccountScreen extends StatefulWidget {
  const CreateIndividualAccountScreen({Key? key}) : super(key: key);

  @override
  State<CreateIndividualAccountScreen> createState() =>
      CreateIndividualAccounController();
}

class CreateIndividualAccounController
    extends State<CreateIndividualAccountScreen> {
  late TextEditingController usernameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    usernameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  createAccount() {}

  @override
  Widget build(BuildContext context) {
    return CreateIndividualAccounView(this);
  }
}
