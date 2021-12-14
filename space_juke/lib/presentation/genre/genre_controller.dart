import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:space_juke/domain/models/genre.dart';
import 'package:space_juke/domain/repository/genre_repository.dart';

class GenreController extends GetxController with StateMixin {
  final genreRepository = Get.find<GenreRepository>();

  @override
  void onInit() {
    super.onInit();
    loadGenres();
  }

  void loadGenres() async {
    print('GenreController - loadGenres is Called');
    await genreRepository.getAll().then((value) {
      change(value, status: RxStatus.success());
    }).catchError((err) {
      print('GenreController - loadGenres - catchError');
      print(err);
      change(null, status: RxStatus.error('Error has occoured'));
    });
  }
}
