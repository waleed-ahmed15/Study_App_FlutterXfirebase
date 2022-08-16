import 'dart:async';

import 'package:get/get.dart';

class AuthController extends GetxController {
  @override
  void onReady() {
    authInit();
    // TODO: implement onReady
    super.onReady();
  }

  void authInit() async {
    await Future.delayed(Duration(seconds: 2));
    NavigationToIntroScreen();
  }

  void NavigationToIntroScreen() {
    Get.offAllNamed('/introduction');
  }
}
