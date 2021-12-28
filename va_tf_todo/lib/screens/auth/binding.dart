import 'package:flutter/foundation.dart';
import 'package:get/instance_manager.dart';

import 'controller.dart';

class SigningBinding extends Bindings {
  @override
  void dependencies() {
    debugPrint('HomeBinding - dependencies is Called');
    Get.lazyPut(() => AuthController());
  }
}
