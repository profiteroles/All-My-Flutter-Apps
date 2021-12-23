import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';

class SettingsController extends GetxController {
  RxBool isDarkMode = false.obs;
  RxBool nofityOn = true.obs;

  void setThemeMode(bool value) => isDarkMode(value);
  void setNotification(bool value) => nofityOn(value);
}
