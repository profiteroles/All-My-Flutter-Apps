import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:va_tf_todo/data/models/task.dart';
import 'package:va_tf_todo/values/utils/keys.dart';

class TaskProvider {
  final _storage = GetStorage();

  List<TasksList> readTasks() {
    debugPrint('TaskProvider - readTasks is Called');
    var tasks = <TasksList>[];
    if (_storage.read(taskKey) != null) {
      for (var task in _storage.read(taskKey) as List) {
        tasks.add(TasksList.fromJson(task));
      }
      return tasks;
    } else {
      return tasks;
    }
  }

  void writeTasks(List<TasksList> tasks) {
    debugPrint('TaskProvider - writeTasks is Called');
    _storage.write(taskKey, tasks);
  }
}
