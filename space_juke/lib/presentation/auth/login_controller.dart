import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:space_juke/domain/models/auth.dart';
import 'package:space_juke/domain/repository/auth_repository.dart';
import 'package:space_juke/values/constants.dart';
import 'package:space_juke/values/routes/routes.dart';
import '../widgets/snackbar_error.dart';

enum LoginState { loading, initial }

class LoginController extends GetxController {
  var loginState = LoginState.initial.obs;

  final fbKey = GlobalKey<FormBuilderState>();
  final repository = Get.find<AuthRepository>();
  final storage = GetStorage(STORAGE_KEY);

  late Auth auth;

  void login() async {
    debugPrint('LoginController - login is Called');

    if (fbKey.currentState!.saveAndValidate()) {
      debugPrint('LoginController - login - Values Saved & Validated');

      var data = fbKey.currentState!.value;
      loginState(LoginState.loading);

      await repository.login(data: data).then((value) {
        storage.write(SESSION_KEY, value);
        Get.offNamed(AppRoutes.home, arguments: data);
        loginState(LoginState.initial);
      }).catchError((err) {
        debugPrint('LoginController - login - Caught an Error:');
        loginState(LoginState.initial);
        debugPrint(err);
        snackbarError('Check Your Interner Connection');
      });
    }
  }
}
