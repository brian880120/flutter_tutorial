import 'package:flutter/material.dart';
import '../../entity/Product.dart';
import '../../widgets/products/product_title.dart';

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
                            child: ProductTitle(product.name, 25.0, FontWeight.w500),
                        ),
                        Image.asset(product.image),
                    ],
                )
            ),
        );
    }
}