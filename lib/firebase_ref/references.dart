import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

final fireStore = FirebaseFirestore.instance;
final questionPaperREF = fireStore.collection("questionPapers");

DocumentReference QuestionREF(
        {required String paperId, required String QuestionId}) =>
    questionPaperREF.doc(paperId).collection("Questions").doc(QuestionId);

