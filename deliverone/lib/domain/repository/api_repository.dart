import 'package:deliverone/domain/models/product.dart';

import '../models/user.dart';
import '../request/login_request.dart';
import '../response/login_response.dart';

abstract class APIRepositoryInterface {
  Future<User> getUserFromToken(String token);
  Future<LoginResponse> login(LoginRequest login);
  Future<void> logout(String token);
  Future<List<Product>> getProducts();
}
