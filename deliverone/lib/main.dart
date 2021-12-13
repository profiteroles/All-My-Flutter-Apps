import 'domain/routes/routes.dart';
import 'presentation/main/main_bindings.dart';
import 'themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      getPages: AppPages.pages,
      initialRoute: AppRoutes.splash,
      initialBinding: MainBindings(),
    );
  }
}
