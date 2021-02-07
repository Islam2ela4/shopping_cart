import 'package:flutter/material.dart';
import 'package:shopping_cart/productCartProvider.dart';

class CartDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ProductCartProvider provider = ProductCartProvider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Cart details'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          '${provider.products.length} Selected',
          style: Theme.of(context).textTheme.headline,
        ),
      ),
    );
  }
}
