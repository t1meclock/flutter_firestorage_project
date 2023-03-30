import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/message_status.dart';
import '../models/user.dart' as models;
import '../utils/firestore_utils.dart';

class UserUtils {
  static UserUtils get instanse => UserUtils();

  CollectionReference<Map<String, dynamic>> get userCollection =>
      FireStoreUtils.firestoreUtils.collection("users");

  Future<MessageStatus> create(String login, String password, String uid) async {
    return userCollection
        .doc(uid)
        .set(models.User(login: login, password: password).toJson())
        .then((value) => MessageStatus())
        .catchError((error) => MessageStatus(errorMessage: error));
  }

  Stream<List<models.User>> get() {
    return userCollection.snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => models.User.fromJson(doc.data())).toList());
  }

  Future<models.User> getUser(String uid) async {
    final data = await userCollection.doc(uid).get().then((DocumentSnapshot documentSnapshot) => {
      documentSnapshot.data() as Map<String, dynamic>
    });
    Map<String, dynamic> firstUser = data.first;
    models.User user = models.User(login: firstUser["login"], password: firstUser["password"]);
    return user;
  }

  Future<MessageStatus> update(String login, String password, String uid) async {
    return userCollection
        .doc(uid)
        .set(models.User(login: login, password: password).toJson())
        .then((value) => MessageStatus())
        .catchError((error) => MessageStatus(errorMessage: error));
  }

  Future<MessageStatus> delete(String uid) async {
    return userCollection
        .doc(uid)
        .delete()
        .then((value) => MessageStatus())
        .catchError((error) => MessageStatus(errorMessage: error));
  }
}
