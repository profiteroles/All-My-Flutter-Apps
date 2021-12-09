import '/application/models/user.dart';

abstract class LocalStorageInterface {
  // static final _getStorage = () => GetStorage('space_juke');

  // static LocalStorage _storage = LocalStorage();

  Future<String> getToken();
  Future<String> saveToken(String token);
  Future<void> clearAllData();

  Future<User> saveUser(User user);
  Future<User> getUser();
  Future<void> saveDarkMode(bool darkMode);
  Future<bool> isDarkMode();
}
