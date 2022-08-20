import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/bloc.dart';
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: primaryColor),
        elevation: 0,
      ),
      body: BlocListener<RegisterBloc, RegisterState>(
        listener: (context, state) {
          if (state is RegisterLoading) {}
          if (state is RegisterError) {
            controller.registerError(state.message);
          }
          if (state is RegisterSuccess) {}
        },
        child: SafeArea(
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
                  obscureText: controller.termsAccepted,
                  hintText: '********',
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.done,
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Checkbox(
                      value: controller.termsAccepted,
                      activeColor: primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3),
                      ),
                      onChanged: (onChanged) {
                        controller.toggleTermsAccepted();
                      },
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.toggleTermsAccepted();
                      },
                      child: MediumBodyText(
                        textAlign: TextAlign.left,
                        text: 'Show password',
                      ),
                    ),
                    const Expanded(child: SizedBox()),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Checkbox(
                      value: controller.isChecked,
                      activeColor: primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3),
                      ),
                      onChanged: (onChanged) {
                        controller.toggleIsChecked();
                      },
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.toggleIsChecked();
                      },
                      child: MediumBodyText(
                        textAlign: TextAlign.left,
                        text: 'I attend a nondenonimational church of christ',
                      ),
                    ),
                    const Expanded(child: SizedBox()),
                  ],
                ),
                const Expanded(child: SizedBox()),
                FilledButton(
                  text: 'Create Account',
                  onPressed: () {
                    controller.isChecked
                        ? controller.showTermsDialog()
                        : controller.ensureCheck();
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
