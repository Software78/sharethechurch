import 'package:flutter/material.dart';
import 'package:sharethechurch/utils/utils.dart';

class IndividualSignUp extends StatefulWidget {
  const IndividualSignUp({Key? key}) : super(key: key);

  @override
  State<IndividualSignUp> createState() => _IndividualSignUpState();
}

class _IndividualSignUpState extends State<IndividualSignUp> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _usernameController;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _usernameController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
    super.dispose();
  }

  register() {
    repository.registerUser(_emailController.text, _passwordController.text,
        _usernameController.text, true);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.05),
          child: Column(
            children: [
              const SizedBox(
                height: 22,
              ),
              Image.asset(
                'assets/images/dp.jpeg',
                width: 100,
                height: 100,
              ),
              const SizedBox(
                height: 22,
              ),
              LargeBodyText(text: 'Create an account'),
              const SizedBox(
                height: 32,
              ),
              // const AuthTextFieldTitle(text: 'Full Name'),
              const SizedBox(
                height: 8,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: MediumBodyText(text: 'Full Name'),
              ),

              const SizedBox(height: 16),
              InputField(
                controller: _usernameController,
                autofocus: true,
                hintText: 'John Doe',
                keyboardType: TextInputType.text,
              ),
              const SizedBox(
                height: 16,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: MediumBodyText(text: 'Email Address'),
              ),
              const SizedBox(height: 8),

              InputField(
                controller: _emailController,
                hintText: 'johndoe@email.com',
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 16,
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
                obscureText: true,
                hintText: '********',
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.done,
              ),
              const SizedBox(
                height: 16,
              ),
              const Expanded(child: SizedBox()),
              FilledButton(text: 'Create Account', onPressed: register),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
