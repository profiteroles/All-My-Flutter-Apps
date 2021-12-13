import 'package:deliverone/domain/models/product_cart.dart';
import 'package:deliverone/presentation/widgets/appbutton.dart';

import '../cart/cart_controller.dart';
import 'products_controller.dart';
import '../widgets/cart/card_item_details.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ProductsScreen extends StatelessWidget {
  final controller = Get.put<ProductsController>(ProductsController(Get.find()));

  @override
  Widget build(BuildContext context) {
    final cartController = Get.find<CartController>();

    return Scaffold(
      appBar: AppBar(title: Text('Products')),
      body: Obx(
        () => controller.productsList.isNotEmpty
            ? GridView.builder(
                itemCount: controller.productsList.length,
                padding: EdgeInsets.all(20),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2 / 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  final product = controller.productsList[index];
                  return Card(
                    elevation: 8,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    child: CardItemDetails(
                      product: product,
                      forHome: true,
                      bottomChild: Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          child: AppButton(
                            title: 'Add',
                            onTap: () => cartController.onAdd(ProductCart(product: product)),
                            padding: EdgeInsets.symmetric(vertical: 3),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              )
            : Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
