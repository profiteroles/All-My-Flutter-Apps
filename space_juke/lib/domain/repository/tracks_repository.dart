import 'package:get/instance_manager.dart';
import 'package:space_juke/domain/models/track.dart';
import 'package:space_juke/domain/provider/track_provider.dart';

class TracksRepository {
  final TrackAPIClient apiClient = Get.find<TrackAPIClient>();

  Future<List<Track>> getAll() async {
    print('TracksRepository - getAll is Called');
    List<Track> tracks = <Track>[];
    var response = await apiClient.getAll();
    // print('__________Tracks Response__________');
    // print(response);
    // print('__________Response END__________');
    for (var track in response) {
      tracks.add(Track.fromJson(track));
    }

    return tracks;
  }
}
