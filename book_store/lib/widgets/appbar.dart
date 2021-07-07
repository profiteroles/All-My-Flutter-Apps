import 'package:book_store/screens/checkout.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

AppBar buildAppBar(BuildContext context, String title, {VoidCallback? onTap, bool isLastPage = false}) {
  return AppBar(
    backgroundColor: Colors.blueGrey.shade800.withOpacity(.4),
    automaticallyImplyLeading: isLastPage ? false : true,
    elevation: 3,
    title: Text(
      title,
      style: Theme.of(context).textTheme.headline5?.copyWith(
            color: Colors.blueGrey[900],
            fontWeight: FontWeight.w600,
          ),
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 20),
        child: isLastPage
            ? IconButton(
                icon: Icon(Icons.home),
                onPressed: () => Navigator.popUntil(context, (route) => route.isFirst),
              )
            : IconButton(
                icon: Icon(Icons.shopping_cart_rounded),
                onPressed: () => showBarModalBottomSheet(
                  context: context,
                  builder: (context) => CheckOutScreen(),
                ),
              ),
      ),
    ],
  );
}
