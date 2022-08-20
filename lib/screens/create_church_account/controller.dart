import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sharethechurch/models/input/register_input.dart';

import '../../bloc/bloc.dart';
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

  bool isShowPassword = false;
  bool termsAccepted = false;

  toggleTermsAccepted() {
    setState(() {
      termsAccepted = !termsAccepted;
    });
  }

  showPassword() {
    setState(() {
      isShowPassword = !isShowPassword;
    });
  }

  registerError(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  registerLoading() {}

  registerSuccess() {
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('success')));
  }

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

  createAccount() {
    usernameController.text.isEmpty
        ? registerError('please input church name')
        : context.read<RegisterBloc>().add(
              RegisterUser(
                input: RegisterInput(
                  email: emailController.text,
                  username: usernameController.text,
                  password: passwordController.text,
                  isIndividual: false,
                ),
              ),
            );
  }

  @override
  Widget build(BuildContext context) {
    return CreateChurchAccountScreenView(this);
  }
}
