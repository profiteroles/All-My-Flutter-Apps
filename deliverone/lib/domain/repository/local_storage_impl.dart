import 'package:shared_preferences/shared_preferences.dart';
import '../models/user.dart';
import 'local_storage_repository.dart';

const _TOKEN = 'USER_TOKEN';
const _USER_NAME = 'USER_NAME';
const _USER_EMAIL = 'USER_EMAIL';
const _USER_IMAGE = 'USER_IMAGE';
const _USER_THEME = 'USER_THEME';

class LocalStorageImpl extends LocalStorageInterface {
  @override
  Future<void> clearAllData() async {
    print('Local Storage - clearAllData is Called: ');
    // GetStorage storage = await GetStorage();
    // storage.remove(_TOKEN);
    // storage.remove(_USER_EMAIL);
    SharedPreferences storage = await SharedPreferences.getInstance();
    storage.remove(_TOKEN);
    // storage.clear();
  }

  @override
  Future<String> getToken() async {
    print('Local Storage - getToken is Called: ');

    // GetStorage storage = GetStorage();
    // String token = storage.read(_TOKEN).toString();
    // print('Token is : ' + token);
    SharedPreferences storage = await SharedPreferences.getInstance();
    String token = storage.getString(_TOKEN).toString();

    print('Current token is: $token');
    return token == 'null' ? '' : token;
  }

  @override
  Future<String> saveToken(String token) async {
    print('Local Storage - saveToken is Called: ');
    // GetStorage storage = GetStorage();
    // storage.write(_TOKEN, token);
    SharedPreferences storage = await SharedPreferences.getInstance();
    storage.setString(_TOKEN, token);
    print('Token saved as: $token');
    return token;
  }

  @override
  Future<User> saveUser(User user) async {
    print('Local Storage - saveUser is Called: ');
    // GetStorage storage = GetStorage();
    // storage.write(_USER_NAME, user.name);
    // storage.write(_USER_EMAIL, user.email);
    // storage.write(_USER_IMAGE, user.image);
    SharedPreferences storage = await SharedPreferences.getInstance();
    storage.setString(_USER_NAME, user.name);
    storage.setString(_USER_EMAIL, user.email);
    storage.setString(_USER_IMAGE, user.image);
    print("User saved as: ${user.name} ${user.email} ${user.image}");
    return user;
  }

  @override
  Future<User> getUser() async {
    print('Local Storage - getuser is Called: ');
    // GetStorage storage = GetStorage();
    // final name = storage.read(_USER_NAME);
    // final email = storage.read(_USER_EMAIL);
    // final image = storage.read(_USER_IMAGE);
    SharedPreferences storage = await SharedPreferences.getInstance();
    String name = storage.getString(_USER_NAME).toString();
    String email = storage.getString(_USER_EMAIL).toString();
    String image = storage.getString(_USER_IMAGE).toString();
    print("Current User is: $name $email $image");
    return User(name: name, email: email, image: image);
  }

  @override
  Future<bool> isDarkMode() async {
    print('Local Storage - isDarkMode is Called: ');
    // GetStorage storage = GetStorage();
    // var mode = storage.read(_USER_THEME);
    SharedPreferences storage = await SharedPreferences.getInstance();
    bool? mode = storage.getBool(_USER_THEME);
    print('Local Storage Impl- isDarkMode is $mode');
    return mode ?? false;
  }

  @override
  Future<void> saveThemeMode(bool darkMode) async {
    print('Local Storage - saveThemeMode is Called: ');
    // GetStorage storage = GetStorage();
    // var savedData = storage.write(_USER_THEME, darkMode);
    SharedPreferences storage = await SharedPreferences.getInstance();
    storage.setBool(_USER_THEME, darkMode);
    print('Local Storage - saveThemeMode - Theme is saved as $darkMode');
  }
}
