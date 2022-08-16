import 'package:get/get.dart';
import 'package:firebase_storage/firebase_storage.dart';

//create a reference from firebase storage
Reference get firebaseStrogeREF => FirebaseStorage.instance.ref();

class FirebaseServices extends GetxService {
  Future<String?> getImage(String? imgName) async {
    if (imgName == null) {
      return null;
    }
    try {
      Reference urlREf = await firebaseStrogeREF
          .child("question_paper_images")
          .child("${imgName.toLowerCase()}.png");
      String imgUrl = await urlREf.getDownloadURL();
      print('here');
      print(imgUrl);
      return imgUrl;
    } catch (e) {
      print('error in services');
      print(e);
      return null;
    }
  }
}
