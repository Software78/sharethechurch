import 'package:flutter/material.dart';
import 'package:sharethechurch/views/pre-auth/sign_up_view/church_sign_up/church_location_view/church_location_view.dart';

import '../../../../../utils/utils.dart';

class ChurchSignUp extends StatefulWidget {
  const ChurchSignUp({Key? key}) : super(key: key);

  @override
  State<ChurchSignUp> createState() => _ChurchSignUpState();
}

class _ChurchSignUpState extends State<ChurchSignUp> {
  late TextEditingController _usernameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
    _emailController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _emailController.dispose();
    _usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      hasAppBar: false,
      child: Column(
        children: [
          const SizedBox(height: 22),
          Image.asset(
            'assets/images/dp.jpeg',
            width: 100,
            height: 100,
          ),
          const SizedBox(height: 22),
          LargeBodyText(text: 'Create an account\nfor your church'),
          const SizedBox(height: 16),
          Align(
            alignment: Alignment.centerLeft,
            child: MediumBodyText(text: 'Church Name'),
          ),
          const SizedBox(height: 8),
          InputField(
            autofocus: true,
            controller: _usernameController,
            hintText: 'Jesus\' Sanctuary',
            keyboardType: TextInputType.text,
          ),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.centerLeft,
            child: MediumBodyText(text: 'Church Email'),
          ),
          const SizedBox(
            height: 8,
          ),
          InputField(
            controller: _emailController,
            hintText: 'jesussanctuary@email.com',
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(
            height: 8,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: MediumBodyText(text: 'Password'),
          ),
          const SizedBox(
            height: 8,
          ),
          InputField(
            controller: _passwordController,
            hintText: '********',
            obscureText: true,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.done,
          ),
          const SizedBox(
            height: 8,
          ),
          const Expanded(child: SizedBox()),
          FilledButton(
            text: 'Signup',
            onPressed: () async {
              await repository.registerUser(_emailController.text,
                  _passwordController.text, _usernameController.text, false);
              navigate(const ChurchLocation(states: []));
            },
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
