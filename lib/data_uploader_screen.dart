import 'package:flutter/material.dart';
import 'package:flutter_firebase_study_app/controllers/question_papers/data_uploader.dart';
import 'package:get/get.dart';

class DataUploaderScreen extends StatelessWidget {
  DataUploaderScreen({Key? key}) : super(key: key);

  DataUploader controller = Get.put(DataUploader());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Uploading"),
      ),
    );
  }
}
