import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_project/models/task_model.dart';
import 'package:todo_project/views/home_layout/tabs/task_info_screen.dart';
import 'package:todo_project/views/home_layout/tabs/task_screen.dart';

import '../models/user_model.dart';

class AppViewModel extends ChangeNotifier {
  List<Widget> tabs = [const TaskTab(), const TaskInfoTab()];
  int bottomNavIndex = 0;
  List<TaskModel> tasks = [];
  List<TaskModel> completedTasks = [];
  List<TaskModel> uncompletedTasks = [];
  DateTime selected = DateUtils.dateOnly(DateTime.now());

  void changeBottomNavIndex(int index) {
    bottomNavIndex = index;
    notifyListeners();
  }

  CollectionReference<TaskModel> getTasksCollection() {
    return FirebaseFirestore.instance
        .collection("Tasks")
        .withConverter<TaskModel>(
          fromFirestore: (snapshot, options) =>
              TaskModel.fromJson(snapshot.data()!),
          toFirestore: (task, options) => task.toJson(),
        );
  }

  void addTaskToFirestore(TaskModel task) {
    var collection = getTasksCollection();
    var docRef = collection.doc();
    task.id = docRef.id;
    docRef.set(task);
    notifyListeners();
  }

  Stream<QuerySnapshot<TaskModel>> getTasksFromFirestore(DateTime date) {
    var collection = getTasksCollection();
    return collection
        .where("date",
            isEqualTo: DateUtils.dateOnly(date).millisecondsSinceEpoch)
        .snapshots();
  }

  Future<void> deleteTask(String id) {
    return getTasksCollection().doc(id).delete();
  }

  Future<void> updateTask(String id, TaskModel task) {
    return getTasksCollection().doc(id).update(task.toJson());
  }

  CollectionReference<UserModel> getUsersCollection() {
    return FirebaseFirestore.instance
        .collection("Users")
        .withConverter<UserModel>(
          fromFirestore: (snapshot, options) =>
              UserModel.fromJson(snapshot.data()!),
          toFirestore: (user, options) => user.toJson(),
        );
  }

  void chooseDate(BuildContext context) async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (selectedDate != null) {
      selected = DateUtils.dateOnly(selectedDate);
    }
  }

  void showBottomSheet(Widget bottomSheetView, BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      context: context,
      builder: (context) {
        return bottomSheetView;
      },
    );
  }

  static void createAccount(String email, String password) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print(e.message);
      } else if (e.code == 'email-already-in-use') {
        print(e.message);
      }
    } catch (e) {
      print(e);
    }
  }
}
