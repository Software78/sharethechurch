import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sharethechurch/utils/utils.dart';

import '../../bloc/bloc.dart';
import '../mvc.dart';
import 'controller.dart';

class ForgotPasswordView
    extends StatelessView<ForgotPasswordScreen, ForgotPasswordController> {
  const ForgotPasswordView(ForgotPasswordController state, {Key? key})
      : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(color: primaryColor),
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: BlocListener<PasswordresetBloc, PasswordresetState>(
          listener: (context, state) {
            if (state is PasswordresetError) {
              controller.error(state.message);
            }
            if (state is PasswordresetLoading) {
              controller.loading();
            }
            if (state is PasswordresetSuccess) {
              controller.success();
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const Expanded(child: SizedBox()),
                Align(
                  alignment: Alignment.centerLeft,
                  child: MediumBodyText(text: 'Email Address'),
                ),
                const SizedBox(
                  height: 10,
                ),
                InputField(
                  controller: controller.controller,
                  autofocus: true,
                ),
                const SizedBox(
                  height: 20,
                ),
                FilledButton(
                  text: 'Reset Password',
                  onPressed: () {
                    controller.resetPassword();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
