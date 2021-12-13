import 'package:get/instance_manager.dart';
import 'initial_controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    print('InitialBinding - dependencies is Called');
    Get.lazyPut(() => InitialController());
  }
}
