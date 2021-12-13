import 'package:deliverone/domain/models/product_cart.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';

class CartController extends GetxController {
  RxList<ProductCart> cartList = <ProductCart>[].obs;
  RxInt totalItems = 0.obs;
  RxDouble totalPrice = 0.0.obs;
  RxDouble subTotal = 0.0.obs;
  RxDouble deliveryFee = 0.0.obs;

  void onAdd(ProductCart cart) {
    print('Cart Controller - onAdd is Called');
    final list = List<ProductCart>.from(cartList.value);
    bool found = false;
    for (ProductCart pCart in list) {
      if (pCart.product.name == cart.product.name) {
        pCart.quantity += 1;
        found = true;
      }
    }
    if (!found) {
      print('Cart Controller - addProductToCart - New Item added to Cart!');

      list.add(ProductCart(product: cart.product));
    }
    cartList.value = List<ProductCart>.from(list);

    calculateTotals(list);
  }

  void onIncrementItem(ProductCart cart) {
    print('Cart Controller - onIncrementItem is Called');
    cart.quantity += 1;
    cartList.value = List<ProductCart>.from(cartList.value);
    calculateTotals(cartList.value);
  }

  void onDecrementItem(ProductCart cart) {
    print('Cart Controller - onDecrementItem is Called');
    if (cart.quantity > 1) {
      cart.quantity -= 1;
    }
    cartList.value = List<ProductCart>.from(cartList.value);
    calculateTotals(cartList.value);
  }

  void onDeleteItem(ProductCart cart) {
    print('Cart Controller - onDeleteItem is Called');
    cartList.remove(cart);
    calculateTotals(cartList.value);
  }

  void calculateTotals(List<ProductCart> items) {
    final int total = items.fold(0, (oldvalue, product) => product.quantity + oldvalue);
    totalItems(totalItems(total));
    final double totalCost = items.fold(0.0, (oldValue, item) => (item.quantity * item.product.price) + oldValue);
    subTotal(totalCost);
    totalPrice(totalCost + deliveryFee());
  }
}
