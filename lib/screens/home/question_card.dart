import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_firebase_study_app/configs/themes/app_icon.dart';
import 'package:flutter_firebase_study_app/configs/themes/app_light_theme.dart';
import 'package:flutter_firebase_study_app/configs/themes/custom_text_styles.dart';
import 'package:flutter_firebase_study_app/controllers/theme_controller.dart';
import 'package:flutter_firebase_study_app/widgets/icon_text.dart';
import 'package:get/get.dart';
import '../../models/question_paper_model.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({Key? key, required this.model}) : super(key: key);
  final QuestionPaperModel model;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).cardColor),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, top: 20),
        child: Stack(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(Get.width * 0.03),
                  child: ColoredBox(
                    color: primaryColorLight.withOpacity(0.3),
                    child: SizedBox(
                      width: Get.width * 0.15,
                      height: Get.width * 0.15,
                      child: CachedNetworkImage(
                        errorWidget: (context, url, error) =>
                            Image.asset("assets/images/app_splash_logo.png"),
                        placeholder: (context, url) => Container(
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                        imageUrl: model.imageUrl,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          model.title!,
                          style: headingTextStyle(),
                        ),
                        SizedBox(
                          height: Get.height * 0.01,
                        ),
                        Text(
                          model.description!,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            IconText(
                                icon: Icon(Icons.help_center_outlined,
                                    color: Get.isDarkMode
                                        ? Colors.white
                                        : primaryColorLight),
                                text: "${model.questionCount} Quizes"),
                            SizedBox(
                              width: 10,
                            ),
                            IconText(
                                icon: Icon(Icons.watch_later_sharp,
                                    color: Get.isDarkMode
                                        ? Colors.white
                                        : primaryColorLight),
                                text:
                                    "${(model.timeSeconds! / 60).toInt()} Mins"),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  decoration: BoxDecoration(
                      color: primaryColorLight,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10))),
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: Icon(
                    AppIcons.trophyIcon,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
