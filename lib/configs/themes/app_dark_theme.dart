import 'package:flutter/material.dart';
import 'package:flutter_firebase_study_app/configs/themes/app_light_theme.dart';
import 'package:flutter_firebase_study_app/configs/themes/subtheme_data.dart';

const Color primaryDarkColorDark = Color(0xFF2e3c62);
const Color primaryColorDark = Color(0xFF99ace1);
const Color mainTextColorDark = Colors.white;

class DarkThemeClass with SubthemeData {
  buildDarkTheme() {
    final ThemeData systemDarkTheme = ThemeData.dark();

    return systemDarkTheme.copyWith(
      iconTheme: getIconTheme(),
      textTheme: getTextTheme().apply(
        bodyColor: mainTextColorDark,
        displayColor: mainTextColorDark,
      ),
    );
  }
}
