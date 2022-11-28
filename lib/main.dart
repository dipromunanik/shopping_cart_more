import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart_more/controller/product_controller.dart';
import 'package:shopping_cart_more/pages/cart_page.dart';
import 'package:shopping_cart_more/pages/product_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>ProductController()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home:const ProductPage(),
        routes: {
          ProductPage.routeName:(context)=>const ProductPage(),
          CartPage.routeName:(context)=>const CartPage(),
        },
      ),
    );
  }
}
