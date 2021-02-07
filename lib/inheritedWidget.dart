import 'package:flutter/material.dart';
import 'package:shopping_cart/home.dart';
import 'package:shopping_cart/productCartProvider.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProductCartProvider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Home(),
      ),
    );
  }
}
