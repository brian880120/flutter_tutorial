import 'package:flutter/material.dart';
import './products.dart';
import './product_control.dart';
import './entity/Product.dart';

class ProductManager extends StatefulWidget {
    final Product startingProduct;

    ProductManager({this.startingProduct});

    @override
    State<StatefulWidget> createState() {
        return _ProductManagerState();
    }
}

class _ProductManagerState extends State<ProductManager> {
    List<Product> _products = [];

    @override
    void initState() {
        if (widget.startingProduct != null) {
            _products.add(widget.startingProduct);
        }
        super.initState();
    }

    @override
    void didUpdateWidget(ProductManager oldWidget) {
        super.didUpdateWidget(oldWidget);
    }

    void _updateProduct(Product product) {
        setState(() {
            _products.add(product);
        });
    }

    void _deleteProduct(int index) {
        if (_products.length > 0) {
            setState(() {
                _products.removeAt(index);
            });
        }
    }

    @override
    Widget build(BuildContext context) {
        return Column(
            children: <Widget>[
                Container(
                    margin: EdgeInsets.all(10.0),
                    child: ProductControl(_updateProduct),
                ),
                Expanded(
                    child: Products(_products, deleteProduct: _deleteProduct),
                )
            ],
        );
    }
}