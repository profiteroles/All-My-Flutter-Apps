import 'package:space_cube/application/models/user.dart';

class LoginResponse {
  LoginResponse(this.token, this.user);
  final String token;
  final User user;
}
