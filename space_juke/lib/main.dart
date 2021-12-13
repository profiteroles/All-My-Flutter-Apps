import 'package:form_builder_validators/localization/l10n.dart';
import 'package:get_storage/get_storage.dart';
import 'package:space_juke/values/constants.dart';

import 'values/routes/routes.dart';
import 'presentation/main/main_bindings.dart';
import 'values/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  await GetStorage.init(STORAGE_KEY);
  runApp(JukeApp());
}

class JukeApp extends StatelessWidget {
  const JukeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      getPages: AppPages.pages,
      initialRoute: AppRoutes.splash,
      // initialBinding: MainBindings(),
      builder: (context, child) => MediaQuery(
        data: MediaQuery.of(context),
        child: child!,
      ),
      localizationsDelegates: const [FormBuilderLocalizations.delegate],
    );
  }
}
