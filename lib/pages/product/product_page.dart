import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import '../../widgets/products/product_title.dart';
import '../../scoped-models/products.dart';
import '../../entity/Product.dart';

class ProductPage extends StatelessWidget {
    final int productIndex;

    ProductPage(this.productIndex);

    @override
    Widget build(BuildContext context) {
        return ScopedModelDescendant<ProductsModel>(
            builder: (BuildContext context, Widget child, ProductsModel model) {
                final Product product = model.products[productIndex];
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
                                        child: ProductTitle(product.title, 25.0, FontWeight.w500),
                                    ),
                                    Image.asset(product.image),
                                ],
                            )
                        ),
                    );
            }
        );
    }
}