import 'package:flutter/material.dart';
import 'package:flutter_firebase_study_app/configs/themes/app_dark_theme.dart';
import 'package:flutter_firebase_study_app/configs/themes/app_light_theme.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  late ThemeData _darkTheme;
  late ThemeData _lightTheme;

  @override
  void onInit() {
    // TODO: implement onInit
    initializeThemeData();
    super.onInit();
  }

  void initializeThemeData() {
    _darkTheme = DarkThemeClass().buildDarkTheme();
    _lightTheme = LightTheme().buildLightTheme();
  }

  ThemeData get LightThemedata => _lightTheme;
  ThemeData get darkthemedata => _darkTheme;
}
