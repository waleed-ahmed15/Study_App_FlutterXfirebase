import 'package:flutter/material.dart';
import 'package:flutter_firebase_study_app/configs/themes/subtheme_data.dart';

const Color primaryLightColorLight = Color(0xFF3ac3cb);
const Color primaryColorLight = Color(0xFFf85187);
const Color mainTextColorlight = Color.fromARGB(240, 40, 40, 40);
const Color lightThemecardColor = Color.fromARGB(255, 254, 254, 255);

class LightTheme with SubthemeData {
  buildLightTheme() {
    final ThemeData system_light_theme = ThemeData.light();
    return system_light_theme.copyWith(
      primaryColor: primaryColorLight,
      iconTheme: getIconTheme(),
      cardColor: lightThemecardColor,
      textTheme: getTextTheme().apply(
        
        bodyColor: Color.fromARGB(255, 40, 40, 40),
        displayColor: Color.fromARGB(240, 40, 40, 40),
      ),
    );
  }
}
