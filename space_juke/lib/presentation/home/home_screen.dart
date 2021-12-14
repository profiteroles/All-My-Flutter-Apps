import 'package:space_juke/presentation/favs/favs_screen.dart';
import 'package:space_juke/presentation/genre/genre_screen.dart';

import '../playlist/playlist_screen.dart';
import '../tracks/tracks_screen.dart';
import '../../values/constants.dart';

import '../home/home_controller.dart';
import 'profile_screen.dart';
import '../widgets/bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class HomeScreen extends GetWidget<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: IndexedStack(
                index: controller.index(),
                children: [
                  TracksScreen(),
                  GenreScreen(),
                  PlaylistScreen(),
                  FavouritesScreen(),
                  ProfileScreen(),
                ],
              ),
            ),
            JukeBottomNavBar(
              image: '${IMAGE_PATH}logo.png',
              index: controller.index(),
              onIndexSelected: (i) => controller.index(i),
            ),
          ],
        ),
      ),
    );
  }
}
