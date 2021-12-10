import 'package:deliverone/domain/models/product.dart';
import 'package:deliverone/themes/theme.dart';
import 'package:flutter/material.dart';

import 'card_item_details.dart';

class CartProduct extends StatelessWidget {
  const CartProduct({
    required this.product,
    Key? key,
  }) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          elevation: 8,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: CardItemDetails(product: product, forHome: false),
        ),
        Positioned(
          right: 0,
          child: CircleAvatar(
            backgroundColor: AppColors.pink,
            child: IconButton(
              icon: Icon(Icons.delete_outline),
              onPressed: () {},
            ),
          ),
        )
      ],
    );
  }
}
