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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Expanded(child: SizedBox()),
            const Text(
              'Share',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w700,
                color: primaryColor,
              ),
            ),
            const Text(
              'The Church',
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w700,
                  color: primaryColor),
            ),
            const SizedBox(
              height: 10,
            ),
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
