import 'package:flutter/material.dart';
import 'package:sharethechurch/utils/utils.dart';

import '../mvc.dart';
import 'controller.dart';

class LoginOrSignupView
    extends StatelessView<LoginOrSignupScreen, LoginOrSignupController> {
  const LoginOrSignupView(LoginOrSignupController state, {Key? key})
      : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            const Expanded(child: SizedBox()),
            FilledButton(
              text: 'Create an account',
              onPressed: () {
                controller.signup();
              },
            ),
            const SizedBox(
              height: 20,
            ),
            MyOutlinedButton(
              text: 'Login',
              onPressed: () {
                controller.login();
              },
            ),
          ],
        ),
      )),
    );
  }
}
