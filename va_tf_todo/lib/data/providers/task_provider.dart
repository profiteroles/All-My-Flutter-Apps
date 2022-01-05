import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:va_tf_todo/data/models/task.dart';
import 'package:va_tf_todo/data/services/storage_service.dart';
import 'package:va_tf_todo/values/utils/keys.dart';

class TaskProvider {
  final _storage = Get.find<StorageService>();

  List<TasksList> readTasks() {
    debugPrint('TaskProvider - readTasks is Called');
    var tasks = <TasksList>[];

    for (var task in _storage.read(taskKey) as List) {
      tasks.add(TasksList.fromJson(task));
    }

    return tasks;
  }

  void writeTasks(List<TasksList> tasks) {
    debugPrint('TaskProvider - writeTasks is Called');
    _storage.write(taskKey, tasks);
  }
}
