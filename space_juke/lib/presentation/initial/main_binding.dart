import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:space_juke/domain/provider/genre_provider.dart';
import 'package:space_juke/domain/provider/playlist_provider.dart';
import 'package:space_juke/domain/provider/track_provider.dart';
import 'package:space_juke/domain/repository/genre_repository.dart';
import 'package:space_juke/domain/repository/playlist_repository.dart';
import 'package:space_juke/domain/repository/tracks_repository.dart';
import 'package:space_juke/presentation/genre/genre_controller.dart';
import 'package:space_juke/presentation/home/home_controller.dart';
import 'package:space_juke/presentation/playlist/playlist_controller.dart';
import 'package:space_juke/presentation/tracks/tracks_controller.dart';

class MainBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<TracksController>(() => TracksController());
    Get.lazyPut<GenreController>(() => GenreController());
    Get.lazyPut<PlaylistController>(() => PlaylistController());
    Get.lazyPut<PlaylistAPIClient>(() => PlaylistAPIClient());
    Get.lazyPut<PlaylistRepository>(() => PlaylistRepository());
    Get.lazyPut<TracksRepository>(() => TracksRepository());
    Get.lazyPut<TrackAPIClient>(() => TrackAPIClient());
    Get.lazyPut<GenreAPIClient>(() => GenreAPIClient());
    Get.lazyPut<GenreRepository>(() => GenreRepository());
  }
}
