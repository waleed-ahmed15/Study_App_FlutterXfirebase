import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_study_app/bindings/initial_bindings.dart';
import 'package:flutter_firebase_study_app/configs/themes/app_dark_theme.dart';
import 'package:flutter_firebase_study_app/configs/themes/app_light_theme.dart';
import 'package:flutter_firebase_study_app/controllers/theme_controller.dart';
import 'package:flutter_firebase_study_app/data_uploader_screen.dart';
import 'package:flutter_firebase_study_app/routes/app_routes.dart';
import 'package:flutter_firebase_study_app/screens/home/home_screen.dart';
import 'package:flutter_firebase_study_app/screens/splash/splash_screen.dart';
import 'package:get/get.dart';
import 'firebase_options.dart';

// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   InitialBinding().dependencies();
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       theme: Get.find<ThemeController>().LightThemedata,
//       darkTheme: Get.find<ThemeController>().darkthemedata,

//       themeMode: ThemeMode.light, // home: SplashScreen(),
//       getPages: Approutes.routesList(),
//     );
//   }
// }

// this conde is uploading data to firebase

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  InitialBinding().dependencies();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    theme: Get.find<ThemeController>().LightThemedata,
    darkTheme: Get.find<ThemeController>().darkthemedata,

    themeMode: ThemeMode.light, // home: SplashScreen(),
    getPages: Approutes.routesList(),
  ));
}
