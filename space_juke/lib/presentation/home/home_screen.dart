import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/fab.dart';
import '../../values/constants.dart';
import 'home_controller.dart';
import '../widgets/bottom_navbar.dart';
//Routes
import '../../values/routes/routes.dart';
import 'profile_screen.dart';
import '../favs/favs_screen.dart';
import '../genre/genre_screen.dart';
import '../tracks/tracks_screen.dart';
import '../playlist/playlist_screen.dart';

class HomeScreen extends GetWidget<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(
        () => JukeBottomNavBar(
          image: '${IMAGE_PATH}logo.png',
          index: controller.index(),
          onIndexSelected: (i) => controller.index(i),
        ),
      ),
      floatingActionButton: JukeFab(
        label: 'ADD',
        icon: Icons.add,
        onPressed: () => Get.toNamed(AppRoutes.addTrack),
      ),
      body: Obx(
        () => IndexedStack(
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
    );
  }
}
