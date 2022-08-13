import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_firebase_study_app/firebase_ref/loading_status.dart';
import 'package:flutter_firebase_study_app/firebase_ref/references.dart';
import 'package:flutter_firebase_study_app/models/question_paper_model.dart';
import 'package:get/get.dart';

class DataUploader extends GetxController {
  @override
  void onReady() {
    uploadData();
    super.onReady();
  }

  var currentStatus = LoadingStatus.loading.obs;

  Future<void> uploadData() async {
    currentStatus.value = LoadingStatus.loading;
    final firestore = FirebaseFirestore.instance;
    final manifestContent = await DefaultAssetBundle.of(Get.context!)
        .loadString("AssetManifest.json");
    final Map<String, dynamic> assetManifestMap = jsonDecode(manifestContent);

    final papersInAssets = assetManifestMap.keys.where(
      (element) =>
          element.startsWith('assets/DB/papers') && element.contains('.json'),
    );

    // print(papersInAssets);
    List<QuestionPaperModel> questionPapers = [];
    for (var paper in papersInAssets) {
      var paperData = await rootBundle.loadString(paper);
      questionPapers.add(QuestionPaperModel.fromJson(jsonDecode(paperData)));
    }
    // print(questionPapers[0].id);
    var batch = firestore.batch();
    for (var paper in questionPapers) {
      batch.set(questionPaperREF.doc(paper.id), {
        'title': paper.title,
        'image_url': paper.imageUrl,
        'description': paper.description,
        'time_seconds': paper.timeSeconds,
        'questions_count': paper.questions == null ? 0 : paper.questions!.length
      });

      for (var question in paper.questions!) {
        final questionPath = QuestionREF(
            paperId: paper.id.toString(), QuestionId: question.id.toString());
        batch.set(questionPath, {
          'question': question.question,
          'correct_answer': question.correctAnswer
        });
        for (var answer in question.answers!) {
          final answerPath = questionPaperREF
              .doc(paper.id)
              .collection("Questions")
              .doc(question.id)
              .collection('Answers')
              .doc(answer.identifier);
          batch.set(answerPath, {
            "identifier": answer.identifier,
            "Answer": answer.answer,
          });
        }
      }
    }

    await batch.commit();
    currentStatus.value = LoadingStatus.completed;
  }
}
