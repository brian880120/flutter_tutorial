import 'package:flutter/material.dart';
import './entity/Product.dart';

class ProductControl extends StatelessWidget {
    final Function addProduct;
    final Function deleteProduct;

    ProductControl(this.addProduct, this.deleteProduct);

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
                RaisedButton(
                    color: Theme.of(context).accentColor,
                    onPressed: () {
                        deleteProduct();
                    },
                    child: Text('Delete Product'),
                ),
            ],
        );
    }
}