import 'package:book_store/constants.dart';
import 'package:book_store/screens/purchase.dart';
import 'package:book_store/widgets/appbar.dart';
import 'package:book_store/widgets/divider.dart';
import 'package:flutter/material.dart';

import '../models/book.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, 'Book Store'),
      body: Column(
        children: [
          BookSection(books: kFantasyBooks),
          MyDivider(),
          BookSection(
            books: kCrimeBooks,
            discount: 5,
          ),
          MyDivider(),
          BookSection(books: kRomancePBooks),
        ],
      ),
    );
  }
}

class BookSection extends StatelessWidget {
  const BookSection({
    Key? key,
    required this.books,
    this.discount,
  }) : super(key: key);

  final List<Book> books;
  final int? discount;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(left: 40, top: 20),
        height: 100,
        width: double.infinity,
        decoration: BoxDecoration(color: Colors.blueGrey[600]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(books[0].genre, style: Theme.of(context).textTheme.headline6),
                discount != null ? Text(' **$discount% Off** Limited Time Offer', style: Theme.of(context).textTheme.headline6) : Container(),
              ],
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blueGrey.withOpacity(.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: books.length,
                  itemBuilder: (context, int i) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PurchaseScreen(book: books[i]),
                          )),
                      child: Image.asset(kPath + books[i].imageFile),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
