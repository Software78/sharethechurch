import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/bloc.dart';
import '../../utils/utils.dart';
import '../mvc.dart';
import 'controller.dart';

class LoginView extends StatelessView<LoginScreen, LoginController> {
  const LoginView(LoginController state, {Key? key}) : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginError) {
            controller.loginError(state.response.message.toString());
          }
          if (state is LoginSuccess) {
            controller.loginSuccess();
          }
          if (state is LoginLoading) {
            controller.loginLoading();
          }
        },
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
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
                  controller: controller.emailController,
                  autofocus: true,
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
                  controller: controller.passwordController,
                  obscureText: controller.showPassword,
                  hintText: '........',
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.done,
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Checkbox(
                      value: !controller.showPassword,
                      activeColor: primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3),
                      ),
                      onChanged: (onChanged) {
                        controller.toggleShowPassword();
                      },
                    ),
                    MediumBodyText(
                      text: 'Show Password',
                    ),
                    const Expanded(child: SizedBox()),
                    GestureDetector(
                      onTap: () {
                        controller.forgotPassword();
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
                  onPressed: () {
                    controller.login();
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
