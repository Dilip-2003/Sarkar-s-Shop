import 'dart:convert';

import 'package:ecommerce_app/model/productmodel.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'https://fakestoreapi.com/products';
  Future<List<Product>> fetchProduct() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception('failed to load the data');
    }
  }
}
