import 'package:flutter/material.dart';
import 'package:flutter_firebase_study_app/configs/themes/ui_params.dart';
import 'package:flutter_firebase_study_app/widgets/icon_button.dart';
import 'package:get/get.dart';

class IntroductionScreen extends StatelessWidget {
  const IntroductionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration:
            BoxDecoration(gradient: UIparameters.gradientColorDecider()),
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.width * 0.02),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.star,
                size: 65,
                // color: Colors.red,
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              Text(
                "This is a study app which i am building for my prepration of flutter and firebase so that i can continue to make more \n  amazing apps",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              SizedBox(
                height: Get.height * 0.04,
              ),
              PressableIconButton(
                child: Icon(Icons.arrow_forward),
                onTap: (() {
                  Get.offAllNamed('/home');
                }),
                color: Colors.amber,
              )
            ],
          ),
        ),
      ),
    );
  }
}
