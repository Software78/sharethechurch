import 'package:flutter/material.dart';
import 'package:sharethechurch/utils/utils.dart';

class LoadingDialog extends StatelessWidget {
  const LoadingDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Dialog(
      child: SizedBox(
        height: 60,
        width: 60,
        child: Center(
          child: CircularProgressIndicator(
            color: primaryColor,
          ),
        ),
      ),
    );
  }
}
