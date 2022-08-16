import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

mixin SubthemeData {
  TextTheme getTextTheme() {
    return GoogleFonts.quicksandTextTheme(
      TextTheme(
          bodyText1: TextStyle(
            fontWeight: FontWeight.w400,
          ),
          bodyText2: TextStyle(
            fontWeight: FontWeight.w500,
          )),
    );
  }

  IconThemeData getIconTheme() {
    return IconThemeData(color: Colors.white, size: 16);
  }
}
