import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';
import 'package:sharethechurch/models/input/register_input.dart';

import '../../bloc/bloc.dart';
import '../../utils/utils.dart';
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

  List<String> files = ['Copyright Policy', 'Disclaimer', 'Privacy Policy'];

  showTermsDialog() {
    showCupertinoModalPopup(
        context: context,
        builder: (context) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.7,
            child: Material(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  children: [
                    ExpansionTile(
                      title: Text(files[0]),
                      initiallyExpanded: true,
                      children: const [Text('')],
                    ),
                    ExpansionTile(
                      title: Text(files[1]),
                      children: const [Text('')],
                    ),
                    ExpansionTile(
                      title: Text(files[2]),
                      children: const [Text('')],
                    ),
                    const Expanded(
                      child: SizedBox(),
                    ),
                    FilledButton(
                      text: 'Accept',
                      onPressed: () {
                        Get.back();
                        createAccount();
                      },
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return CreateChurchAccountScreenView(this);
  }
}
