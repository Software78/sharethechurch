import 'package:flutter/material.dart';
import 'package:sharethechurch/views/pre-auth/reset_password_view/reset_password_view.dart';

import '../../../utils/utils.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late TextEditingController _emailController;

  late TextEditingController _passwordController;
  bool showPassword = true;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  loginUser() async {
    await repository.loginUser(
      _emailController.text,
      _passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: DeviceSize.deviceWidth * 0.05,
          ),
          child: Column(
            children: [
              const SizedBox(height: 44),
              Image.asset(
                'assets/images/dp.jpeg',
                width: 100,
                height: 100,
              ),
              const SizedBox(height: 22),
              LargeBodyText(text: 'Welcome back'),
              const SizedBox(height: 32),
              Align(
                alignment: Alignment.centerLeft,
                child: MediumBodyText(text: 'Email Address'),
              ),
              const SizedBox(height: 16),
              InputField(
                controller: _emailController,
                // autofocus: true,
                hintText: 'johndoe@email.com',
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),
              Align(
                alignment: Alignment.centerLeft,
                child: MediumBodyText(text: 'Password'),
              ),
              const SizedBox(height: 8),
              InputField(
                controller: _passwordController,
                obscureText: showPassword,
                hintText: '........',
                keyboardType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.done,
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Checkbox(
                    value: !showPassword,
                    activeColor: primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3),
                    ),
                    onChanged: (onChanged) {
                      setState(() {
                        showPassword = !onChanged!;
                      });
                    },
                  ),
                  MediumBodyText(
                    text: 'Show Password',
                  ),
                  const Expanded(child: SizedBox()),
                  GestureDetector(
                    onTap: () {
                      navigate(const ResetPassword());
                    },
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: MediumBodyText(
                        text: 'Forgot Password?',
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                ],
              ),
              const Expanded(child: SizedBox()),
              FilledButton(
                text: 'Login',
                onPressed: loginUser,
              ),
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
