import 'package:deliverone/presentation/cart/cart_controller.dart';
import 'package:deliverone/presentation/widgets/cart/empty_cart.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../data/products.dart';
import '../widgets/cart/cart_product_item_card.dart';
import '../widgets/cart/cart_summary_card.dart';
import 'package:flutter/material.dart';

class CartScreen extends GetWidget<CartController> {
  CartScreen({Key? key, required this.onShopping}) : super(key: key);

  final VoidCallback onShopping;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cart')),
      body: Obx(
        () => controller.totalItems.value == 0 ? EmptyCart(onTap: onShopping) : CardWidget(),
      ),
    );
  }
}

class CardWidget extends GetWidget<CartController> {
  const CardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 3,
          child: Obx(
            () => ListView.builder(
              itemExtent: 280,
              itemCount: controller.cartList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final productCard = controller.cartList[index];
                return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                    child: CartProductItemCard(
                      productCart: productCard,
                      onIncrement: () => controller.onAdd(productCard),
                      onDecrement: () => controller.onDecrementItem(productCard),
                      onDelete: () => controller.onDeleteItem(productCard),
                    ));
              },
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: CartSummaryCard(),
          ),
        ),
      ],
    );
  }
}
