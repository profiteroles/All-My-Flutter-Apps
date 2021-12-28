import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:va_tf_todo/data/models/user.dart';
import 'package:va_tf_todo/values/routes.dart';
import 'package:va_tf_todo/values/utils/extention.dart';

enum AuthState { loading, initial }

class AuthController extends GetxController {
  static AuthController instance = Get.find();

  FirebaseAuth auth = FirebaseAuth.instance;
  late Rx<User?> _fireUser;

  var authState = AuthState.initial.obs;
  RxBool isSignupScreen = false.obs;
  RxBool isRememberMe = false.obs;
  RxDouble btnAnimationValue = 23.5.wp.obs;

  final fbKey = GlobalKey<FormBuilderState>();

  @override
  void onReady() {
    super.onReady();
    _fireUser = Rx<User?>(auth.currentUser);
    _fireUser.bindStream(auth.userChanges());
    ever(_fireUser, _initialScreen);
  }

  _initialScreen(User? user) {
    if (user == null) {
      debugPrint('AuthController - initialScreen is Called');
      Get.offNamed(AppRoutes.auth);
    } else {
      Get.offNamed(AppRoutes.home);
    }
  }

  void login() async {
    debugPrint('AuthController - login is Called');

    if (fbKey.currentState!.saveAndValidate()) {
      debugPrint('AuthController - login - Values Saved & Validated');

      var data = fbKey.currentState!.value;
      authState(AuthState.loading);

      try {
        var result = await auth.signInWithEmailAndPassword(email: data['email'], password: data['password']);
        print(result);
        print('_______END_______');
      } on FirebaseAuthException catch (e) {
        authState(AuthState.initial);
        debugPrint(e.toString());
        Get.snackbar(
          'User Information',
          ' goes here',
          margin: EdgeInsets.all(5.0.wp),
          backgroundColor: Colors.red[300],
          snackPosition: SnackPosition.BOTTOM,
          titleText: const Text('Register has failed'),
          messageText: Text(e.message.toString()),
        );
      }
      debugPrint(data.toString());
    }
  }

  void register() async {
    debugPrint('AuthController - register is Called');

    if (fbKey.currentState!.saveAndValidate()) {
      debugPrint('AuthController - register - Values Saved & Validated');

      var data = fbKey.currentState!.value;
      String name = data['name'];
      String email = data['email'];
      String password = data['password'];

      debugPrint(data.toString());
      try {
        authState(AuthState.loading);

        UserCredential result = await auth.createUserWithEmailAndPassword(email: email.trim(), password: password.trim());

        UserModel _user = UserModel(id: result.user!.uid, name: name, email: email);

        print(result);
        print('_______END_______');
      } catch (e) {
        authState(AuthState.initial);
        debugPrint(e.toString());
        Get.snackbar(
          'User Information',
          ' goes here',
          snackPosition: SnackPosition.BOTTOM,
          titleText: const Text('Register has failed'),
          messageText: Text(e.toString()),
        );
      }

      // Get.offNamed(AppRoutes.home);
    }
  }

  void logout() {
    auth.signOut();
  }

  void toggleContainers(bool isSignUp) {
    debugPrint('AuthController - toggleContainers is Called');

    btnAnimationValue(0);
    isSignupScreen(isSignUp);
    fbKey.currentState!.reset();
    // passwordCtrl.clear();
    Future.delayed(const Duration(milliseconds: 550), () => btnAnimationValue(23.5.wp));
  }
}
