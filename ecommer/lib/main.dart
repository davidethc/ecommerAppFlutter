import 'package:ecommer/models/shop.dart';
import 'package:ecommer/page/cart_page.dart';
import 'package:ecommer/page/shop_page.dart';
import 'package:flutter/material.dart';
import 'package:ecommer/page/page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (context) => Shop(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroPage(),

      routes: {
        '/intro_page': (context) => const IntroPage(),
        '/shop_page': (context) => ShopPage(),
        '/cart_page': (context) => const CartPage(),
      },
    );
  }
}
