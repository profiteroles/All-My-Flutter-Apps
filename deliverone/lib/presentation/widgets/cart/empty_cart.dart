import 'package:flutter/material.dart';

import '../../../path.dart';
import '../app_elevated_button.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({Key? key, required this.onTap}) : super(key: key);

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('${IMAGE_PATH}emptycart.png', height: 90),
        SizedBox(height: 20),
        Text(
          'Looks like your shopping bag is empty',
          textAlign: TextAlign.center,
          style: TextStyle(color: Theme.of(context).colorScheme.onSecondary),
        ),
        SizedBox(height: 20),
        Center(
          child: AppElevatedBtn(onTap: onTap, title: 'Shop Now'),
        ),
      ],
    );
  }
}
