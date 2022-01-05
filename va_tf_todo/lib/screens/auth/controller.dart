import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:va_tf_todo/data/models/user.dart';
import 'package:va_tf_todo/data/services/firestore.dart';
import 'package:va_tf_todo/values/routes.dart';
import 'package:va_tf_todo/values/theme/colors.dart';
import 'package:va_tf_todo/values/utils/extention.dart';

enum AuthState { loading, initial }

class AuthController extends GetxController {
  // AuthController({required this.appServices});
  static AuthController instance = Get.find();

  // final settingsCtrl = SettingsController.instance;

  // FirebaseAuth auth = FirebaseAuth.instance;
  late Rx<User?> _fireUser;
  late Rx<UserModel?> userModel = Rx<UserModel?>(null);

  Rx<AuthState> authState = AuthState.initial.obs;
  RxBool isSignupScreen = false.obs;
  RxBool isRecover = false.obs;
  // RxBool isRememberMe = false.obs;
  RxDouble btnAnimationValue = 23.5.wp.obs;
  // final _storage = GetStorage();

//FormBuilder Throws an error for unregistered field.
  final loginKey = GlobalKey<FormBuilderState>();
  final signupKey = GlobalKey<FormBuilderState>();

  // @override
  // void onInit() async {
  //   super.onInit();
  //   // settingsCtrl.isDarkMode.value = await _storage.read(themeKey);
  //   // settingsCtrl.setThemeMode(settingsCtrl.onInit());
  //   // settingsCtrl.onInit();
  // }

  @override
  void onReady() async {
    super.onReady();
    _fireUser = Rx<User?>(auth.currentUser);
    _fireUser.bindStream(auth.userChanges());
    ever(_fireUser, _initialScreen);
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
    await auth.sendPasswordResetEmail(email: loginKey.currentState!.value['email']);
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
      String email = data['email'];
      String password = data['password'];

      try {
        await auth.signInWithEmailAndPassword(email: email.trim(), password: password.trim()).then((result) {
          debugPrint(result.toString());
          debugPrint('_______END_______');
          _initializeUserModel(result.user!.uid);
          authState(AuthState.initial);
          // userModel.value = UserModel(id: result.user!.uid, name: name, email: email);
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
        await auth.createUserWithEmailAndPassword(email: email.trim(), password: password.trim()).then((result) {
          // print(result);
          // print('_______END_______');
          _addNewUserDB({"id": result.user!.uid, "name": name, "email": email, "photo_url": "https://i.pravatar.cc/300", "created_at": DateTime.now()});
          _initializeUserModel(result.user!.uid);
          authState(AuthState.initial);
          // userModel.value = UserModel(id: result.user!.uid, name: name, email: email);
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

  _addNewUserDB(Map<String, dynamic> map) => firebaseFirestore.collection("users").doc(map['id']).set(map);

  _initializeUserModel(String id) async {
    debugPrint('AuthController - _initializeUserModel is Called');
    userModel.value = await firebaseFirestore.collection("users").doc(id).get().then(
      (doc) {
        // debugPrint(doc.data().toString());
        // debugPrint('_________END DOC_______');
        Map<String, dynamic> docInfo = doc.data() ?? {'': ''};

        UserModel currentUser = UserModel(
          id: docInfo['id'],
          name: docInfo['name'],
          email: docInfo['email'],
          photoURL: docInfo['photo_url'],
          createdAt: docInfo['created_at'],
        );

        return currentUser;
      },
    );
    // debugPrint(userModel()!.toString());
    // debugPrint('_________END Current USER_______');
  }

  void recover() {
    debugPrint('AuthController - recover is Called');
    isRecover(true);
  }

  void logout() {
    debugPrint('AuthController - logout is Called');
    auth.signOut();
  }
}
