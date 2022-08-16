import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_study_app/configs/themes/app_dark_theme.dart';
import 'package:flutter_firebase_study_app/configs/themes/app_light_theme.dart';
import 'package:flutter_firebase_study_app/configs/themes/current_theme.dart';
import 'package:get/get.dart';

const double _mobileScreenPadding = 25;
const double _cardBorderRadius = 10;
double get mobileScreenpadding => _mobileScreenPadding;
double get cardBorderRaduis => _cardBorderRadius;

Color customScafoldColor() {
  return Get.isDarkMode
      ? Color(0xff2e3c62)
      : Color.fromARGB(225, 221, 221, 221);
}

class UIparameters {
  static EdgeInsets get mobilePadding => EdgeInsets.all(mobileScreenpadding);
  static BorderRadius get cardBorder => BorderRadius.circular(cardBorderRaduis);
  static final light_gradient = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [primaryLightColorLight, primaryColorLight]);

  static final dark_gradient = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [primaryDarkColorDark, primaryColorDark]);

  static LinearGradient gradientColorDecider() {
    if (CurrentTheme.isDarkMode()) {
      return dark_gradient;
    } else {
      return light_gradient;
    }
  }
}
