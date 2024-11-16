import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/controllers/favoritecontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    Favoritecontroller favoritecontroller = Get.put(Favoritecontroller());
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: favoritecontroller.favoriteList.length,
        itemBuilder: (context, index) {
          final favoriteItem = favoritecontroller.favoriteList[index];
          return Card(
            color: Colors.white,
            child: ListTile(
              contentPadding: EdgeInsets.all(10),
              leading: SizedBox(
                height: 200,
                width: 100,
                child: CachedNetworkImage(
                  imageUrl: favoriteItem.image ?? 'No image found',
                  height: double.infinity,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
              ),
              title: Text(
                '${favoriteItem.title}',
                maxLines: 2,
              ),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('₹${favoriteItem.price}'),
                  Text('⭐${favoriteItem.rating!.rate}')
                ],
              ),
            ),
          );
        },
      ),
    ));
  }
}
