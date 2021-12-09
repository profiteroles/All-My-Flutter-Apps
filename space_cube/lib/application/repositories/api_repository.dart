import '../../application/models/track.dart';
import '../../application/models/user.dart';
import '../../application/request/login_request.dart';
import '../../application/response/login_response.dart';

abstract class APIRepositoryInterface {
  Future<User> getUserFromToken(String token);
  Future<LoginResponse> login(LoginRequest login);
  Future<void> logout(String token);
  Future<List<Track>> getTracks();
}
