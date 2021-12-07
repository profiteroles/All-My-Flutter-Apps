import 'package:flutter/material.dart';
import 'package:form_builder_validators/localization/l10n.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:space_cube/values/theme/theme_service.dart';
import 'package:space_cube/values/theme/themes.dart';
import 'router/route_constants.dart';
import 'router/router.dart' as r;

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
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
        themeMode: ThemeService().getThemeMode(),
        // ThemeData(
        //   primarySwatch: brandingColor,
        //   secondaryHeaderColor: Colors.indigoAccent,
        // ),
        initialRoute: signinRoute,
        onGenerateRoute: r.Router.onGenerateRoute,
      );
}
