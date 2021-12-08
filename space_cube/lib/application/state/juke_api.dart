import 'package:dio/dio.dart';
import 'package:space_cube/base_url.dart';

class JukeAPI {
  static BaseOptions _baseOptions = BaseOptions(baseUrl: BASE_URL);

  static Dio dio = Dio(_baseOptions);
}
