import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import '../../entity/Product.dart';
import '../../widgets/helpers/ensure_visible.dart';
import '../../scoped-models/products.dart';

class ProductEditPage extends StatefulWidget {
    @override
    State<StatefulWidget> createState() {
        return _ProductEditPageState();
    }
}

class _ProductEditPageState extends State<ProductEditPage> {
    Product newProduct = new Product(
        title: '',
        description: '',
        price: null,
        image: 'assets/demo.jpg',
    );

    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    final _titleFocusNode = FocusNode();
    final _descriptionFocusNode = FocusNode();
    final _priceFocusNode = FocusNode();

    Widget _buildTitleTextField(Product selectedProduct) {
        return EnsureVisibleWhenFocused(
            focusNode: _titleFocusNode,
            child: TextFormField(
                focusNode: _titleFocusNode,
                decoration: InputDecoration(
                    labelText: 'Product Title',
                ),
                initialValue: selectedProduct == null ? null : selectedProduct.title,
                validator: (String value) {
                    if (value.isEmpty) {
                        return 'Title is required';
                    }
                },
                onSaved: (String value) {
                    newProduct.title = value;
                },
            ),
        );
    }

    Widget _buildDescriptionTextField(Product selectedProduct) {
        return EnsureVisibleWhenFocused(
            focusNode: _descriptionFocusNode,
            child: TextFormField(
                focusNode: _descriptionFocusNode,
                decoration: InputDecoration(
                    labelText: 'Product Description',
                ),
                maxLines: 4,
                initialValue: selectedProduct == null ? null : selectedProduct.description,
                validator: (String value) {
                    if (value.isEmpty) {
                        return 'Title is required';
                    }
                },
                onSaved: (String value) {
                    newProduct.description = value;
                },
            ),
        );
    }

    Widget _buildPriceTextField(Product selectedProduct) {
        return EnsureVisibleWhenFocused(
            focusNode: _priceFocusNode,
            child: TextFormField(
                focusNode: _priceFocusNode,
                decoration: InputDecoration(
                    labelText: 'Product Price',
                ),
                initialValue: selectedProduct == null ? null : selectedProduct.price.toString(),
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

    void _submitForm(Function addProduct, Function updateProduct, [Product selectedProduct]) {
        if (_formKey.currentState.validate()) {
            _formKey.currentState.save();
            if (selectedProduct != null) {
                updateProduct(newProduct);
            } else {
                addProduct(newProduct);
            }
            Navigator.pushReplacementNamed(context, '/products');
        }
    }

    Widget _buildSubmitButton() {
        return ScopedModelDescendant<ProductsModel>(
            builder: (BuildContext context, Widget child, ProductsModel model) {
                return RaisedButton(
                    color: Theme.of(context).accentColor,
                    textColor: Colors.white,
                    child: Text('Save'),
                    onPressed: () => _submitForm(model.addProduct, model.updateProduct, model.selectedProduct),
                );
            }
        );
    }

    Widget _buildPageContent(BuildContext context, double targetWidth, Product selectedProduct) {
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
                            _buildTitleTextField(selectedProduct),
                            _buildDescriptionTextField(selectedProduct),
                            _buildPriceTextField(selectedProduct),
                            SizedBox(
                                height: 10.0,
                            ),
                            _buildSubmitButton(),
                        ],
                    ),
                ),
            ),
        );
    }

    @override
    Widget build(BuildContext context) {
        final double deviceWidth = MediaQuery.of(context).size.width;
        final double targetWidth = deviceWidth > 550.0 ? 500.0 : deviceWidth * 0.95;

        return ScopedModelDescendant<ProductsModel>(
            builder: (BuildContext context, Widget child, ProductsModel model) {
                final Widget pageContent = _buildPageContent(context, targetWidth, model.selectedProduct);
                return model.selectedProductIndex == null ?
                    pageContent :
                    Scaffold(
                        appBar: AppBar(
                            title: Text('Edit Product'),
                        ),
                        body: pageContent,
                    );
            },
        );
    }
}
