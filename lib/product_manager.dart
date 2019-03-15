import 'package:flutter/material.dart';
import './products.dart';
import './product_control.dart';
import './entity/Product.dart';

class ProductManager extends StatelessWidget {
    final List<Product> products;
    final Function updateProduct;
    final Function deleteProduct;

    ProductManager(this.products, this.updateProduct, this.deleteProduct);
    @override
    Widget build(BuildContext context) {
        return Column(
            children: <Widget>[
                Container(
                    margin: EdgeInsets.all(10.0),
                    child: ProductControl(updateProduct),
                ),
                Expanded(
                    child: Products(products, deleteProduct: deleteProduct),
                )
            ],
        );
    }
}