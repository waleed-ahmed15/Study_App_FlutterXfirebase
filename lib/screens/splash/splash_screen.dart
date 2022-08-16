import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_study_app/configs/themes/ui_params.dart';
import 'package:flutter_firebase_study_app/data_uploader_screen.dart';
import 'package:flutter_firebase_study_app/screens/introduction/introduction.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller =
      AnimationController(vsync: this, duration: Duration(seconds: 2))
        ..repeat();
  @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   Timer(
  //       Duration(seconds: 2),
  //       () => Navigator.push(
  //           context,
  //           MaterialPageRoute(
  //             builder: (context) => IntroductionScreen(),
  //           )));
  // }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: UIparameters.gradientColorDecider()),
          ),
          AnimatedBuilder(
            animation: _controller,
            child: Container(
              alignment: Alignment.center,
              child: Image(
                image: AssetImage('assets/images/app_splash_logo.png'),
                width: 100,
                height: 100,
              ),
            ),
            builder: (BuildContext context, Widget? child) {
              return Transform.rotate(
                angle: _controller.value * 2 * 3.14,
                child: child,
              );
            },
          ),
        ],
      ),
    );
  }
}
