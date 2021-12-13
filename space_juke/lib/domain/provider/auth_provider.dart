import 'package:flutter/material.dart';
import 'package:get/get_connect.dart';
import 'package:space_juke/presentation/widgets/snackbar_error.dart';
import '../../values/constants.dart';

class AuthApiClient extends GetConnect {
  Future<Map<String, dynamic>> login(Map<String, dynamic> data) async {
    debugPrint('AuthApiClient - login is Called');
    final response = await post(BASE_URL + "login", data);
    debugPrint('Response Code is: ${response.statusCode}');
    print(response.body);
    debugPrint('_______END OF THE BODY_______');
    if (response.status.hasError) {
      debugPrint('AuthApiClient - login Has error caught');
      snackbarError(response.body['message']);
      throw Exception([response.body]);
    } else {
      print('Success');
      return response.body;
    }
  }

  Future<Map<String, dynamic>> register(Map<String, dynamic> data) async {
    debugPrint('AuthApiClient - login is Called');
    final response = await post(BASE_URL + "register", data);
    debugPrint('Response Code is: ${response.statusCode}');
    print(response.body);
    debugPrint('_______END OF THE BODY_______');
    if (response.status.hasError) {
      debugPrint('AuthApiClient - login Has error caught');
      snackbarError(response.body['message']);
      throw Exception([response.body]);
    } else {
      print('Success');
      return response.body;
    }
  }
}
