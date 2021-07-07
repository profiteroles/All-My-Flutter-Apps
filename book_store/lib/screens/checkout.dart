import 'package:book_store/constants.dart';
import 'package:book_store/models/book.dart';
import 'package:book_store/screens/thanks.dart';
import 'package:book_store/widgets/btn.dart';
import 'package:book_store/widgets/divider.dart';
import 'package:flutter/material.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({Key? key}) : super(key: key);

  @override
  _CheckOutScreenState createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  static const screenTitle = 'Check Out';

  static double cartTotal = 0.0, deliveryFee = 0.0, discount = 0.0, totalAmount = 0.0, totalGST = 0.0;
  List<Book> discountedBooks = [];

  @override
  void initState() {
    super.initState();
    calculateCart();
    calculateDelivery();
    calculateDiscount();
    gstCalculator();
    calculateTotal();
  }

  void calculateDelivery() {
    double fee = 5.95;
    if (cartTotal > 20 || cartTotal == 0) {
      setState(() => deliveryFee = 0);
    } else {
      setState(() => deliveryFee = fee);
    }
  }

  void clearAll() {
    setState(() {
      cartTotal = 0.0;
      deliveryFee = 0.0;
      discount = 0.0;
      totalAmount = 0.0;
      totalGST = 0.0;
      kPurchasedBooks = [];
      discountedBooks = [];
    });
    for (var i = 0; i < kFantasyBooks.length; i++) {
      setState(() => kFantasyBooks[i].isPurchased = false);
    }
    for (var i = 0; i < kCrimeBooks.length; i++) {
      setState(() => kCrimeBooks[i].isPurchased = false);
    }
    for (var i = 0; i < kRomancePBooks.length; i++) {
      setState(() => kRomancePBooks[i].isPurchased = false);
    }
  }

  void calculateTotal() {
    setState(() => totalAmount = ((cartTotal + deliveryFee + totalGST) - discount));
  }

  void calculateCart() {
    double total = 0.0;
    for (int i = 0; i < kPurchasedBooks.length; i++) {
      total += kPurchasedBooks[i].price;
    }
    setState(() => cartTotal = total);
  }

  void calculateDiscount() {
    double countDiscountedBooks = 0.0;
    for (int i = 0; i < kPurchasedBooks.length; i++) {
      if (kPurchasedBooks[i].genre == 'Crime') {
        discountedBooks.add(kPurchasedBooks[i]);
        setState(() => countDiscountedBooks += kPurchasedBooks[i].price);
      }
    }

    setState(() => discount = countDiscountedBooks * .05);
  }

  void gstCalculator() {
    setState(() => totalGST = ((cartTotal - discount) + deliveryFee) * 0.10);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Container(
            height: 40,
            width: double.infinity,
            child: Text(
              screenTitle,
              style: Theme.of(context).textTheme.headline3,
              textAlign: TextAlign.center,
            ),
            decoration: BoxDecoration(
              color: kBtnColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(60),
                bottomRight: Radius.circular(60),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  offset: Offset(0, 0),
                  blurRadius: 160,
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 20),
        Expanded(
          flex: 15,
          child: Container(
            height: 30,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  offset: Offset(0, 1),
                  blurRadius: 10,
                ),
              ],
            ),
            child: ListView.builder(
              itemCount: kPurchasedBooks.length,
              itemBuilder: (context, int i) {
                return Column(
                  children: [
                    if (i != 0) MyDivider(),
                    _buildCartItem(
                      context,
                      kPurchasedBooks[i],
                      i,
                    ),
                  ],
                );
              },
            ),
          ),
        ),
        SizedBox(height: 20),
        buildTextRow(context, 'Purchased Books ex GST', '\$${cartTotal.toStringAsFixed(2)}'),
        buildTextRow(context, 'Books Discount x ${discountedBooks.length}', '\$-${discount.toStringAsFixed(2)}', fontSize: 16),
        buildTextRow(context, 'GST 10%', '\$${totalGST.toStringAsFixed(2)}', fontSize: 16),
        buildTextRow(context, 'Delivery (fee purchases under \$20)', '\$${deliveryFee.toStringAsFixed(2)}', fontSize: 16),
        buildTextRow(context, 'Total: ', '\$${totalAmount.toStringAsFixed(2)}', fontSize: 35),
        PurchaseBtn(
          title: screenTitle,
          onTap: () {
            clearAll();
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ThanksScreen(),
                ));
          },
        ),
      ],
    );
  }

  Padding buildTextRow(BuildContext context, String leftTitle, String rightTitle, {double? fontSize}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            leftTitle,
            style: Theme.of(context).textTheme.headline3?.copyWith(fontSize: fontSize ?? 20),
          ),
          Text(
            rightTitle,
            style: Theme.of(context).textTheme.headline3?.copyWith(fontSize: fontSize ?? 20),
          ),
        ],
      ),
    );
  }

  Widget _buildCartItem(BuildContext context, Book book, int i) {
    return GestureDetector(
      onDoubleTap: () {},
      onTap: () {},
      child: Container(
        alignment: Alignment.topLeft,
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.only(top: 15, left: 15),
        height: 130,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Row(
            children: [
              Container(
                height: 130,
                width: 90,
                child: Image.asset(kPath + book.imageFile, fit: BoxFit.contain),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(book.title),
                    Text('\$${book.price}'),
                    Text('Unit: 1'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
