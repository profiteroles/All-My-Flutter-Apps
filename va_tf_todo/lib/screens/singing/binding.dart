import 'package:flutter/foundation.dart';
import 'package:get/instance_manager.dart';
import 'package:va_tf_todo/screens/singing/controller.dart';

class SigningBinding extends Bindings {
  @override
  void dependencies() {
    debugPrint('HomeBinding - dependencies is Called');
    Get.lazyPut(() => SigningController());
  }
}
