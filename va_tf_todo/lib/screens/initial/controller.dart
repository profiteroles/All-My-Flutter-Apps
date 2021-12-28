import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:va_tf_todo/screens/auth/view.dart';
import 'package:va_tf_todo/screens/home/view.dart';

class InitialController extends GetxController {
  static InitialController instance = Get.find();

  late Rx<User?> _user;

  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onReady() {
    super.onReady();
    Future.delayed(const Duration(seconds: 2), () {
      //
    });
    _user = Rx<User?>(auth.currentUser);
    _user.bindStream(auth.userChanges());
    ever(_user, _initialScreen);
  }

  _initialScreen(User? user) {
    if (user == null) {
      debugPrint('Login Page');
      Get.offAll(() => const SigningScreen());
    } else {
      Get.offAll(() => const HomeScreen());
    }
  }
}
