import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:intl/intl.dart';
import 'package:va_tf_todo/data/models/task.dart';
import 'package:va_tf_todo/data/services/firestore_service.dart';
import 'package:va_tf_todo/screens/auth/controller.dart';

class ProfileController extends GetxController {
//TODO: Backup button
  final firestoreTaskList = <TasksList>[].obs;
  final authCtrl = AuthController.instance;
  final dbFirestore = FirestoreService();

  void recoverSavedTasksList() async {
    debugPrint('HomeController - recoverSavedTasksList is Called');
    var result = await dbFirestore.getTaskList(authCtrl.authService.user()!.uid);
    firestoreTaskList.assignAll(result);
  }

  List<String> months = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];
  RxString selectedMonth = DateFormat.MMMM().format(DateTime.now()).obs;

  void setMonth(String? value) {
    debugPrint('ProfileController - setMonth is Called $value');
    selectedMonth(value);
  }
}
