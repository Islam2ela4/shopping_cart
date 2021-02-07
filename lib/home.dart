import 'dart:math';

import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:shopping_cart/cartDetails.dart';
import 'file:///C:/Users/infinitu/AndroidStudioProjects/flutterProjects/shopping_cart/shopping_cart/lib/models/product.dart';
import 'package:shopping_cart/productCartProvider.dart';

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    List<Product> products = List.generate(50, (index) {
      return Product(
          name: 'Product $index',
          price: Random().nextInt(5000),
          isCheck: false);
    });

    ProductCartProvider provider = ProductCartProvider.of(context);

    return StatefulBuilder(
      builder: (context, setState) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Shopping Cart'),
            actions: <Widget>[
              Container(
                margin: EdgeInsets.only(right: 15, top: 10),
                child: Badge(
                  badgeContent: Text(
                    '${provider.products.length}',
                    style: TextStyle(color: Colors.white),
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.shopping_cart,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                        return CartDetails();
                      },));
                    },
                  ),
                  animationType: BadgeAnimationType.slide,
                ),
              ),
            ],
          ),
          body: Container(
            color: Colors.black12,
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          '${products[index].name}',
                          style: Theme.of(context).textTheme.subhead,
                        ),
                        Checkbox(
                          value: products[index].isCheck,
                          onChanged: (value) {
                            setState((){
                              products[index].isCheck = value;
                              if(products[index].isCheck){
                                provider.products.add(products[index]);
                              }else{
                                provider.products.remove(products[index]);
                              }
                            });
                          },
                        ),
                      ],
                    ),
                    subtitle: Text('${products[index].price}'),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
