import 'package:flutter/material.dart';
import '../../entity/Product.dart';
import './price_tag.dart';
import './product_title.dart';
import './address_tag.dart';

class ProductCard extends StatelessWidget {
    final Product product;
    final int index;

    ProductCard(this.product, this.index);

    Widget _buildTitlePriceRow() {
        return Container(
            padding: EdgeInsets.only(top: 10.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                    ProductTitle(product.name, 20.0, FontWeight.bold),
                    SizedBox(width: 8.0),
                    PriceTag(product.price.toString()),
                ],
            ),
        );
    }

    Widget _buildActionButtons(BuildContext context) {
        return ButtonBar(
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
                ),
            ],
        );
    }

    @override
    Widget build(BuildContext context) {
        return Card(
            child: Column(
                children: <Widget>[
                    Image.asset(product.image),
                    _buildTitlePriceRow(),
                    AddressTag('Union Square, San Francisco'),
                    _buildActionButtons(context),
                ],
            ),
        );
    }
}