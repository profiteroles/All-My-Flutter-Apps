import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:space_juke/domain/provider/playlist_provider.dart';
import 'package:space_juke/domain/repository/playlist_repository.dart';

import 'playlist_controller.dart';

class PlaylistBinding extends Bindings {
  @override
  void dependencies() {
    print('PlaylistBinding - dependencies is Called');
    Get.lazyPut<PlaylistController>(() => PlaylistController());
  }
}
