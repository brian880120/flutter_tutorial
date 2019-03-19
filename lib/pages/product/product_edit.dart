import 'package:flutter/material.dart';
import '../../entity/Product.dart';
import '../../widgets/helpers/ensure_visible.dart';

class ProductEditPage extends StatefulWidget {
    final Function addProduct;
    final Function updateProduct;
    final Product product;
    final int index;

    ProductEditPage({this.addProduct, this.product, this.updateProduct, this.index});

    @override
    State<StatefulWidget> createState() {
        return _ProductEditPageState();
    }
}

class _ProductEditPageState extends State<ProductEditPage> {
    Product newProduct = new Product('', '', null, 'assets/demo.jpg');
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    final _titleFocusNode = FocusNode();
    final _descriptionFocusNode = FocusNode();
    final _priceFocusNode = FocusNode();

    Widget _buildTitleTextField() {
        return EnsureVisibleWhenFocused(
            focusNode: _titleFocusNode,
            child: TextFormField(
                focusNode: _titleFocusNode,
                decoration: InputDecoration(
                    labelText: 'Product Title',
                ),
                initialValue: widget.product == null ? null : widget.product.name,
                validator: (String value) {
                    if (value.isEmpty) {
                        return 'Title is required';
                    }
                },
                onSaved: (String value) {
                    newProduct.name = value;
                },
            ),
        );
    }

    Widget _buildDescriptionTextField() {
        return EnsureVisibleWhenFocused(
            focusNode: _descriptionFocusNode,
            child: TextFormField(
                focusNode: _descriptionFocusNode,
                decoration: InputDecoration(
                    labelText: 'Product Description',
                ),
                maxLines: 4,
                initialValue: widget.product == null ? null : widget.product.detail,
                validator: (String value) {
                    if (value.isEmpty) {
                        return 'Title is required';
                    }
                },
                onSaved: (String value) {
                    newProduct.detail = value;
                },
            ),
        );
    }

    Widget _buildPriceTextField() {
        return EnsureVisibleWhenFocused(
            focusNode: _priceFocusNode,
            child: TextFormField(
                focusNode: _priceFocusNode,
                decoration: InputDecoration(
                    labelText: 'Product Price',
                ),
                initialValue: widget.product == null ? null : widget.product.price.toString(),
                validator: (String value) {
                    if (value.isEmpty) {
                        return 'Title is required';
                    }
                },
                keyboardType: TextInputType.number,
                onSaved: (String value) {
                    newProduct.price = double.parse(value);
                },
            ),
        );
    }

    void _submitForm() {
        if (_formKey.currentState.validate()) {
            _formKey.currentState.save();
            if (widget.product != null) {
                widget.updateProduct(widget.index, newProduct);
            } else {
                widget.addProduct(newProduct);
            }
            Navigator.pushReplacementNamed(context, '/products');
        }
    }

    @override
    Widget build(BuildContext context) {
        final double deviceWidth = MediaQuery.of(context).size.width;
        final double targetWidth = deviceWidth > 550.0 ? 500.0 : deviceWidth * 0.95;
        final Widget pageContent = GestureDetector(
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

        return widget.product == null ?
            pageContent :
            Scaffold(
                appBar: AppBar(
                    title: Text('Edit Product'),
                ),
                body: pageContent,
            );
    }
}
