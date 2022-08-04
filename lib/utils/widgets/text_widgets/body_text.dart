// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sharethechurch/utils/utils.dart';

class LargeBodyText extends StatelessWidget {
  LargeBodyText({
    Key? key,
    required this.text,
    this.textAlign = TextAlign.center,
    this.isBlue = false,
    this.fontSize = 20,
  }) : super(key: key);

  final String text;
  bool isBlue;
  TextAlign textAlign;
  double fontSize;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.ibmPlexSans(
        textStyle: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.w600,
          color: primaryColor,
        ),
      ),
    );
  }
}

class MediumBodyText extends StatelessWidget {
  MediumBodyText({
    Key? key,
    required this.text,
    this.textAlign = TextAlign.center,
    this.fontSize = 13,
    this.fontWeight = FontWeight.w500,
  }) : super(key: key);

  final String text;

  TextAlign textAlign;
  double fontSize;
  FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.kumbhSans(
        textStyle: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: primaryColor,
        ),
      ),
    );
  }
}

class SmallBodyText extends StatelessWidget {
  SmallBodyText({
    Key? key,
    required this.text,
    this.isTransparent = false,
    this.isPurple = false,
  }) : super(key: key);

  final String text;
  bool isTransparent;
  bool isPurple;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.kumbhSans(
        textStyle: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: isTransparent ? primaryColor.withOpacity(0.5) : primaryColor,
        ),
      ),
    );
  }
}
