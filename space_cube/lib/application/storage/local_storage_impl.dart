import 'package:space_cube/application/models/user.dart';
import 'package:space_cube/application/storage/local_storage.dart';
import 'package:get_storage/get_storage.dart';

const _TOKEN = 'USER_TOKEN';
const _USER_NAME = 'USER_NAME';
const _USER_EMAIL = 'USER_EMAIL';
const _USER_IMAGE = 'USER_IMAGE';
const _USER_THEME = 'USER_THEME';

class LocalStorageImpl extends LocalStorageInterface {
  @override
  Future<void> clearAllData() async {
    GetStorage storage = await GetStorage();
    print('Local Storage - clearAllData is Called: ');
    storage.remove(_TOKEN);
    storage.remove(_USER_EMAIL);
  }

  @override
  Future<String> getToken() async {
    GetStorage storage = GetStorage();
    String token = storage.read(_TOKEN).toString();
    print('Local Storage - getToken is Called: ');
    print('Token is : ' + token);
    return token == 'null' ? '' : token;
  }

  @override
  Future<String> saveToken(String token) async {
    GetStorage storage = GetStorage();
    storage.write(_TOKEN, token);
    print('Local Storage - saveToken is Called: ');
    print(token);
    return token;
  }

  @override
  Future<User> saveUser(User user) async {
    GetStorage storage = GetStorage();
    storage.write(_USER_NAME, user.name);
    storage.write(_USER_EMAIL, user.email);
    storage.write(_USER_IMAGE, user.image);
    print('Local Storage - saveUser is Called: ');
    print(user.name);
    return user;
  }

  @override
  Future<User> getUser() async {
    GetStorage storage = GetStorage();
    final name = storage.read(_USER_NAME);
    final email = storage.read(_USER_EMAIL);
    final image = storage.read(_USER_IMAGE);
    print('Local Storage - getuser is Called: ');
    print(name);
    print(email);
    print(image);
    return User(name: name, email: email, image: image);
  }

  @override
  Future<bool> isDarkMode() async {
    GetStorage storage = GetStorage();
    var mode = storage.read(_USER_THEME);
    print('Local Storage - isDarkMode is Called: ');
    print(mode);
    return mode;
  }

  @override
  Future<void> saveDarkMode(bool darkMode) async {
    GetStorage storage = GetStorage();
    var savedData = storage.write(_USER_THEME, darkMode);
    print('Local Storage - saveDarkMode is Called: ');
    print(savedData);
  }
}
