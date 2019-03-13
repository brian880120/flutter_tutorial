import 'package:flutter/material.dart';
import './products.dart';
import './product_control.dart';

class ProductManager extends StatefulWidget {
    final String startingProduct;

    ProductManager({this.startingProduct = 'Sweets Tester'});

    @override
    State<StatefulWidget> createState() {
        return _ProductManagerState();
    }
}

class _ProductManagerState extends State<ProductManager> {
    List<String> _products = [];

    @override
    void initState() {
        _products.add(widget.startingProduct);
        super.initState();
    }

    @override
    void didUpdateWidget(ProductManager oldWidget) {
        super.didUpdateWidget(oldWidget);
    }

    void _updateProduct(String product) {
        setState(() {
            _products.add(product);
        });
    }

    @override
    Widget build(BuildContext context) {
        return Column(
            children: <Widget>[
                Container(
                    margin: EdgeInsets.all(10.0),
                    child: ProductControl(_updateProduct),
                ),
                Products(_products),
            ],
        );

    }
}