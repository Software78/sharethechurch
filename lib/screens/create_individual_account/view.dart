import 'package:flutter/material.dart';

import '../../utils/utils.dart';
import '../mvc.dart';
import 'controller.dart';

class CreateIndividualAccounView extends StatelessView<
    CreateIndividualAccountScreen, CreateIndividualAccounController> {
  const CreateIndividualAccounView(CreateIndividualAccounController state,
      {Key? key})
      : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
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
                controller: controller.usernameController,
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
                controller: controller.emailController,
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
                controller: controller.passwordController,
                obscureText: true,
                hintText: '********',
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.done,
              ),
              const SizedBox(
                height: 16,
              ),
              const Expanded(child: SizedBox()),
              FilledButton(
                text: 'Create Account',
                onPressed: () {
                  controller.createAccount();
                },
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
