import 'package:space_juke/domain/models/auth.dart';
import 'package:space_juke/domain/provider/auth_provider.dart';

class AuthRepository {
  final AuthApiClient apiClient = AuthApiClient();

  Future<Auth> login({required Map<String, dynamic> data}) async {
    print('AuthRepository - login is Called');
    Map<String, dynamic> json = await apiClient.login(data);
    return Auth.fromJson(json);
  }

  Future<Auth> register({required Map<String, dynamic> data}) async {
    print('AuthRepository - register is Called');
    Map<String, dynamic> json = await apiClient.register(data);
    return Auth.fromJson(json);
  }

  Future<Map<String, dynamic>> logout() async {
    print('AuthRepository - logout is Called');

    Map<String, dynamic> json = await apiClient.logout();
    return json;
  }
}
