import '../../data/products.dart';
import '../widgets/cart/cart_product_item.dart';
import '../widgets/cart/cart_summary_card.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key, required this.onShopping}) : super(key: key);

  final VoidCallback onShopping;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cart')),
      body: CardWidget(),
      // EmptyCart(onTap: onShopping),
    );
  }
}

class CardWidget extends StatelessWidget {
  const CardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 3,
          child: ListView.builder(
            itemExtent: 280,
            itemCount: products.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final product = products[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                child: CartProduct(product: product),
              );
            },
          ),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: CartSummaryCard(
              deliveryFee: 0,
              subtotal: 24.4,
            ),
          ),
        ),
      ],
    );
  }
}
