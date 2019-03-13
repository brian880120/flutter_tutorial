import 'package:flutter/material.dart';
import './entity/Product.dart';

class ProductControl extends StatelessWidget {
    final Function addProduct;

    ProductControl(this.addProduct);

    @override
    Widget build(BuildContext context) {
        return Column(
            children: <Widget>[
                RaisedButton(
                    color: Theme.of(context).primaryColor,
                    onPressed: () {
                        Product newProduct = new Product('Sweets', 'assets/demo.jpg');
                        addProduct(newProduct);
                    },
                    child: Text('Add Product'),
                ),
            ],
        );
    }
}