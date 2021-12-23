import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:va_tf_todo/screens/home/controller.dart';

class AppBottomNavBar extends GetView<HomeController> {
  const AppBottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        clipBehavior: Clip.antiAlias,
        // child: Theme(
        //   data: ThemeData(
        //     splashColor: Colors.transparent,
        //     highlightColor: Colors.transparent,
        //     canvasColor: Theme.of(context).bottomAppBarColor,
        //     bottomNavigationBarTheme: BottomNavigationBarThemeData(

        //     )
        //   ),
        child: BottomNavigationBar(
          // selectedItemColor: Theme.of(context).bottomAppBarColor,
          // unselectedItemColor: Colors.grey,
          currentIndex: controller.pageIndex(),
          onTap: controller.setPage,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.more_vert), label: ''),
          ],
        ),
      ),
      // ),
    );
  }
}
