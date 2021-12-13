import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:space_juke/domain/repository/auth_repository.dart';
import 'package:space_juke/presentation/widgets/snackbar_error.dart';
import 'package:space_juke/values/constants.dart';
import 'package:space_juke/values/routes/routes.dart';

enum SingUpState { loading, initial }

class SignUpController extends GetxController {
  var singUpState = SingUpState.initial.obs;
  final fbKey = GlobalKey<FormBuilderState>();
  final repository = Get.find<AuthRepository>();
  final storage = GetStorage(STORAGE_KEY);

  void register() async {
    debugPrint('SignUpController - register is Called');

    if (fbKey.currentState!.saveAndValidate()) {
      debugPrint('SignUpController - register - Values Saved & Validated');

      var data = fbKey.currentState!.value;
      singUpState(SingUpState.loading);

      await repository.register(data: data).then((value) {
        print(value);
        print('________END________');
        storage.read(SESSION_KEY);
        storage.write(SESSION_KEY, value);
        Get.offNamed(AppRoutes.home);
        singUpState(SingUpState.initial);
      }).onError((error, stackTrace) {
        singUpState(SingUpState.initial);
        debugPrint('SignUpController - register - onError');
        print(stackTrace);
        print('________END__STACKTRACE______');

        singUpState(SingUpState.initial);
        debugPrint(error.toString());
        print('________END__ERROR______');

        snackbarError('On Error');
      }).catchError((err) {
        debugPrint('SignUpController - register - Caught an Error:');
        singUpState(SingUpState.initial);
        debugPrint(err);
        snackbarError('Check Your Interner Connection');
      });
    }
  }
  // var signUpState = SingUpState.initial.obs;

  // Future<void> submitRegistration() async {
  //   debugPrint('SignUpController - submitRegistration is Called');
  //   if (fbKey.currentState!.validate()) {
  //     fbKey.currentState!.saveAndValidate();
  //     debugPrint('SignUpController - submitRegistration - Values Saved & Validated');
  //     var data = fbKey.currentState!.value;
  //     print(data);

  //     try {
  //       signUpState(SingUpState.loading);
  //       await auth.register(data).then((result) async => {
  //             debugPrint('SignUpController - submitRegistration - Printing Result:'),
  //             debugPrint(result.token),
  //             await localInterface.saveToken(result.token),
  //             await localInterface.saveUser(result.user),
  //             Get.offAllNamed(AppRoutes.home),
  //             debugPrint('_____End______'),
  //           });
  //       signUpState(SingUpState.initial);
  //     } on AuthException catch (e) {
  //       debugPrint('SignUpController - submitRegistration - Caught an Exception:');
  //       signUpState(SingUpState.initial);
  //       debugPrint('Issue is: $e');
  //     }
  //   }
  // }
}
