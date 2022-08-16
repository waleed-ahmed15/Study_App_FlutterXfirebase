import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_firebase_study_app/firebase_ref/references.dart';
import 'package:flutter_firebase_study_app/models/question_paper_model.dart';
import 'package:flutter_firebase_study_app/services/firebase_services.dart';
import 'package:get/get.dart';

class QuestionPaperController extends GetxController {
  final paperImagesUrls = <String>[].obs;
  final questionPapers = <QuestionPaperModel>[].obs;

  @override
  void onReady() {
    getQuestionPaperImages();
    super.onReady();
  }

  Future<void> getQuestionPaperImages() async {
    List<String> paperImagesName = [
      'biology',
      'maths',
      'physics',
      'chemistry',
      'chemistry',
    ];

    try {
      QuerySnapshot<Map<String, dynamic>> data = await questionPaperREF.get();
      print('1');

      final papersList = data.docs
          .map((paper) => QuestionPaperModel.fromSnapShot(paper))
          .toList();
      print('11');
      questionPapers.assignAll(papersList);

      for (var paper in papersList) {
        final paperImageUrl =
            await Get.find<FirebaseServices>().getImage(paper.title);
        paper.imageUrl = paperImageUrl!;
      }
      questionPapers.assignAll(papersList);
    } catch (e) {
      print('in error of questionaPaper controller');
      print(e);
    }
  }
}
