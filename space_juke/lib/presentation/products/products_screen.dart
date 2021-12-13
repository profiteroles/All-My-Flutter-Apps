import '../cart/cart_controller.dart';
import 'products_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ProductsScreen extends StatelessWidget {
  // final controller = Get.put<ProductsController>(ProductsController());

  ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final cartController = Get.find<CartController>();

    return Scaffold(
      appBar: AppBar(title: Text('Products')),
      body: Center(child: Text('Tracks Screen')),
      // body: Obx(
      //   () => controller.trackList.isEmpty
      //       ? Center(child: CircularProgressIndicator())
      //       : GridView.builder(
      //           itemCount: controller.productsList.length,
      //           padding: EdgeInsets.all(20),
      //           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //             crossAxisCount: 2,
      //             childAspectRatio: 2 / 3,
      //             crossAxisSpacing: 10,
      //             mainAxisSpacing: 10,
      //           ),
      //           itemBuilder: (context, index) {
      //             return Card(
      //               elevation: 8,
      //               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      //               child: CardItemDetails(
      //                 product: product,
      //                 forHome: true,
      //                 bottomChild: Expanded(
      //                   flex: 2,
      //                   child: Padding(
      //                     padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      //                     child: AppButton(
      //                       title: 'Add',
      //                       onTap: () => cartController.onAdd(ProductCart(product: product)),
      //                       padding: EdgeInsets.symmetric(vertical: 3),
      //                     ),
      //                   ),
      //                 ),
      //               ),
      //             );
      //           },
      //         ),
      // ),
    );
  }
}
