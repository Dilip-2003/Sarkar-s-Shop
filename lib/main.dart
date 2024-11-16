import 'package:ecommerce_app/widgets/favoritepage.dart';
import 'package:ecommerce_app/widgets/productpage.dart';
import 'package:ecommerce_app/widgets/settingspage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  RxInt selectedIndex = 0.obs;
  final List<Widget> _pages = [
    ProductPage(),
    FavoritePage(),
    SettingsPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Sarkar Shop's"),
        ),
        body: Obx(
          () => _pages[selectedIndex.value],
        ),
        bottomNavigationBar: Obx(() {
          return BottomNavigationBar(
            backgroundColor: Colors.white,
            selectedItemColor: Colors.blueAccent,
            currentIndex: selectedIndex.value, // Set current selected index
            onTap: (index) {
              selectedIndex.value = index; // Update selected index on tap
              // ignore: unrelated_type_equality_checks
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: 'Favorites',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Account Settings',
              ),
              // Add more BottomNavigationBarItems if needed
            ],
          );
        }),
      ),
    );
  }
}
