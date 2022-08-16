import 'package:flutter_firebase_study_app/controllers/auth_controller.dart';
import 'package:flutter_firebase_study_app/controllers/question_papers/data_uploader.dart';
import 'package:flutter_firebase_study_app/controllers/theme_controller.dart';
import 'package:flutter_firebase_study_app/services/firebase_services.dart';
import 'package:get/get.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(FirebaseServices());
    Get.put(ThemeController());
    Get.put(AuthController(), permanent: true);
  }
}
