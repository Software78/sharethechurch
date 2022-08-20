import 'package:flutter/material.dart';

import 'view.dart';

class CreateChurchAccountScreen extends StatefulWidget {
  const CreateChurchAccountScreen({Key? key}) : super(key: key);

  @override
  State<CreateChurchAccountScreen> createState() =>
      CreateChurchAccountScreenController();
}

class CreateChurchAccountScreenController
    extends State<CreateChurchAccountScreen> {
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
    return CreateChurchAccountScreenView(this);
  }
}
