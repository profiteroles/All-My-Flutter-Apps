import '../../../domain/models/product_cart.dart';
import '../../cart/cart_controller.dart';
import '../../../themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'card_item_details.dart';

class CartProductItemCard extends StatelessWidget {
  const CartProductItemCard({
    required this.productCart,
    required this.onIncrement,
    required this.onDecrement,
    required this.onDelete,
    Key? key,
  }) : super(key: key);
  final ProductCart productCart;
  final VoidCallback onIncrement, onDecrement, onDelete;

  @override
  Widget build(BuildContext context) {
    final cartController = Get.find<CartController>();

    return Stack(
      children: [
        Card(
          elevation: 8,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: CardItemDetails(
            product: productCart.product,
            forHome: false,
            bottomChild: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: onDecrement,
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Icon(Icons.remove, color: AppColors.purple),
                  ),
                ),
                Text(productCart.quantity.toString()),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.purple,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: InkWell(
                    child: Icon(Icons.add, color: AppColors.white),
                    onTap: onIncrement,
                  ),
                ),
                Text(
                  '\$${productCart.product.price}',
                  style: TextStyle(color: AppColors.green),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          right: 0,
          child: CircleAvatar(
            backgroundColor: AppColors.pink,
            child: IconButton(
              icon: Icon(Icons.delete_outline),
              onPressed: onDelete,
            ),
          ),
        )
      ],
    );
  }
}
