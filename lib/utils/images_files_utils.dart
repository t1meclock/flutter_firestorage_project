import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fstore/models/image_file.dart' as models;

import '../models/message_status.dart';
import 'firestore_utils.dart';

class ImageFileUtils {
  static ImageFileUtils get instanse => ImageFileUtils();

  CollectionReference<Map<String, dynamic>> get imageCollection =>
      FireStoreUtils.firestoreUtils.collection("images");

  Future<MessageStatus> create(
      models.ImageFile imagefile, String filename, String path) async {
    return imageCollection
        .doc(filename)
        .set(imagefile.toMap(filename, path))
        .then((value) => MessageStatus())
        .catchError((error) => MessageStatus(errorMessage: error));
  }

  Stream<List<models.ImageFile?>> get(String uid) {
    return imageCollection.snapshots().map((snapshot) => snapshot.docs
        .map((doc) => models.ImageFile.fromJson(doc.data(), uid))
        .toList());
  }

  Future<models.ImageFile> getImageFile(String filename) async {
    final data = await imageCollection.doc(filename).get().then(
        (DocumentSnapshot documentSnapshot) =>
            {documentSnapshot.data() as Map<String, dynamic>});
    Map<String, dynamic> firstImageFile = data.first;
    models.ImageFile imagefile = models.ImageFile(
        size: firstImageFile["size"],
        fileExt: firstImageFile["fileExt"],
        filename: firstImageFile["filename"]);
    return imagefile;
  }

  Future<void> update (
      models.ImageFile imagefile, String filename, String path) async {
    delete(filename);
    return create(imagefile, filename, path).then((value) => value);
  }

  Future<MessageStatus> delete (String filename) async {
    return imageCollection
        .doc(filename)
        .delete()
        .then((value) => MessageStatus())
        .catchError((error) => MessageStatus(errorMessage: error));
  }
}
