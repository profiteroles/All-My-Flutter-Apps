import 'package:get_storage/get_storage.dart';

class LocalStorage {
  static final _getStorage = () => GetStorage('space_juke');

  static LocalStorage _storage = LocalStorage();
}
