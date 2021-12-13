import 'package:flutter/material.dart';
import '../../../../domain/models/product.dart';
import '../../../../themes/theme.dart';
import '../../../../path.dart';

class CardItemDetails extends StatelessWidget {
  const CardItemDetails({
    Key? key,
    required this.product,
    this.forHome = false,
    required this.bottomChild,
  }) : super(key: key);

  final Product product;
  final bool forHome;
  final Widget bottomChild;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Spacer(),
        Expanded(
          flex: forHome ? 4 : 2,
          child: CircleAvatar(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Image.asset(
                IMAGE_PATH + product.image,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Expanded(
          flex: forHome ? 5 : 3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(product.name, textAlign: TextAlign.center),
              Text(
                product.desc,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.overline!.copyWith(color: AppColors.lightGrey),
                maxLines: forHome ? 2 : 3,
              ),
              if (forHome)
                Text(
                  '\$${product.price}',
                  style: TextStyle(color: Theme.of(context).colorScheme.onSecondary),
                ),
            ],
          ),
        ),
        bottomChild,
        Spacer(),
      ],
    );
  }
}
