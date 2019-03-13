import 'package:flutter/material.dart';

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
                        addProduct('Sweets');
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