import 'package:get/get.dart';
import 'package:space_juke/domain/provider/track_provider.dart';
import 'package:space_juke/domain/repository/tracks_repository.dart';
import 'package:space_juke/presentation/tracks/tracks_controller.dart';

class TracksBinding extends Bindings {
  @override
  void dependencies() {
    // Get.put(TracksController());
    Get.lazyPut<TracksController>(() => TracksController());
    Get.lazyPut<TracksRepository>(() => TracksRepository());
    Get.lazyPut<TrackAPIClient>(() => TrackAPIClient());
  }
}
