import 'package:get/get.dart';

import '../../domain/models/product.dart';
import '../../domain/repository/api_repository.dart';
// import 'package:get/get_state_manager/get_state_manager.dart';
// import 'package:get/state_manager.dart';

class ProductsController extends GetxController {
  ProductsController(this.apiRepositoryInterface);
  final APIRepositoryInterface apiRepositoryInterface;

  RxList<Product> productsList = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadProducts();
  }

  void loadProducts() async {
    print('Products Controller - loadProducts is Called: ');
    final result = await apiRepositoryInterface.getProducts();
    productsList.addAll(result);
  }
}
