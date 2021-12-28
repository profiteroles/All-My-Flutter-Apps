import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:va_tf_todo/data/models/user.dart';
import 'package:va_tf_todo/data/services/firestore.dart';
import 'package:va_tf_todo/values/routes.dart';
import 'package:va_tf_todo/values/utils/extention.dart';

enum AuthState { loading, initial }

class AuthController extends GetxController {
  static AuthController instance = Get.find();

  FirebaseAuth auth = FirebaseAuth.instance;
  late Rx<User?> _fireUser;
  late Rx<UserModel> userModel;

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

  @override
  void onClose() {
    super.onClose();
    fbKey.currentState!.dispose();
    authState.value = AuthState.initial;
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
      authState(AuthState.loading);

      var data = fbKey.currentState!.value;
      String email = data['email'];
      String password = data['password'];

      try {
        await auth.signInWithEmailAndPassword(email: email.trim(), password: password.trim()).then((result) {
          print(result);
          print('_______END_______');
          _initializeUserModel(result.user!.uid);
          authState(AuthState.initial);
          // userModel.value = UserModel(id: result.user!.uid, name: name, email: email);
        });
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
    }
  }

  void register() async {
    debugPrint('AuthController - register is Called');

    if (fbKey.currentState!.saveAndValidate()) {
      debugPrint('AuthController - register - Values Saved & Validated');
      authState(AuthState.loading);
      var data = fbKey.currentState!.value;
      String name = data['full_name'];
      String email = data['email'];
      String password = data['password'];

      debugPrint(data.toString());
      try {
        await auth.createUserWithEmailAndPassword(email: email.trim(), password: password.trim()).then((result) {
          print(result);
          print('_______END_______');
          _addNewUserDB({"id": result.user!.uid, "name": name, "email": email, "photo_url": "https://i.pravatar.cc/300"});
          _initializeUserModel(result.user!.uid);
          authState(AuthState.initial);
          // userModel.value = UserModel(id: result.user!.uid, name: name, email: email);
        });
      } on FirebaseAuthException catch (e) {
        authState(AuthState.initial);
        debugPrint(e.toString());
        Get.snackbar(
          'User Information',
          '',
          margin: EdgeInsets.all(5.0.wp),
          backgroundColor: Colors.red[300],
          snackPosition: SnackPosition.BOTTOM,
          titleText: const Text('Register has failed'),
          messageText: Text(e.message.toString()),
        );
      }
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

  _addNewUserDB(Map<String, dynamic> map) => firebaseFirestore.collection("users").doc(map['id']).set(map);

  _initializeUserModel(String id) async {
    debugPrint('AuthController - _initializeUserModel is Called');
    userModel.value = await firebaseFirestore.collection("users").doc(id).get().then(
      (doc) {
        print(doc.data());
        debugPrint('_________END DOC_______');
        UserModel currentUser = UserModel.fromJson(doc.data().toString());
        debugPrint('${currentUser.id}\n${currentUser.name}\n${currentUser.email}\n${currentUser.photoURL}\n');
        debugPrint('_________END Current USER_______');

        return currentUser;
      },
    );
  }
}
