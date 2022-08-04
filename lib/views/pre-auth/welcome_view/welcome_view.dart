import 'package:flutter/material.dart';
import 'package:sharethechurch/views/pre-auth/get_started_view/get_started_view.dart';

import '../../../utils/utils.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DeviceSize.set(MediaQuery.of(context).size.width);
    navigateAndRemoveAfterDelay(const GetStartedView());
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Text(
              'WELCOME',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: primaryColor,
              ),
            ),
            SizedBox(
              height: 60,
              width: double.infinity,
            ),
            CircularProgressIndicator(
              color: primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
