import 'package:flutter/material.dart';
import 'package:sharethechurch/utils/utils.dart';
import 'package:sharethechurch/views/pre-auth/sign_up_view/church_sign_up/church_sign_up_view/church_sign_up_view.dart';
import 'package:sharethechurch/views/pre-auth/sign_up_view/individual_sign_up/individual_sign_up.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      hasAppBar: false,
      child: Column(
        children: [
          const Expanded(child: SizedBox()),
          Image.asset(
            'assets/images/dp.jpeg',
            width: 200,
            height: 200,
          ),
          const SizedBox(
            height: 52,
          ),
          LargeBodyText(text: 'Create an account for:'),
          const SizedBox(
            height: 52,
          ),
          FilledButton(
            text: 'Individual',
            onPressed: () {
              navigate(const IndividualSignUp());
            },
          ),
          const SizedBox(
            height: 16,
          ),
          MyOutlinedButton(
            text: 'Church',
            onPressed: () {
              navigate(const ChurchSignUp());
            },
          ),
          const Expanded(child: SizedBox()),
        ],
      ),
    );
  }
}
