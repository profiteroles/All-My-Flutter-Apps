import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/state_manager.dart';
import 'package:space_cube/application/exception/auth_exception.dart';
import 'package:space_cube/application/repositories/api_repository.dart';
import 'package:space_cube/application/request/login_request.dart';
import 'package:space_cube/application/state/juke_api.dart';
import 'package:space_cube/application/storage/local_storage.dart';
import 'package:space_cube/widgets/snackbar_error.dart';

enum LoginState {
  loading,
  initial,
}

class LoginController extends GetxController {
  LoginController({required this.localInterface, required this.apiInterface});
  final LocalStorageInterface localInterface;
  final APIRepositoryInterface apiInterface;

  // final emailController = TextEditingController();
  // final passwordController = TextEditingController();
  var loginState = LoginState.initial.obs;

//TODO: Convert to Key
  final fbKey = GlobalKey<FormBuilderState>();

  // Future<bool> oldlogin() async {
  //   final email = emailController.text;
  //   final password = passwordController.text;
  //   try {
  //     loginState(LoginState.loading);
  //     final loginResponse = await apiInterface.login(LoginRequest(email, password));

  //     await localInterface.saveToken(loginResponse.token);
  //     await localInterface.saveUser(loginResponse.user);
  //     return true;
  //   } on AuthException catch (e) {
  //     loginState(LoginState.initial);
  //     print('Login Auth Exp Error: ');
  //     print(e);
  //     return false;
  //   }
  // }

  Future<bool> login() async {
    fbKey.currentState?.save();

    if (fbKey.currentState!.validate()) {
      final email = fbKey.currentState!.value['email'];
      final password = fbKey.currentState!.value['password'];

      var data = fbKey.currentState!.value;
      print(data);
      try {
        loginState(LoginState.loading);
        // var response = await JukeAPI.dio.post('login', data: data);
        // print(response);
        final loginResponse = await apiInterface.login(LoginRequest(email, password));

        await localInterface.saveToken(loginResponse.token);
        await localInterface.saveUser(loginResponse.user);
        return true;
        // return response.statusCode == 201 ? true : false;
        // } on DioError catch (e) {
      } on AuthException catch (e) {
        loginState(LoginState.initial);
        // if (e.response == null) {
        //   print('more shit');
        //   snackbarError('Check Your Internet Connection');
        // }
        // print(e.response);
        // snackbarError(e.response!.data['message']);
        snackbarError('Check Your Login Details');

        return false;
      }
    } else {
      return false;
    }
  }
}
