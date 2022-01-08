import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:va_tf_todo/data/models/task.dart';
import 'package:va_tf_todo/data/services/firestore_service.dart';
import 'package:va_tf_todo/screens/auth/controller.dart';
import 'package:va_tf_todo/values/utils/extention.dart';

class ProfileController extends GetxController {
//TODO: Backup button
  final firestoreTaskList = <TasksList>[].obs;
  final authCtrl = AuthController.instance;
  final dbFirestore = FirestoreService();
  late String userId = authCtrl.authService.user()!.uid;
  final _picker = ImagePicker();

  @override
  void onInit() {
    super.onInit();
  }

  // final homeCtrl = HomeController.instance;

  void recoverSavedTasksList() async {
    debugPrint('HomeController - recoverSavedTasksList is Called');
    var result = await dbFirestore.getTaskList(userId);
    firestoreTaskList.assignAll(result);
  }

  List<String> months = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];
  RxString selectedMonth = DateFormat.MMMM().format(DateTime.now()).obs;

  void setMonth(String? value) {
    debugPrint('ProfileController - setMonth is Called $value');
    selectedMonth(value);
  }

  void uploadImage() async {
    debugPrint('ProfileController - uploadImage is Called');

    type().then((type) async {
      print(type == ImageSource.camera);
      if (type != null) {
        try {
          final XFile? image = await _picker.pickImage(source: type);
          if (image == null) return;

          final file = File(image.path);

          print(file.path);

          final String url = await dbFirestore.uploadProfileImage(file, userId);

          if (url.isNotEmpty) {
            dbFirestore.updateUser(userId, {'profile_url': url});
          }
        } on PlatformException catch (e) {
          debugPrint(e.message);
        }
      }
    });
  }

  Future<ImageSource?> type() async {
    ImageSource? type;

    await Get.defaultDialog(
      titlePadding: EdgeInsets.only(top: 5.0.wp),
      title: 'Pick Picture From',
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ElevatedButton(
              child: Text('camera'.tr),
              onPressed: () {
                type = ImageSource.camera;
                Get.back();
              }),
          ElevatedButton(
              child: Text('gallery'.tr),
              onPressed: () {
                type = ImageSource.gallery;
                Get.back();
              }),
        ],
      ),
    );
    return type;
  }
}
