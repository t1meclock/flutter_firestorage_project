import 'package:firebase_auth/firebase_auth.dart';
import '../utils/user_utils.dart';

import '../models/message_status.dart';

class FireBaseUtils {

  static FirebaseAuth get firebaseAuth => FirebaseAuth.instance;
  static FireBaseUtils get instance => FireBaseUtils();

  Future<MessageStatus> register(String login, String password) async {
    try {
      return await firebaseAuth
          .createUserWithEmailAndPassword(email: login, password: password)
          .then((value) {
        UserUtils.instanse.create(login, password, value.user!.uid);
        return MessageStatus();
      }).onError((error, stackTrace) {
        return MessageStatus(errorMessage: error.toString());
      });
    } on FirebaseAuthException catch (e) {
      return MessageStatus(errorMessage: e.message);
    }
  }

  Future<MessageStatus> deleteAccount() async {
    try {
      FirebaseAuth.instance.currentUser!.delete();
      return MessageStatus();
    } on FirebaseAuthException catch (e) {
      return MessageStatus(errorMessage: e.message);
    }
  }

  Future<MessageStatus> updateEmail(String login) async {
    try {
      await FirebaseAuth.instance.currentUser!.updateEmail(login);
      return MessageStatus();
    } on FirebaseAuthException catch (e) {
      return MessageStatus(errorMessage: e.message);
    }
  }

  Future<MessageStatus> updatePassword(String password) async {
    try {
      FirebaseAuth.instance.currentUser!.updatePassword(password);
      return MessageStatus();
    } on FirebaseAuthException catch (e) {
      return MessageStatus(errorMessage: e.message);
    }
  }

  Future<MessageStatus> authLoginAndPassword(String login, String password) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: login, password: password);
      return MessageStatus();
    } on FirebaseAuthException catch (e) {
      return MessageStatus(errorMessage: e.message);
    }
  }
}
