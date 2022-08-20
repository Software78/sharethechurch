import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sharethechurch/screens/welcome_screen/controller.dart';

import '../../bloc/bloc.dart';
import '../mvc.dart';
import 'controller.dart';

class InitView extends StatelessView<InitScreen, InitController> {
  const InitView(InitController state, {Key? key}) : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<UserBloc, UserState>(
        listener: (context, state) {
          if (state is UserIsChurch) {}
          if (state is UserIsIndividual) {}
          if (state is UserIsNone) {
            controller.navigate(const WelcomeScreen());
          }
        },
        child: SafeArea(
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
      ),
    );
  }
}
