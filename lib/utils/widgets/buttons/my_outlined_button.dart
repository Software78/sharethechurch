// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:sharethechurch/utils/utils.dart';

class MyOutlinedButton extends StatelessWidget {
  MyOutlinedButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.height = 48,
  }) : super(key: key);

  final String text;
  final Function()? onPressed;

  double height;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: double.infinity,
      height: height,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
        side: const BorderSide(
          color: primaryColor,
          width: 2,
        ),
      ),
      onPressed: onPressed,
      child: OrangeButtonText(
        text: text,
      ),
    );
  }
}
