import 'package:flutter/material.dart';
import 'package:sharethechurch/utils/utils.dart';

import '../mvc.dart';
import 'controller.dart';

class WelcomeView extends StatelessView<WelcomeView, WelcomeController> {
  const WelcomeView(WelcomeController state, {Key? key})
      : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: Column(
            children: [
              const Expanded(child: SizedBox()),
              Image.asset('assets/images/dp.jpeg'),
              const Expanded(child: SizedBox()),
              FilledButton(
                text: 'Let\'s get started',
                onPressed: () {
                  controller.getStarted();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
