import 'dart:developer';

import 'package:ecommerce_app/apiservice/apiservice.dart';
import 'package:ecommerce_app/model/productmodel.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  var isLoading = true.obs;
  var productList = <Product>[].obs;
  final ApiService apiService = ApiService();

  var currentPage = 0;
  var limit = 6;
  var isLastPage = false;
  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      var products = await apiService.fetchProduct(
          // currentPage,
          // limit,
          );
      if (products.isNotEmpty) {
        productList.value = products;
      } else {
        // productList.clear();
        log(products.length.toString());
      }
    } finally {
      isLoading(false);
    }
  }

  void loadMoreProduct() async {
    if (isLoading.value || isLastPage) return;
    try {
      isLoading(true);
      currentPage++;
      var newProducts = await apiService.fetchProduct(
          // currentPage,
          // limit,
          );

      if (newProducts.isNotEmpty) {
        productList.addAll(newProducts);
      } else {
        isLastPage = true;
      }
    } finally {
      isLoading(false);
    }
  }
}
