import '../../domain/exception/auth_exception.dart';
import '../../domain/repository/local_storage_repository.dart';
import '../../domain/request/login_request.dart';
import '../../domain/repository/api_repository.dart';
import '../widgets/snackbar_error.dart';
import 'package:flutter/widgets.dart';
import 'package:get/state_manager.dart';

enum LoginState {
  loading,
  initial,
}

class LoginController extends GetxController {
  LoginController({required this.localInterface, required this.apiInterface});
  final LocalStorageInterface localInterface;
  final APIRepositoryInterface apiInterface;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  var loginState = LoginState.initial.obs;

  Future<bool> login() async {
    print('LoginController - login is Called');
    final email = emailController.text;
    final password = passwordController.text;
    try {
      loginState(LoginState.loading);
      final loginResponse = await apiInterface.login(LoginRequest(email, password));

      await localInterface.saveToken(loginResponse.token);
      await localInterface.saveUser(loginResponse.user);
      return true;
    } on AuthException catch (e) {
      print('Login Controller - Caught an Exception');
      print(e);
      print('_________');
      loginState(LoginState.initial);
      snackbarError('Check Your Login Details');
      return false;
    }
    // } else {
    //   return false;
    // }
  }
}
