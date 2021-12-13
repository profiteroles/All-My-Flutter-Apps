import 'package:deliverone/domain/models/product.dart';

class ProductCart {
  ProductCart({required this.product, this.quantity = 1});
  final Product product;
  int quantity;
}
