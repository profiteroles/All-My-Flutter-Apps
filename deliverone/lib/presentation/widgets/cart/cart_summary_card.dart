import 'package:flutter/material.dart';
import '../appbutton.dart';

class CartSummaryCard extends StatelessWidget {
  const CartSummaryCard({
    required this.subtotal,
    required this.deliveryFee,
    Key? key,
  }) : super(key: key);
  final double subtotal, deliveryFee;

  @override
  Widget build(BuildContext context) {
    final double total = subtotal + deliveryFee;
    return Card(
      color: Theme.of(context).canvasColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Sub Total',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
                ),
                Text(
                  '\$$subtotal AUD',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Delivery',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
                ),
                Text(
                  deliveryFee == 0 ? 'Free' : '\$$deliveryFee AUD',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
                ),
                Text(
                  '\$$total AUD',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
                ),
              ],
            ),
            Spacer(),
            AppButton(title: 'Check Out', onTap: () {})
          ],
        ),
      ),
    );
  }
}
