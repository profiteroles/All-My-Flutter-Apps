import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:va_tf_todo/data/models/user.dart';
import 'package:va_tf_todo/data/services/auth_service.dart';
import 'package:va_tf_todo/data/services/firestore_service.dart';
import 'package:va_tf_todo/values/routes.dart';
import 'package:va_tf_todo/values/theme/colors.dart';
import 'package:va_tf_todo/values/utils/extention.dart';

enum AuthState { loading, initial }

class AuthController extends GetxController {
  static AuthController instance = Get.find();

  final dbFirestore = FirestoreService();
  final authService = AuthService();
  late Rx<User?> _currentUser;
  late Rx<UserModel?> userModel = Rx<UserModel?>(null);

  Rx<AuthState> authState = AuthState.initial.obs;
  RxBool isSignupScreen = false.obs;
  RxBool isRecover = false.obs;
  RxDouble btnAnimationValue = 23.5.wp.obs;

  final loginKey = GlobalKey<FormBuilderState>();
  final signupKey = GlobalKey<FormBuilderState>();

  @override
  void onReady() async {
    super.onReady();
    _currentUser = Rx<User?>(authService.user());
    _currentUser.bindStream(authService.currentUser());
    // _fireUser = Rx<User?>(auth.currentUser);
    // _fireUser.bindStream(auth.userChanges());
    ever(_currentUser, _initialScreen);
  }

  @override
  void onClose() {
    super.onClose();
    authState.value = AuthState.initial;
  }

  void _initialScreen(User? user) {
    Future.delayed(const Duration(seconds: 2), () {
      if (user == null) {
        debugPrint('AuthController - initialScreen is Called');
        Get.offNamed(AppRoutes.auth);
      } else {
        _initializeUserModel(user.uid);
        Get.offNamed(AppRoutes.home);
      }
    });
  }

  void sendRecover() async {
    debugPrint('AuthController - sendRecover - is Called');
    await authService.recoverPass(loginKey.currentState!.value['email'].toString().trim());
    // await auth.sendPasswordResetEmail(email: loginKey.currentState!.value['email']);
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
          //} => null);
          // await auth.signInWithEmailAndPassword(email: email, password: password).then((result) {
          debugPrint(result.toString());
          debugPrint('_______END_______');
          _initializeUserModel(result.user!.uid);
          authState(AuthState.initial);
        });
      } on FirebaseAuthException catch (e) {
        authState(AuthState.initial);
        debugPrint(e.toString());
        Get.snackbar(
          'User Information',
          e.message.toString(),
          margin: EdgeInsets.all(5.0.wp),
          backgroundColor: Colors.red[300],
          snackPosition: SnackPosition.BOTTOM,
          titleText: const Text('Login has failed', style: TextStyle(color: Colors.white, fontSize: 20)),
          messageText: Text(e.message.toString(), style: const TextStyle(color: Colors.white, letterSpacing: 1.2)),
        );
      }
    }
  }

  void register() async {
    debugPrint('AuthController - register is Called');

    if (signupKey.currentState!.saveAndValidate()) {
      debugPrint('AuthController - register - Values Saved & Validated');
      authState(AuthState.loading);
      var data = signupKey.currentState!.value;
      String name = data['full_name'];
      String email = data['email'];
      String password = data['password'];

      // debugPrint(data.toString());
      try {
        await authService.signUpEmail(email, password).then((result) {
          //}=> null)
          // await auth.createUserWithEmailAndPassword(email: email.trim(), password: password.trim()).then((result) {
          print(result.user.toString());
          print('_______END_______');
          dbFirestore.setUser({"id": result.user!.uid, "name": name, "email": email, "photo_url": "https://i.pravatar.cc/300", "created_at": DateTime.now()});
          _initializeUserModel(result.user!.uid);
          authState(AuthState.initial);
        });
      } on FirebaseAuthException catch (e) {
        authState(AuthState.initial);
        debugPrint(e.toString());
        Get.snackbar(
          'User Information',
          e.message.toString(),
          margin: EdgeInsets.all(5.0.wp),
          backgroundColor: Colors.red[300],
          snackPosition: SnackPosition.BOTTOM,
          titleText: const Text('Register has failed', style: TextStyle(color: Colors.white, fontSize: 20)),
          messageText: Text(e.message.toString(), style: const TextStyle(color: Colors.white, letterSpacing: 1.2)),
        );
      }
    }
  }

  void toggleContainers(bool isSignUp) {
    debugPrint('AuthController - toggleContainers is Called');
    btnAnimationValue(0);
    isSignupScreen(isSignUp);
    isRecover(false);
    Future.delayed(const Duration(milliseconds: 550), () => btnAnimationValue(23.5.wp));
  }

  _initializeUserModel(String id) async {
    debugPrint('AuthController - _initializeUserModel is Called');
    userModel.value = await dbFirestore.getUser(id);
  }

  void recover() {
    debugPrint('AuthController - recover is Called');
    isRecover(true);
  }

  void logout() async {
    debugPrint('AuthController - logout is Called');
    await authService.signOut();
  }
}
