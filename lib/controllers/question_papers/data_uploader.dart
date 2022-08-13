import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_firebase_study_app/firebase_ref/references.dart';
import 'package:flutter_firebase_study_app/models/question_paper_model.dart';
import 'package:get/get.dart';

class DataUploader extends GetxController {
  @override
  void onReady() {
    uploadData();
    super.onReady();
  }

  Future<void> uploadData() async {
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
        
        
      }
    }

    await batch.commit();
  }
}
