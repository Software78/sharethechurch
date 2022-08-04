// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:sharethechurch/utils/utils.dart';

class InputField extends StatelessWidget {
  InputField({
    Key? key,
    this.autofocus = false,
    this.hintText = '',
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    required this.controller,
    this.obscureText,
    this.maxLines = 1,
  }) : super(key: key);

  bool autofocus;
  TextInputType keyboardType;
  String hintText;
  TextInputAction textInputAction;
  TextEditingController controller;
  bool? obscureText;

  int? maxLines;

  @override
  TextField build(BuildContext context) {
    return TextField(
      obscureText: obscureText ?? false,
      maxLines: maxLines,
      controller: controller,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      autofocus: autofocus,
      cursorColor: primaryColor,
      decoration: InputDecoration(
        hintText: hintText,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(
            color: primaryColor,
            width: 2,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(
            color: primaryColor,
            width: 1,
          ),
        ),
      ),
    );
  }
}



class MultiLineTextField extends StatelessWidget {
  const MultiLineTextField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      cursorColor: primaryColor,
      maxLines: 3,
      maxLength: 80,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(
            color: primaryColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(
            color: primaryColor,
            width: 2,
          ),
        ),
      ),
    );
  }
}
