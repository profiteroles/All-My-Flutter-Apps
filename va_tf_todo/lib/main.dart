import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:va_tf_todo/screens/auth/controller.dart';
import 'package:va_tf_todo/values/translations/local_strings.dart';
import 'package:va_tf_todo/values/main_binding.dart';
import 'package:va_tf_todo/values/routes.dart';
import 'package:va_tf_todo/values/theme/light_theme.dart';
import 'values/theme/dark_theme.dart';
import 'values/utils/notification_utilities.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  AwesomeNotifications().initialize(null, notificationChannels);
  await Firebase.initializeApp().then((value) => Get.put(AuthController()));
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  // NotificationsService.initiliase();
  runApp(const VAToDo());
}

Future<void> backgroundHandler(RemoteMessage message) async {
  print(message.data.toString());
  print(message.notification.toString());
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
