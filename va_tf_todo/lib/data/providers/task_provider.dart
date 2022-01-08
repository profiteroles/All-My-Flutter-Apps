import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:va_tf_todo/data/models/task.dart';
import 'package:va_tf_todo/screens/auth/controller.dart';

class TaskProvider {
  final _storage = GetStorage();
  final _auth = AuthController.instance;

  List<TasksList> readTasks() {
    debugPrint('TaskProvider - readTasks is Called');
    final key = _auth.authService.user()!.uid;
    var tasks = <TasksList>[];
    if (_storage.read(key) != null) {
      for (var task in _storage.read(key) as List) {
        tasks.add(TasksList.fromJson(task));
      }
      return tasks;
    }
    return tasks;
  }

  void writeTasks(List<TasksList> tasks) {
    debugPrint('TaskProvider - writeTasks is Called');
    _storage.write(_auth.authService.user()!.uid, tasks);
  }
}
