import 'package:flutter/material.dart';
import '../../product_manager.dart';
import '../../entity/Product.dart';

class ProductsPage extends StatelessWidget {
    final List<Product> products;
    final Function updateProduct;
    final Function deleteProduct;

    ProductsPage(this.products, this.updateProduct, this.deleteProduct);

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            drawer: Drawer(
                child: Column(
                    children: <Widget>[
                        AppBar(
                            automaticallyImplyLeading: false,
                            title: Text('Choose'),
                        ),
                        ListTile(
                            title: Text('Manager Products'),
                            onTap: () {
                                Navigator.pushReplacementNamed(context, '/admin');
                            },
                        ),
                    ],
                ),
            ),
            appBar: AppBar(
                title: Text('EasyListTest'),
            ),
            body: ProductManager(products, updateProduct, deleteProduct),
        );
    }
}