import 'package:book_store/widgets/appbar.dart';
import 'package:book_store/widgets/book_detail_sec.dart';
import 'package:book_store/widgets/divider.dart';
import 'package:flutter/material.dart';

import '../models/book.dart';

class PurchaseScreen extends StatelessWidget {
  const PurchaseScreen({Key? key, required this.book}) : super(key: key);

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, book.title),
      body: Column(
        children: [
          BookImage(book: book),
          MyDivider(),
          DetailsSection(book: book),
        ],
      ),
    );
  }
}
