import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_firebase_study_app/configs/themes/app_icon.dart';
import 'package:flutter_firebase_study_app/configs/themes/custom_text_styles.dart';
import 'package:flutter_firebase_study_app/configs/themes/ui_params.dart';
import 'package:flutter_firebase_study_app/controllers/question_papers/question_paper_controller.dart';
import 'package:flutter_firebase_study_app/firebase_ref/references.dart';
import 'package:flutter_firebase_study_app/screens/home/question_card.dart';
import 'package:flutter_firebase_study_app/widgets/content_area.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuestionPaperController _questionPaperController = Get.find();
    List papersData = _questionPaperController.questionPapers.value;

    return Scaffold(
      body: Container(
        decoration:
            BoxDecoration(gradient: UIparameters.gradientColorDecider()),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      AppIcons.menuIcon,
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Icon(
                          AppIcons.handIcon,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Hello Friend",
                          style:
                              detailsTextStyle().copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Hello, What you want to learn today?",
                      style: TextStyle(fontSize: 22, color: Colors.white),
                    ),
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    ContentArea(
                      addPadding: false,
                      child: Obx(
                        () => ListView.separated(
                          padding: UIparameters.mobilePadding,
                          shrinkWrap: true,
                          itemCount:
                              _questionPaperController.questionPapers.length +
                                  1,
                          separatorBuilder: (BuildContext context, int index) {
                            return QuestionCard(
                                model: _questionPaperController
                                    .questionPapers[index]);
                          },
                          itemBuilder: (BuildContext context, int index) {
                            return SizedBox(
                              height: 20,
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
