import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sharethechurch/models/input/register_input.dart';
import 'package:sharethechurch/utils/utils.dart';

import '../../bloc/bloc.dart';
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

  bool isChecked = false;
  bool termsAccepted = false;

  toggleTermsAccepted() {
    setState(() {
      termsAccepted = !termsAccepted;
    });
  }

  toggleIsChecked() {
    setState(() {
      isChecked = !isChecked;
    });
  }

  ensureCheck() {
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please check the box to continue')));
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
    context.read<RegisterBloc>().add(
          RegisterUser(
            input: RegisterInput(
                email: emailController.text,
                username: usernameController.text,
                password: passwordController.text,
                isIndividual: true),
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return CreateIndividualAccounView(this);
  }
}
