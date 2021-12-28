// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:va_tf_todo/values/routes.dart';

// class InitialController extends GetxController {
//   FirebaseAuth auth = FirebaseAuth.instance;

//   late Rx<User?> _user;

//   @override
//   void onReady() {
//     print('initialController - onReady');
//     super.onReady();
//     _user = Rx<User?>(auth.currentUser);
//     Future.delayed(const Duration(seconds: 1), () {
//       print(_user()?.email);
//       print('_______END________');
//       if (_user.value == null) {
//         Get.offNamed(AppRoutes.auth);
//       } else {
//         debugPrint(_user()!.displayName);
//         // auth.signOut();
//         Get.toNamed(AppRoutes.home);
//       }
//     });
//   }
// }
