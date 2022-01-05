import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:va_tf_todo/screens/auth/controller.dart';
import 'package:va_tf_todo/values/utils/asset_path.dart';
// import 'controller.dart';

class InitialScreen extends GetView<AuthController> {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Image.asset((initialGif))));
  }
}
