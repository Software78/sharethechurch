// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sharethechurch/utils/utils.dart';

class WhiteButtonText extends StatelessWidget {
  WhiteButtonText({
    Key? key,
    this.fontSize = 16,
    required this.text,
    this.fontWeight = FontWeight.w500,
  }) : super(key: key);

  final String text;
  double fontSize;
  FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.kumbhSans(
          textStyle: TextStyle(
        color: Colors.white,
        fontSize: fontSize,
        fontWeight: fontWeight,
      )),
    );
  }
}

class OrangeButtonText extends StatelessWidget {
  const OrangeButtonText({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.kumbhSans(
        textStyle: const TextStyle(
          color: primaryColor,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
