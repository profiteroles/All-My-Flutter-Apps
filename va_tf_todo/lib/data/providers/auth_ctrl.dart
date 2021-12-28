// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:va_tf_todo/values/routes.dart';

// class AuthController extends GetxController {
//   static AuthController instance = Get.find();

//   late Rx<User?> _user;

//   FirebaseAuth auth = FirebaseAuth.instance;

//   @override
//   void onReady() {
//     super.onReady();
//     _user = Rx<User?>(auth.currentUser);
//     _user.bindStream(auth.userChanges());
//     ever(_user, _initialScreen);
//   }

//   _initialScreen(User? user) {
//     if (user == null) {
//       debugPrint('Login Page');
//       Get.offAllNamed(AppRoutes.auth);
//     } else {
//       Get.offAllNamed(AppRoutes.home);
//     }
//   }

//   void register(String email, password) async {
//     try {
//       await auth.createUserWithEmailAndPassword(email: email, password: password);
//     } catch (e) {
//       debugPrint(e.toString());
//       Get.snackbar(
//         'User Information',
//         ' goes here',
//         snackPosition: SnackPosition.BOTTOM,
//         titleText: const Text('Register has failed'),
//         messageText: Text(e.toString()),
//       );
//     }
//   }
// }
