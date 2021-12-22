import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/state_manager.dart';
import 'package:va_tf_todo/values/utils/extention.dart';

enum AuthState { loading, initial }

class SigningController extends GetxController {
  var authState = AuthState.initial.obs;
  RxBool isSignupScreen = false.obs;
  RxBool isRememberMe = false.obs;
  RxDouble btnAnimationValue = 23.5.wp.obs;

  final fbKey = GlobalKey<FormBuilderState>();
  final TextEditingController textController = TextEditingController();

  @override
  void onClose() {
    super.onClose();
    textController.dispose();
  }

  void register() async {
    debugPrint('SigningController - register is Called');

    if (fbKey.currentState!.saveAndValidate()) {
      debugPrint('SigningController - register - Values Saved & Validated');

      var data = fbKey.currentState!.value;
      authState(AuthState.loading);

      print(data);
    }
  }

  void toggleContainers(bool isSignUp) {
    btnAnimationValue(0);
    isSignupScreen(isSignUp);
    Future.delayed(const Duration(milliseconds: 550), () => btnAnimationValue(23.5.wp));
  }

  void login() {
    debugPrint('SigningController - login is Called');
    if (fbKey.currentState!.saveAndValidate()) {
      debugPrint('SigningController - login - Values Saved & Validated');

      var data = fbKey.currentState!.value;
      authState(AuthState.loading);

      print(data);
    }
  }
}
