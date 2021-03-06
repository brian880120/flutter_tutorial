import 'package:flutter/material.dart';
import '../../entity/Product.dart';
import './price_tag.dart';
import './product_title.dart';
import './address_tag.dart';
import 'package:scoped_model/scoped_model.dart';
import '../../scoped-models/products.dart';

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
                    ProductTitle(product.title, 20.0, FontWeight.bold),
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
                ScopedModelDescendant(
                    builder: (BuildContext context, Widget child, ProductsModel model) {
                        return IconButton(
                            color: Colors.red,
                            icon: Icon(model.products[index].isFavorite ? Icons.favorite : Icons.favorite_border),
                            onPressed: () {
                                model.selectProduct(index);
                                model.toggleFavorite();
                            },
                        );
                    }
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