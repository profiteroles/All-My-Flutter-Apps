import 'package:flutter/material.dart';
import 'package:get/get_connect.dart';
import 'package:get_storage/get_storage.dart';
import 'package:space_juke/domain/models/auth.dart';
import 'package:space_juke/presentation/widgets/snackbar_error.dart';
import '../../values/constants.dart';

class AuthApiClient extends GetConnect {
  final storage = GetStorage(STORAGE_KEY);
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

  Future<Map<String, dynamic>> logout() async {
    debugPrint('AuthApiClient - logout is Called');
    final token = storage.read(SESSION_KEY)['token'];
    var response = await post(
      BASE_URL + 'logout',
      '',
      headers: {"Authorization": 'Bearer ' + token},
    );

    return response.body;
  }
}
