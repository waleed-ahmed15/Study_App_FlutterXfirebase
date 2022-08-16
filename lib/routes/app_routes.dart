import 'package:flutter_firebase_study_app/controllers/question_papers/question_paper_controller.dart';
import 'package:flutter_firebase_study_app/screens/home/home_screen.dart';
import 'package:get/get.dart';

import '../screens/introduction/introduction.dart';
import '../screens/splash/splash_screen.dart';

class Approutes {
  static List<GetPage> routesList() {
    return [
      GetPage(name: '/', page: () => SplashScreen()),
      GetPage(name: '/introduction', page: () => IntroductionScreen()),
      GetPage(
          name: '/home',
          page: () => HomeScreen(),
          binding: BindingsBuilder(
            () {
              Get.put(QuestionPaperController());
            },
          ))
    ];
  }
}
