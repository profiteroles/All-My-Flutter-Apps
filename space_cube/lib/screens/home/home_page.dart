import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:space_cube/screens/home/home_controller.dart';

class HomePage extends GetWidget<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        // appBar: AppBar(
        //     title: TextButton(
        //   child: Text(
        //     'Home Page',
        //     style: TextStyle(color: Colors.white),
        //   ),
        //   onPressed: () => print(controller.index()),
        // )),
        body: PageView(
          controller: controller.pageController,
          physics: NeverScrollableScrollPhysics(),
          children: controller.screens,
          onPageChanged: (i) => controller.index(i),
        ),
        bottomNavigationBar: Obx(() => BottomNavigationBar(
              currentIndex: controller.index(),
              selectedItemColor: controller.index() == 2 ? Colors.red : Theme.of(context).primaryColor,
              unselectedItemColor: Theme.of(context).primaryColor.withOpacity(0.6),
              type: BottomNavigationBarType.fixed,
              onTap: (i) => controller.pageController.jumpToPage(i),
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.playlist_play_outlined), label: 'Tracks'),
                BottomNavigationBarItem(icon: Icon(Icons.playlist_add_check_rounded), label: 'Playlist'),
                BottomNavigationBarItem(icon: Icon(Icons.favorite_sharp), label: 'Favourites'),
                BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
              ],
            )),
      );
}
