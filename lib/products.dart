import 'package:flutter/material.dart';
import './pages/product/product_page.dart';
import './entity/Product.dart';

class Products extends StatelessWidget {
    final List<Product> products;

    Products(this.products);

    Widget _buildProductItem(BuildContext context, int index) {
        return Card(
            child: Column(
                children: <Widget>[
                    Image.asset(products[index].image),
                    Text(products[index].name),
                    ButtonBar(
                        alignment: MainAxisAlignment.center,
                        children: <Widget>[
                            FlatButton(
                                child: Text('Details'),
                                onPressed: () {
                                    Navigator.push<Map<String, bool>>(context, MaterialPageRoute(
                                        builder: (BuildContext context) => ProductPage(products[index]),
                                    )).then((Map<String, bool> value) {
                                        print(value);
                                    });
                                },
                            )
                        ],
                    )
                ],
            ),
        );
    }

    Widget _buildProductList() {
        Widget productCards = Center(
            child: Text('No products found, Please add some'),
        );

        if (products.length > 0) {
            productCards = ListView.builder(
                itemBuilder: _buildProductItem,
                itemCount: products.length,
            );
        }

        return productCards;
    }

    @override
    Widget build(BuildContext context) {
        return _buildProductList();
    }
}