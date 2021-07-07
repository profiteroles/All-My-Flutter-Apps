import 'package:book_store/widgets/appbar.dart';
import 'package:flutter/material.dart';

class ThanksScreen extends StatelessWidget {
  const ThanksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, 'Confirmation', isLastPage: true),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Center(
          child: Text(
            'Thank you for Choosing Book Store\nYour purchase is on its way.',
            style: Theme.of(context).textTheme.headline3,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
