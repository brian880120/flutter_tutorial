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
    String _titleValue = '';
    String _description = '';
    double _price = 0.0;

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
                                _titleValue = value;
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
                                _description = value;
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
                                _price = double.parse(value);
                            });
                        },
                    ),
                    SizedBox(
                        height: 10.0,
                    ),
                    RaisedButton(
                        color: Theme.of(context).accentColor,
                        textColor: Colors.white,
                        child: Text('Save'),
                        onPressed: () {
                            Product newProduct = new Product(_titleValue, _description, _price, 'assets/demo.jpg');
                            widget.addProduct(newProduct);
                            Navigator.pushReplacementNamed(context, '/products');
                        },
                    ),
                ],
            ),
        );
    }
}