import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'file:///C:/Users/infinitu/AndroidStudioProjects/flutterProjects/shopping_cart/shopping_cart/lib/models/product.dart';

class ProductCartProvider extends InheritedWidget {
  List<Product> products = [];

  Widget child;

  ProductCartProvider({this.child});

  @override
  bool updateShouldNotify(covariant ProductCartProvider oldWidget) {
    // TODO: implement updateShouldNotify
    return !IterableEquality().equals(products, oldWidget.products);
  }

  static ProductCartProvider of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType();
}
