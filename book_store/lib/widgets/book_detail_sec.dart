import 'package:flutter/material.dart';

import '../models/book.dart';
import '../constants.dart';
import 'btn.dart';

class BookImage extends StatelessWidget {
  const BookImage({
    Key? key,
    required this.book,
  }) : super(key: key);

  final Book book;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        height: 100,
        width: double.infinity,
        child: Image.asset(kPath + book.imageFile),
        decoration: BoxDecoration(
          color: Colors.blueGrey.withOpacity(.7),
        ),
      ),
    );
  }
}

class DetailsSection extends StatefulWidget {
  const DetailsSection({
    Key? key,
    required this.book,
  }) : super(key: key);

  final Book book;

  @override
  _DetailsSectionState createState() => _DetailsSectionState();
}

class _DetailsSectionState extends State<DetailsSection> with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
        color: Colors.blueGrey,
        height: 100,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.book.title,
                      style: Theme.of(context).textTheme.headline5!.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    Text(
                      '\$${widget.book.price}',
                      style: Theme.of(context).textTheme.headline5!.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ],
                ),
                Text(
                  'Author: ' + widget.book.author,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                SizedBox(height: 30),
                Text(
                  widget.book.description,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                PurchaseBtn(
                  isDisable: widget.book.isPurchased ?? false,
                  onTap: () {
                    if (widget.book.isPurchased == null || widget.book.isPurchased == false) {
                      setState(() => widget.book.isPurchased = true);
                      kPurchasedBooks.add(widget.book);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
