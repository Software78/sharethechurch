import 'package:flutter/material.dart';
import 'package:sharethechurch/views/pre-auth/login_or_signup_view/login_or_signup_view.dart';

import '../../../utils/utils.dart';

class GetStartedView extends StatelessWidget {
  const GetStartedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      hasAppBar: false,
      child: Column(
        children: [
          const Expanded(
            child: SizedBox(),
          ),
          Center(
            child: Image.asset(
              'assets/images/dp.jpeg',
              width: 200,
              height: 200,
            ),
          ),
          const Expanded(
            child: SizedBox(),
          ),
          FilledButton(
            text: 'Let\'s get started',
            onPressed: () {
              navigateAndRemove(const LoginOrSignUpView());
            },
          ),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
