import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/controllers/favoritecontroller.dart';
import 'package:ecommerce_app/controllers/productcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final ProductController productController = Get.put(ProductController());
  final Favoritecontroller favoritecontroller = Get.put(Favoritecontroller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () {
          if (productController.isLoading.value) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (productController.productList.isEmpty) {
            return Center(
              child: Text('No Items Found'),
            );
          } else {
            return GridView.builder(
              itemCount: productController.productList.length,
              padding: EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 5,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 2.0,
                crossAxisSpacing: 2.0,
                mainAxisExtent: 250,
              ),
              itemBuilder: (context, index) {
                var product = productController.productList[index];
                // log(product.price.toString());
                return Stack(
                  children: [
                    Card(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Flexible(
                              // child: Image.network(
                              //   product.image ?? 'No image found',
                              //   height: 220,
                              //   width: double.infinity,
                              //   fit: BoxFit.fill,
                              // ),
                              child: CachedNetworkImage(
                                imageUrl: product.image ?? 'No image found',
                                height: 220,
                                width: double.infinity,
                                fit: BoxFit.fill,
                                // placeholder: (context, url) =>
                                //     CircularProgressIndicator(), // Placeholder while loading
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error), // Error widget
                              ),
                            ),
                            Text(
                              '${product.title}',
                              maxLines: 1,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('₹ ${product.price}'),
                                Text('⭐ ${product.rating?.rate}')
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      right: 7,
                      top: 7,
                      child: CircleAvatar(
                        backgroundColor: Colors.grey.shade100,
                        child: IconButton(
                            onPressed: () {
                              favoritecontroller.toggleFavorite(product);
                            },
                            icon: Obx(
                              () => favoritecontroller.isFavorite(product)
                                  ? Icon(
                                      Icons.favorite,
                                      color: Colors.greenAccent,
                                    )
                                  : Icon(
                                      Icons.favorite_border,
                                      // color: Colors.greenAccent,
                                    ),
                            )),
                      ),
                    )
                  ],
                );
              },
            );
          }
        },
      ),
    );
  }
}
