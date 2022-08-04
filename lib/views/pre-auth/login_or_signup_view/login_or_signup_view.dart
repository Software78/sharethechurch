import 'package:flutter/material.dart';
import 'package:sharethechurch/views/pre-auth/sign_up_view/sign_up_view.dart';

import '../../../utils/utils.dart';
import '../../export.dart';

class LoginOrSignUpView extends StatelessWidget {
  const LoginOrSignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(DeviceSize.deviceWidth * 0.05),
          child: Column(
            children: [
              const SizedBox(
                height: 44,
              ),
              Image.asset(
                'assets/images/dp.jpeg',
                width: 200,
                height: 200,
              ),
              const SizedBox(height: 22),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 120,
              ),
              FilledButton(
                text: 'Create an account',
                onPressed: () {
                  navigate(const SignUp());
                },
              ),
              const SizedBox(
                height: 20,
              ),
              MyOutlinedButton(
                text: 'Login',
                onPressed: () {
                  navigate(const LoginView());
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
