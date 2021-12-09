import 'package:flutter/material.dart';
import 'package:form_builder_validators/localization/l10n.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:space_cube/screens/main/main_bindings.dart';
import 'routes/routes.dart';
import 'values/theme/theme_service.dart';
import 'values/theme/themes.dart';

// AuthController authController = AuthController();

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Space Juke',
        localizationsDelegates: [FormBuilderLocalizations.delegate],
        theme: Themes().lightTheme,
        darkTheme: Themes().darkTheme,
        themeMode: ThemeService().theme,
        initialRoute: JukeRoutes.splash,
        getPages: JukePages.pages,
        initialBinding: MainBindings(),
      );
}
