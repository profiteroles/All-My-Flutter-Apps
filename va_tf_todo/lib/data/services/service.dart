import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:va_tf_todo/values/utils/key.dart';

class StorageService extends GetxService {
  late GetStorage _storage;
  Future<StorageService> init() async {
    _storage = GetStorage();
    await _storage.writeIfNull(taskKey, []);
    return this;
  }

  T read<T>(String key) {
    return _storage.read(key);
  }

  void write(String key, dynamic value) async {
    await _storage.write(key, value);
  }
}
