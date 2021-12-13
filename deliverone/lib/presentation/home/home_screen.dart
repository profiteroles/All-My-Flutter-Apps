import 'package:deliverone/presentation/cart/cart_screen.dart';
import 'package:deliverone/presentation/home/home_controller.dart';
import 'package:deliverone/presentation/products/products_screen.dart';
import 'package:deliverone/presentation/profile/profile_screen.dart';
import 'package:deliverone/presentation/widgets/bottom_navbar.dart';
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
              image: controller.user().image,
              index: controller.index(),
              onIndexSelected: (i) => controller.index(i),
            ),
          ],
        ),
      ),
    );
  }
}
