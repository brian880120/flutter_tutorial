import 'package:flutter/material.dart';
import '../../entity/Product.dart';

class ProductCreatePage extends StatefulWidget {
    final Function addProduct;

    ProductCreatePage(this.addProduct);

    @override
    State<StatefulWidget> createState() {
        return _ProductCreatePageState();
    }
}

class _ProductCreatePageState extends State<ProductCreatePage> {
    String titleValue = '';
    String description = '';
    double price = 0.0;

    @override
    Widget build(BuildContext context) {
        return Container(
            margin: EdgeInsets.all(10.0),
            child: ListView(
                children: <Widget>[
                    TextField(
                        decoration: InputDecoration(
                            labelText: 'Product Title',
                        ),
                        onChanged: (String value) {
                            setState(() {
                                titleValue = value;
                            });
                        },
                    ),
                    TextField(
                        decoration: InputDecoration(
                            labelText: 'Product Description',
                        ),
                        maxLines: 4,
                        onChanged: (String value) {
                            setState(() {
                                description = value;
                            });
                        },
                    ),
                    TextField(
                        decoration: InputDecoration(
                            labelText: 'Product Price',
                        ),
                        keyboardType: TextInputType.number,
                        onChanged: (String value) {
                            setState(() {
                                price = double.parse(value);
                            });
                        },
                    ),
                    RaisedButton(
                        child: Text('Save'),
                        onPressed: () {
                            Product newProduct = new Product(titleValue, description, price, 'assets/demo.jpg');
                            widget.addProduct(newProduct);
                        },
                    ),
                ],
            ),
        );
    }
}