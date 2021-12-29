import 'package:deliverone/data/products.dart';
import 'package:get/get_connect.dart';
import '../models/product.dart';
import '../request/login_request.dart';
import '../response/login_response.dart';
import '../models/user.dart';
import '../exception/auth_exception.dart';
import 'api_repository.dart';

class APIRepositoryImpl extends APIRepositoryInterface {
  final client = GetConnect();
  @override
  Future<User> getUserFromToken(String token) async {
    print('API Repo Impl - getUserFromToken is Called');

    await Future.delayed(Duration(seconds: 1));
    if (token == 'AA111') {
      return User(name: 'Steve Jobs', email: 'a@a.com', image: 'assets/images/logo.png');
    } else if (token == 'AA222') {
      return User(name: 'Elon Musk', email: 'a@b.com', image: 'assets/images/originallogo.png');
    }
    throw AuthException();
  }

  @override
  Future<LoginResponse> login(LoginRequest login) async {
    await Future.delayed(Duration(seconds: 1));
    if (login.email == 'a@a.com' && login.password == '123123123') {
      return LoginResponse('AA111', User(name: 'Steve Jobs', email: 't@t.c', image: 'assets/images/logo.png'));
    } else if (login.email == 'a@b.com' && login.password == '123123123') {
      return LoginResponse('AA222', User(name: 'Elon Musk', email: 'a@b.com', image: 'assets/images/originallogo.png'));
    }

    throw AuthException();
  }

  @override
  Future<void> logout(String token) async {
    print('API Repo Impl - logout is Called');
    print('removing token from server. Token is: $token');
    return;
  }

  @override
  Future<List<Product>> getProducts() async {
    print('API Repo Impl - getProducts is Called');
    await Future.delayed(Duration(seconds: 1));
    return products;
  }
}
