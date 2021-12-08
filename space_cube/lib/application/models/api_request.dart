// import 'package:dio/dio.dart';
// import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class ApiRequest extends GetxController {
  // final String url;
  // final Map<String, dynamic> data;

  // ApiRequest({
  //   required this.url,
  //   required this.data,
  // });

  var rootUrl = 'http://localhost/api/'.obs;

  String requestUrl(String url) => rootUrl + url;

  // Dio _dio() {
  //   // Put your authorization token here
  //   return Dio(BaseOptions(headers: {
  //     'Authorization': 'B ....',
  //   }));
  // }

  // void get({
  //   Function()? beforeSend,
  //   Function(dynamic data)? onSuccess,
  //   Function(dynamic error)? onError,
  // }) {
  //   _dio().get(url, queryParameters: data).then((res) {
  //     if (onSuccess != null) onSuccess(res.data);
  //   }).catchError((error) {
  //     if (onError != null) onError(error);
  //   });
  // }
}
