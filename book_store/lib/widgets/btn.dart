import 'package:flutter/material.dart';

import '../constants.dart';

class PurchaseBtn extends StatelessWidget {
  const PurchaseBtn({
    this.title,
    Key? key,
    this.onTap,
    this.isDisable = false,
  }) : super(key: key);
  final String? title;
  final VoidCallback? onTap;
  final bool isDisable;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
      child: Center(
        child: ElevatedButton(
          onPressed: isDisable ? () {} : onTap,
          style: ElevatedButton.styleFrom(primary: isDisable ? Colors.grey : kBtnColor, elevation: isDisable ? 0 : 6),
          child: Container(
            height: 50,
            width: double.infinity,
            child: Center(
              child: Text(title ?? 'Add to Cart', style: TextStyle(fontSize: 22)),
            ),
          ),
        ),
      ),
    );
  }
}
