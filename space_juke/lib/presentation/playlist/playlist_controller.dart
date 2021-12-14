import 'package:get/get.dart';
import '../../domain/repository/playlist_repository.dart';

class PlaylistController extends GetxController with StateMixin {
  final repo = Get.find<PlaylistRepository>();

  @override
  void onInit() {
    super.onInit();
    loadPlaylist();
  }

  void loadPlaylist() async {
    print('PlaylistController - loadPlaylist is Called');
    await repo.getAll().then((value) {
      change(value, status: RxStatus.success());
    }).catchError((err) {
      print('PlaylistController - loadPlaylist - catchError');
      change(null, status: RxStatus.error('Error has occoured'));
    });
  }
}
