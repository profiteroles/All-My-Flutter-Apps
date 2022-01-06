import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/instance_manager.dart';
import 'package:va_tf_todo/data/providers/task_provider.dart';
import 'package:va_tf_todo/data/services/task_repository.dart';
import 'package:va_tf_todo/screens/home/controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    debugPrint('HomeBinding - dependencies is Called');
    Get.lazyPut(() => HomeController(
            taskRepository: TaskRepository(
          taskProvider: TaskProvider(),
        )));
  }
}
