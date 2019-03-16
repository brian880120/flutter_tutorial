import 'package:flutter/material.dart';
import './entity/Product.dart';

class Products extends StatelessWidget {
    final List<Product> products;

    Products(this.products);

    Widget _buildProductItem(BuildContext context, int index) {
        return Card(
            child: Column(
                children: <Widget>[
                    Image.asset(products[index].image),
                    Container(
                        padding: EdgeInsets.only(top: 10.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                                Flexible(
                                    flex: 2,
                                    child: Text(
                                        products[index].name,
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Oswald'
                                        ),
                                    ),
                                ),
                                SizedBox(width: 8.0),
                                Expanded(
                                    child: Container(
                                        padding:EdgeInsets.symmetric(horizontal: 10.0),
                                        decoration: BoxDecoration(
                                            color: Theme.of(context).accentColor,
                                            borderRadius: BorderRadius.circular(5.0)
                                        ),
                                        child: Text(
                                            '\$${products[index].price.toString()}',
                                            style: TextStyle(
                                                color: Colors.white,
                                            ),
                                        ),
                                    ),
                                ),
                            ],
                        ),
                    ),
                    DecoratedBox(
                        child: Text('Union Square, San Francisco'),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.grey,
                                width: 1.0,
                            ),
                        ),
                    ),
                    ButtonBar(
                        alignment: MainAxisAlignment.center,
                        children: <Widget>[
                            IconButton(
                                icon: Icon(Icons.info),
                                color: Theme.of(context).accentColor,
                                onPressed: () {
                                    Navigator.pushNamed<bool>(context, '/product/${index.toString()}');
                                },
                            ),
                            IconButton(
                                color: Colors.red,
                                icon: Icon(Icons.favorite_border),
                                onPressed: () {
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