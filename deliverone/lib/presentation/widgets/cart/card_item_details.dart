import 'package:flutter/material.dart';
import '../../../../domain/models/product.dart';
import '../../../../themes/theme.dart';
import '../../../../path.dart';
import '../appbutton.dart';

class CardItemDetails extends StatelessWidget {
  const CardItemDetails({
    Key? key,
    required this.product,
    this.forHome = true,
  }) : super(key: key);

  final Product product;
  final bool forHome;

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
            backgroundColor: AppColors.dark,
            child: ClipOval(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  IMAGE_PATH + product.image,
                  fit: BoxFit.cover,
                ),
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
        forHome
            ? Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: AppButton(
                    title: 'Add',
                    onTap: () {},
                    padding: EdgeInsets.symmetric(vertical: 3),
                  ),
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Icon(Icons.remove, color: AppColors.purple),
                    ),
                  ),
                  Text('1'),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.purple,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: InkWell(
                      child: Icon(Icons.add, color: AppColors.white),
                      onTap: () {},
                    ),
                  ),
                  Text(
                    '\$${product.price}',
                    style: TextStyle(color: AppColors.green),
                  ),
                ],
              ),
        Spacer(),
      ],
    );
  }
}
