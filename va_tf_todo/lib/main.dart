import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:va_tf_todo/data/services/storage_service.dart';
import 'package:va_tf_todo/screens/auth/controller.dart';
import 'package:va_tf_todo/values/local_strings.dart';
import 'package:va_tf_todo/values/main_binding.dart';
import 'package:va_tf_todo/values/routes.dart';
import 'package:va_tf_todo/values/theme/light_theme.dart';
import 'values/theme/dark_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp().then((value) => Get.put(AuthController()));
  await Get.putAsync(() => StorageService().init());
  runApp(const VAToDo());
}

class VAToDo extends StatelessWidget {
  const VAToDo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'VA ToDo',
      translations: LocalStrings(),
      locale: const Locale('en', 'US'),
      initialBinding: MainBinding(),
      builder: EasyLoading.init(),
      initialRoute: AppRoutes.initial,
      theme: lightTheme,
      darkTheme: darkTheme,
      getPages: AppPages.pages,
      localizationsDelegates: const [FormBuilderLocalizations.delegate],
    );
  }
}
