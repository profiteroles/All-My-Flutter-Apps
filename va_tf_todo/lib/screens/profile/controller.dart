import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:va_tf_todo/data/models/activity.dart';
import 'package:va_tf_todo/data/services/firestore_service.dart';
import 'package:va_tf_todo/screens/auth/controller.dart';
import 'package:va_tf_todo/screens/home/controller.dart';
import 'package:va_tf_todo/values/utils/extention.dart';
import 'package:va_tf_todo/values/utils/image_helpers.dart';
import 'dart:io';

class ProfileController extends GetxController {
  static ProfileController instance = Get.find();
//TODO: Backup button
  final firestoreActivity = <Activity>[].obs;
  final authCtrl = AuthController.instance;
  final dbFirestore = FirestoreService();
  late String userId = authCtrl.authService.user()!.uid;
  final _picker = ImagePicker();

  final homeCtrl = HomeController.instance;

  int getTotalTasks() {
    int result = 0;

    for (int i = 0; i < homeCtrl.activities.length; i++) {
      if (homeCtrl.activities[i].tasks != null) {
        result += homeCtrl.activities[i].tasks!.length;
      }
    }

    return result;
  }

  int getTotalDoneTask() {
    int res = 0;

    for (int i = 0; i < homeCtrl.activities.length; i++) {
      if (homeCtrl.activities[i].tasks != null) {
        for (int t = 0; t < homeCtrl.activities[i].tasks!.length; t++) {
          if (homeCtrl.activities[i].tasks![t].isdone == true) {
            res += 1;
          }
        }
      }
    }
    return res;
  }

  @override
  void onInit() {
    super.onInit();
  }

  void recoverSavedActivities() async {
    debugPrint('HomeController - recoverSavedTasksList is Called');
    var result = await dbFirestore.getActivity(userId);
    firestoreActivity.assignAll(result);
  }

  List<String> months = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];
  RxString selectedMonth = DateFormat.MMMM().format(DateTime.now()).obs;

  void setMonth(String? value) {
    debugPrint('ProfileController - setMonth is Called $value');
    selectedMonth(value);
  }

  void uploadImage() async {
    debugPrint('ProfileController - uploadImage is Called');
    try {
      final File? file = await Utils.pickMedia(isGallery: await imageSourceDialog());
      String? url;
      if (file == null) return;
      url = await dbFirestore.uploadProfileImage(file, userId);

      if (url.isNotEmpty) {
        dbFirestore.updateUser(userId, {'photo_url': url});
        authCtrl.initialiseUserModel(userId);
        EasyLoading.showInfo('image_uploaded'.tr);
      }
    } on PlatformException catch (e) {
      debugPrint(e.message);
    }
  }

  Future<bool?> imageSourceDialog() async {
    ElevatedButton appBtn(bool val) => ElevatedButton(
        onPressed: () => Get.back(result: val),
        child: Row(children: [
          Text((val ? 'gallery' : 'camera').tr),
          SizedBox(width: 1.0.wp),
          Icon(val ? Icons.photo_library_outlined : Icons.camera_alt_outlined),
        ]));

    return await Get.defaultDialog(
        titlePadding: EdgeInsets.only(top: 5.0.wp),
        title: 'pick_pic_from'.tr,
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [appBtn(false), appBtn(true)],
        )).then((value) => value);
  }

  void deleteAllDialog() async => await Get.defaultDialog(
        titlePadding: EdgeInsets.symmetric(vertical: 3.0.hp, horizontal: 4.0.wp),
        title: Emojis.symbols_warning + ' ' + 'important_warning'.tr + ' ' + Emojis.symbols_warning,
        content: Text('delete_all_dialog_text'.tr),
        cancel: TextButton(onPressed: () => Get.back(result: false), child: Text('nope'.tr)),
        confirm: TextButton(onPressed: () => Get.back(result: true), child: Text('confirm'.tr)),
      ).then((value) => value ? homeCtrl.activities.value = [] : null);
}
