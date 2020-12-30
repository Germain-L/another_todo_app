import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import '../constants.dart';
import '../models/task.dart';

class FirestoreHelper with ChangeNotifier {
  List<Task> tasks;
  Future<void> getTasks() async {
    try {
      String uid = auth.currentUser.uid;
      var querySnapshot = await firestore.collection(uid).get();

      List<QueryDocumentSnapshot> queryDocSnapshot = querySnapshot.docs;

      tasks = [];

      queryDocSnapshot.forEach((QueryDocumentSnapshot snapshot) {
        var data = snapshot.data();
        tasks.add(Task(
          date: data["date"],
          task: data["text"],
          isDone: data["isDone"],
          id: snapshot.id,
        ));
      });
      notifyListeners();
    } catch (e) {
      print(e);
      tasks = null;
    }
  }

   Stream getTasksStream() {
    String uid = auth.currentUser.uid;

    return firestore.collection(uid).get().asStream();
  }

  Future<void> addTask(String text) async {
    Timestamp now = Timestamp.now();
    String uid = auth.currentUser.uid;

    try {
      await firestore.collection(uid).doc().set({
        "date": now,
        "text": text,
        "isDone": false,
      });
      notifyListeners();
    } catch (e) {
      throw e;
    }
  }

  Future<void> updateTask(bool newState, String id) async {
    String uid = auth.currentUser.uid;
    try {
      await firestore.collection(uid).doc(id).update({"isDone": newState});
      notifyListeners();
    } catch (e) {}
  }

  Future<void> deleteTask(String id) async {
    String uid = auth.currentUser.uid;

    try {
      await firestore.collection(uid).doc(id).delete();
      notifyListeners();
    } catch (e) {}
  }

  Future<void> deleteUser(String uid) async {
    QuerySnapshot docs = await firestore.collection(uid).get();
    docs.docs.forEach((QueryDocumentSnapshot element) {
      deleteTask(element.id);
    });
  }
}
