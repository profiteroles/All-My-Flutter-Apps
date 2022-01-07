import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:va_tf_todo/data/models/task.dart';
import 'package:va_tf_todo/data/models/user.dart';
import 'package:va_tf_todo/data/services/auth_service.dart';
import 'package:va_tf_todo/data/services/firestore_service.dart';
import 'package:va_tf_todo/data/services/storage_service.dart';
import 'package:va_tf_todo/screens/settings/controller.dart';
import 'package:va_tf_todo/values/routes.dart';
import 'package:va_tf_todo/values/theme/colors.dart';
import 'package:va_tf_todo/values/theme/dark_theme.dart';
import 'package:va_tf_todo/values/theme/light_theme.dart';
import 'package:va_tf_todo/values/utils/extention.dart';
import 'package:va_tf_todo/values/utils/keys.dart';

enum AuthState { loading, initial }

class AuthController extends GetxController {
  static AuthController instance = Get.find();

  final dbFirestore = FirestoreService();
  final authService = AuthService();
  late Rx<User?> _currentUser;
  final Rx<UserModel?> userModel = Rx<UserModel?>(null);

  Rx<AuthState> authState = AuthState.initial.obs;
  RxBool isSignupScreen = false.obs;
  RxBool isRecover = false.obs;
  RxDouble btnAnimationValue = 23.5.wp.obs;

  final localStorage = GetStorage();

  final loginKey = GlobalKey<FormBuilderState>();
  final signupKey = GlobalKey<FormBuilderState>();
  @override
  void onInit() {
    _initialiseAppTheme();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    _currentUser = Rx<User?>(authService.user());
    _currentUser.bindStream(authService.currentUser());
    ever(_currentUser, _initialScreen);
  }

  @override
  void onClose() {
    super.onClose();
    authState.value = AuthState.initial;
    isSignupScreen(false);
  }

  _initialiseAppTheme() async {
    debugPrint('AuthController - _initialiseAppTheme is Called');
    final bool isThemeDark = await localStorage.read(themeKey) ?? false;
    Get.changeTheme(isThemeDark ? darkTheme : lightTheme);
  }

  _initialiseUserModel(String id) async => userModel.value = await dbFirestore.getUser(id);
  void recover() => isRecover(true);
  void logout() async => await authService.signOut();

  void _initialScreen(User? user) {
    debugPrint('AuthController - initialScreen is Called');
    Future.delayed(const Duration(seconds: 2), () {
      if (user == null) {
        Get.offNamed(AppRoutes.auth);
      } else {
        _initialiseUserModel(user.uid);
        Get.offNamed(AppRoutes.home);
      }
    });
  }

  void sendRecover() async {
    debugPrint('AuthController - sendRecover - is Called');
    await authService.recoverPass(loginKey.currentState!.value['email'].toString().trim());
    authState(AuthState.initial);
    toggleContainers(false);
    loginKey.currentState!.reset();
    Get.snackbar(
      'user_info'.tr,
      'user_recover_text'.tr,
      snackPosition: SnackPosition.BOTTOM,
      colorText: black,
      backgroundColor: green,
    );
  }

  void login() async {
    debugPrint('AuthController - login is Called');

    if (loginKey.currentState!.saveAndValidate()) {
      debugPrint('AuthController - login - Values Saved & Validated');
      authState(AuthState.loading);
      if (isRecover()) {
        sendRecover();
        return;
      }

      var data = loginKey.currentState!.value;
      String email = data['email'].toString().trim();
      String password = data['password'].toString().trim();

      try {
        await authService.loginEmail(email, password).then((result) {
          _initialiseUserModel(result.user!.uid);
          // authState(AuthState.initial);
        });
      } on FirebaseAuthException catch (e) {
        authError(e);
      }
    }
  }

  void register() async {
    debugPrint('AuthController - register is Called');

    if (signupKey.currentState!.saveAndValidate()) {
      debugPrint('AuthController - register - Values Saved & Validated');
      authState(AuthState.loading);
      var data = signupKey.currentState!.value;
      String name = data['full_name'].toString().trim();
      String email = data['email'].toString().trim();
      String password = data['password'];

      try {
        await authService.signUpEmail(email, password).then((result) {
          // print(result.user.toString());
          // print('_______END_______');
          final UserModel newUser = UserModel(id: result.user!.uid, name: name, email: email, createdAt: Timestamp.now());
          dbFirestore.setUser(newUser.toMap());
          _initialiseUserModel(newUser.id);
        });
      } on FirebaseAuthException catch (e) {
        authError(e);
      }

      // Future.delayed(const Duration(seconds: 5), () {
      //   authState(AuthState.initial);
      //   isSignupScreen(false);
      // });
    }
  }

//TODO: Test this out
  void authError(FirebaseAuthException e) {
    authState(AuthState.initial);
    debugPrint(e.toString());
    Get.snackbar(
      'User Information',
      e.message.toString(),
      margin: EdgeInsets.all(5.0.wp),
      backgroundColor: Colors.red[400],
      snackPosition: SnackPosition.BOTTOM,
      // titleText: const Text('Login has failed', style: TextStyle(color: Colors.white, fontSize: 20)),
      // messageText: Text(e.message.toString(), style: const TextStyle(color: Colors.white, letterSpacing: 1.2)),
    );
  }

  void toggleContainers(bool isSignUp) {
    debugPrint('AuthController - toggleContainers is Called');
    btnAnimationValue(0);
    isSignupScreen(isSignUp);
    isRecover(false);
    Future.delayed(const Duration(milliseconds: 550), () => btnAnimationValue(23.5.wp));
  }
}
