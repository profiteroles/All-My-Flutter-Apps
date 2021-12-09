import 'package:space_cube/application/exception/auth_exception.dart';
import 'package:space_cube/application/models/fake_data_tracks.dart';
import 'package:space_cube/application/models/track.dart';
import 'package:space_cube/application/models/user.dart';
import 'package:space_cube/application/repositories/api_repository.dart';
import 'package:space_cube/application/response/login_response.dart';
import 'package:space_cube/application/request/login_request.dart';

class APIRepositoryImpl extends APIRepositoryInterface {
  @override
  Future<User> getUserFromToken(String token) async {
    print('API Repo Impl - getUserFromToken is Called');

    await Future.delayed(Duration(seconds: 1));
    if (token == 'AA111') {
      return User(name: 'Steve Jobs', email: 't@t.c', image: 'assets/images/logo.png');
    } else if (token == 'AA222') {
      return User(name: 'Elon Musk', email: 'e@t.c', image: 'assets/images/originallogo.png');
    }

    throw AuthException();
  }

  @override
  Future<LoginResponse> login(LoginRequest login) async {
    print('API Repo Impl - login is Called');

    await Future.delayed(Duration(seconds: 1));
    if (login.email == 't@t.c' && login.password == '123123123') {
      return LoginResponse('AA111', User(name: 'Steve Jobs', email: 't@t.c', image: 'assets/images/logo.png'));
    } else if (login.email == 'e@t.c' && login.password == '123123123') {
      return LoginResponse('AA222', User(name: 'Elon Musk', email: 'e@t.c', image: 'assets/images/originallogo.png'));
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
  Future<List<Track>> getTracks() async {
    print('API Repo Impl - getToken is Called');
    await Future.delayed(Duration(seconds: 1));
    return fakeDataTracks;
  }
}
