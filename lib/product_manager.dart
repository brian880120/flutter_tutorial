import 'package:flutter/material.dart';
import './products.dart';
import './entity/Product.dart';

class ProductManager extends StatelessWidget {
    final List<Product> products;

    ProductManager(this.products);
    @override
    Widget build(BuildContext context) {
        return Column(
            children: <Widget>[
                Expanded(
                    child: Products(products),
                )
            ],
        );
    }
}