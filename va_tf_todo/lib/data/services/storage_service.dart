import 'package:flutter/foundation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:va_tf_todo/values/utils/keys.dart';

class StorageService extends GetxService {
  late GetStorage _storage;

  Future<StorageService> init() async {
    debugPrint('StorageService - init is Called');
    _storage = GetStorage();
    await _storage.writeIfNull(taskKey, []);
    return this;
  }

  T read<T>(String key) {
    debugPrint('StorageService - read is Called');
    return _storage.read(key);
  }

  void write(String key, dynamic value) async {
    debugPrint('StorageService - write is Called');
    await _storage.write(key, value);
  }
}
