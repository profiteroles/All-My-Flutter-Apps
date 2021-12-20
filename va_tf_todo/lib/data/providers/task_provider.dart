import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:va_tf_todo/data/models/task.dart';
import 'package:va_tf_todo/data/services/storage_service.dart';
import 'package:va_tf_todo/values/utils/key.dart';

class TaskProvider {
  final _storage = Get.find<StorageService>();

  List<Task> readTasks() {
    debugPrint('TaskProvider - readTasks is Called');
    var tasks = <Task>[];
    var json = _storage.read(taskKey);
    // Task task = Task.fromJson(json);
    print(json);
    // jsonDecode(json).forEach((e) {
    //   debugPrint('_______ TaskProvider - readTasks Start______');
    //   print(e);
    debugPrint('_______ TaskProvider - readTasks End______');
    // tasks.add(Task.fromJson(e));
    // });

    return tasks;
  }

  void writeTasks(List<Task> tasks) {
    debugPrint('TaskProvider - writeTasks is Called');
    // print(tasks);
    _storage.write(taskKey, tasks);
  }
}
