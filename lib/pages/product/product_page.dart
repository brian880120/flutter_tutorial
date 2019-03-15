import 'package:flutter/material.dart';
import '../../entity/Product.dart';

class ProductPage extends StatelessWidget {
    final Product product;

    ProductPage(this.product);

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text('Product Detail'),
            ),
            body: Center(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                        Container(
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.only(bottom: 10.0, top: 10.0),
                            child: Text(
                                product.name,
                                style: TextStyle(
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.w500,
                                ),
                            ),
                        ),
                        Image.asset(product.image),
                    ],
                )
            ),
        );
    }
}