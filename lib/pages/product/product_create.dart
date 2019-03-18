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
    Product newProduct = new Product('', '', null, 'assets/demo.jpg');
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    Widget _buildTitleTextField() {
        return TextFormField(
            decoration: InputDecoration(
                labelText: 'Product Title',
            ),
            validator: (String value) {
                if (value.isEmpty) {
                    return 'Title is required';
                }
            },
            onSaved: (String value) {
                newProduct.name = value;
            },
        );
    }

    Widget _buildDescriptionTextField() {
        return TextFormField(
            decoration: InputDecoration(
                labelText: 'Product Description',
            ),
            maxLines: 4,
            validator: (String value) {
                if (value.isEmpty) {
                    return 'Title is required';
                }
            },
            onSaved: (String value) {
                newProduct.detail = value;
            },
        );
    }

    Widget _buildPriceTextField() {
        return TextFormField(
            decoration: InputDecoration(
                labelText: 'Product Price',
            ),
            validator: (String value) {
                if (value.isEmpty) {
                    return 'Title is required';
                }
            },
            keyboardType: TextInputType.number,
            onSaved: (String value) {
                newProduct.price = double.parse(value);
            },
        );
    }

    void _submitForm() {
        if (_formKey.currentState.validate()) {
            _formKey.currentState.save();
            widget.addProduct(newProduct);
            Navigator.pushReplacementNamed(context, '/products');
        }
    }

    @override
    Widget build(BuildContext context) {
        final double deviceWidth = MediaQuery.of(context).size.width;
        final double targetWidth = deviceWidth > 550.0 ? 500.0 : deviceWidth * 0.95;
        return GestureDetector(
            onTap: () {
                FocusScope.of(context).requestFocus(FocusNode());
            },
            child: Container(
                width: targetWidth,
                margin: EdgeInsets.all(10.0),
                child: Form(
                    key: _formKey,
                    child: ListView(
                        children: <Widget>[
                            _buildTitleTextField(),
                            _buildDescriptionTextField(),
                            _buildPriceTextField(),
                            SizedBox(
                                height: 10.0,
                            ),
                            RaisedButton(
                                color: Theme.of(context).accentColor,
                                textColor: Colors.white,
                                child: Text('Save'),
                                onPressed: _submitForm,
                            ),
                        ],
                    ),
                ),
            ),
        );
    }
}
