import 'package:flutter/foundation.dart';
import 'package:get/instance_manager.dart';

import 'controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    debugPrint('AuthBinding - dependencies is Called');
    Get.lazyPut(() => AuthController());
  }
}
