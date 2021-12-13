import '../cart/cart_screen.dart';
import '../home/home_controller.dart';
import '../products/products_screen.dart';
import '../profile/profile_screen.dart';
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
                  ProductsScreen(),
                  Placeholder(),
                  CartScreen(onShopping: () => controller.index(0)),
                  Placeholder(),
                  ProfileScreen(),
                ],
              ),
            ),
            JukeBottomNavBar(
              image: 'assets/images/logo.png',
              index: controller.index(),
              onIndexSelected: (i) => controller.index(i),
            ),
          ],
        ),
      ),
    );
  }
}
