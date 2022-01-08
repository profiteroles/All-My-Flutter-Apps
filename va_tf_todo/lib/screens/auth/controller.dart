import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:va_tf_todo/data/models/user.dart';
import 'package:va_tf_todo/data/services/auth_service.dart';
import 'package:va_tf_todo/data/services/firestore_service.dart';
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
  RxBool isThemeDark = false.obs;
  RxDouble btnAnimationValue = 23.5.wp.obs;

  final localStorage = GetStorage();

  final loginKey = GlobalKey<FormBuilderState>();
  final signupKey = GlobalKey<FormBuilderState>();
  final passwordCtrl = TextEditingController();

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

  _initialiseAppTheme() async {
    debugPrint('AuthController - _initialiseAppTheme is Called');
    isThemeDark.value = await localStorage.read(themeKey) ?? false;
    Get.changeTheme(isThemeDark() ? darkTheme : lightTheme);
  }

  _initialiseUserModel(String id) async => userModel.value = await dbFirestore.getUser(id);
  void recover() => isRecover(true);
  void logout() {
    Get.offNamed(AppRoutes.auth);
    authService.signOut();
  }

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

  void toggleContainers(bool isSignUp) {
    debugPrint('AuthController - toggleContainers is Called');
    authState(AuthState.initial);
    btnAnimationValue(0);
    isSignupScreen(isSignUp);
    isRecover(false);
    passwordCtrl.clear();
    Future.delayed(const Duration(milliseconds: 550), () => btnAnimationValue(23.5.wp));
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
        await authService.loginEmail(email, password).then((result) => _initialiseUserModel(result.user!.uid));
      } on FirebaseAuthException catch (e) {
        authError(e);
      }

      onDispose();
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
          final UserModel newUser = UserModel(id: result.user!.uid, name: name, email: email, createdAt: Timestamp.now());
          dbFirestore.setUser(newUser.toMap());
          _initialiseUserModel(newUser.id);
        });
      } on FirebaseAuthException catch (e) {
        authError(e);
      }
      onDispose();
    }
  }

  void onDispose() {
    Future.delayed(const Duration(seconds: 5), () {
      authState(AuthState.initial);
      passwordCtrl.clear();
      isSignupScreen(false);
    });
  }

  void authError(FirebaseAuthException e) {
    authState(AuthState.initial);
    debugPrint(e.toString());
    Get.snackbar(
      isSignupScreen() ? 'user_info'.tr : 'login_failed'.tr,
      e.message.toString(),
      margin: EdgeInsets.all(5.0.wp),
      backgroundColor: Colors.red[400],
      snackPosition: SnackPosition.BOTTOM,
      messageText: Text(e.message.toString(), style: const TextStyle(color: Colors.white, letterSpacing: 1.2)),
    );
  }

  void signWithGoogle() async {
    debugPrint('AuthController - signWithGoogle is Called');
    try {
      authState(AuthState.loading);
      final google = GoogleSignIn(scopes: ['email']);
      final GoogleSignInAccount? googleUser = await google.signIn();

      final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);
      authService.signWithCredential(credential).then((result) async {
        final String? name = result.user!.displayName;
        final String? email = result.user!.email;
        final String? id = result.user!.uid;
        final String? pic = result.user!.photoURL;

        if (id!.isNotEmpty && name!.isNotEmpty && email!.isNotEmpty && pic!.isNotEmpty) {
          final UserModel newUser = UserModel(id: id, name: name, email: email, createdAt: Timestamp.now(), photoURL: pic);
          dbFirestore.setUser(newUser.toMap());
          _initialiseUserModel(id);
        }
      });
    } on FirebaseAuthException catch (e) {
      authError(e);
    } catch (e) {
      debugPrint('AuthController - signWithGoogle Caught Exception User Cancelled');
      authState(AuthState.initial);
    }
    onDispose();
  }
}
