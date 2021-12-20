import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:va_tf_todo/data/services/storage_service.dart';
import 'package:va_tf_todo/screens/home/binding.dart';
import 'package:va_tf_todo/screens/home/view.dart';

void main() async {
  await GetStorage.init();
  await Firebase.initializeApp();
  await Get.putAsync(() => StorageService().init());
  print(GetStorage().getValues());
  debugPrint('____END OF STORAGE VALUES____');
  runApp(const VAToDo());
}

class VAToDo extends StatelessWidget {
  const VAToDo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'VA ToDo',
      initialBinding: HomeBinding(),
      home: const HomeScreen(),
      builder: EasyLoading.init(),
    );
  }
}
