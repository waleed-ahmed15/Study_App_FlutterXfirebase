import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_study_app/configs/themes/app_light_theme.dart';
import 'package:get/get.dart';

TextStyle headingTextStyle() {
  return TextStyle(
      fontSize: Get.width * 0.04,
      fontWeight: FontWeight.bold,
      color: Get.isDarkMode
          ? Theme.of(Get.context!).textTheme.bodyText1!.color
          : Theme.of(Get.context!).primaryColor);
}

TextStyle detailsTextStyle() {
  return Get.isDarkMode
      ? TextStyle(color: Colors.white)
      : TextStyle(color: primaryColorLight);
}
