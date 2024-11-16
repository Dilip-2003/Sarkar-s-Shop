import 'dart:developer';

import 'package:ecommerce_app/model/productmodel.dart';
import 'package:get/get.dart';

class Favoritecontroller extends GetxController {
  var favoriteList = <Product>[].obs;
  void toggleFavorite(Product product) {
    if (favoriteList.contains(product)) {
      log('product ${product.id} removed');
      favoriteList.remove(product);
    } else {
      log('product ${product.id} added');
      favoriteList.add(product);
    }
  }

  bool isFavorite(Product product) {
    return favoriteList.contains(product);
  }
}
