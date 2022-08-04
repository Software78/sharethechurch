import 'package:flutter/material.dart';

import '../../../utils/utils.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  late TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  resetPassword() async {
   await repository.resetPassword(_controller.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: DeviceSize.deviceWidth * 0.05),
          child: Column(
            children: [
              const SizedBox(
                height: 44,
              ),
              Image.asset(
                'assets/images/dp.jpeg',
                width: 100,
                height: 100,
              ),
              const SizedBox(
                height: 22,
              ),
              LargeBodyText(text: 'Password Recovery'),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.info,
                    color: primaryColor,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: SmallBodyText(
                        text: 'Input the email you registered with'),
                  ),
                ],
              ),
              const SizedBox(
                height: 32,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: MediumBodyText(text: 'Email'),
              ),
              const SizedBox(
                height: 8,
              ),
              InputField(
                autofocus: true,
                hintText: 'johndoe@email.com',
                controller: _controller,
                keyboardType: TextInputType.text,
              ),
              const Expanded(child: SizedBox()),
              FilledButton(
                text: 'Continue',
                onPressed: resetPassword,
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
