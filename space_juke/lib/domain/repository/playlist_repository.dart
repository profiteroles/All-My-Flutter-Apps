import 'package:get/instance_manager.dart';
import 'package:space_juke/domain/models/playlist.dart';
import 'package:space_juke/domain/provider/playlist_provider.dart';

class PlaylistRepository {
  final PlaylistAPIClient apiClient = Get.find<PlaylistAPIClient>();

  Future<List<Playlist>> getAll() async {
    print('PlaylistRepository - getAll is Called');
    List<Playlist> playlist = <Playlist>[];
    var response = await apiClient.getAll();
    // print('PlaylistAPIClient__________Playlist Response__________');
    // print(response);
    // print('PlaylistAPIClient__________Response END__________');
    for (var tracks in response) {
      print(tracks);
      print('PlaylistAPIClient__________ tracks END__________');

      playlist.add(Playlist.fromJson(tracks));
    }

    return playlist;
  }
}
