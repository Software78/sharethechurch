import 'package:flutter/material.dart';

import '../../utils/utils.dart';
import '../mvc.dart';
import 'controller.dart';

class RegisterView extends StatelessView<RegisterScreen, RegisterController> {
  const RegisterView(RegisterController state, {Key? key})
      : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const Expanded(child: SizedBox()),
              LargeBodyText(text: 'Create an account for:'),
              const SizedBox(
                height: 16,
              ),
              FilledButton(
                text: 'Individual',
                onPressed: () {
                  controller.createIndividualAccount();
                },
              ),
              const SizedBox(
                height: 16,
              ),
              MyOutlinedButton(
                text: 'Church',
                onPressed: () {
                  controller.createChurchAccount();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
