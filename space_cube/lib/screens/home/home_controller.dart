import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import '../../application/models/user.dart';
import '../Playlists/playlists_page.dart';
import '../Tracks/tracks_page.dart';
import '../auth/profile.dart';
import '../favorities/favorities_page.dart';
import '../../application/storage/local_storage.dart';
import '../../application/repositories/api_repository.dart';

class HomeController extends GetxController {
  HomeController({required this.localInterface, required this.apiInterface});
  final LocalStorageInterface localInterface;
  final APIRepositoryInterface apiInterface;

  Rx<User>? user = User.empty().obs;
  RxInt index = 0.obs;

  final PageController pageController = PageController();

  final List<Widget> screens = [
    TracksPage(),
    PlaylistsPage(),
    FavoritiesPage(),
    ProfilePage(),
  ];

  @override
  void onReady() {
    super.onReady();
    print('onReady is Called');
    loadUser();
  }

  void updateIndex(int page) => pageController.jumpToPage(page);
  void loadUser() async => localInterface.getUser().then((value) => user!(value));

  void logout() async {
    print('Home Controller - logout is Called');
    final token = await localInterface.getToken();
    await apiInterface.logout(token);
    await localInterface.clearAllData();
  }
}
