import 'package:flutter/material.dart';

import '../mvc.dart';
import 'controller.dart';

class InitView extends StatelessView<InitScreen, InitController> {
  const InitView(InitController state, {Key? key}) : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    controller.navigate();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/dp.jpeg'),
                const SizedBox(
                  height: 30,
                ),
                const CircularProgressIndicator.adaptive(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
