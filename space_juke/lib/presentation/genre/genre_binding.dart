import 'package:get/instance_manager.dart';
import 'package:space_juke/domain/provider/genre_provider.dart';
import 'package:space_juke/domain/repository/genre_repository.dart';

import 'genre_controller.dart';

class GenreBinding extends Bindings {
  @override
  void dependencies() {
    print('GenreBinding - dependencies is Called');
    Get.lazyPut<GenreController>(() => GenreController());
    Get.lazyPut<GenreAPIClient>(() => GenreAPIClient());
    Get.lazyPut<GenreRepository>(() => GenreRepository());
  }
}
