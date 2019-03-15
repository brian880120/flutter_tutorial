import 'dart:async';
import 'package:flutter/material.dart';
import '../../entity/Product.dart';

class ProductPage extends StatelessWidget {
    final Product product;

    ProductPage(this.product);

    _showWarningDialog(BuildContext context) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
                return AlertDialog(
                    title: Text('Are you sure?'),
                    content: Text('This action cannot be undone!'),
                    actions: <Widget>[
                        FlatButton(
                            child: Text('DISCARD'),
                            onPressed: () {
                                Navigator.pop(context);
                            },
                        ),
                        FlatButton(
                            child: Text('CONTINUE'),
                            onPressed: () {
                                Navigator.pop(context);
                                Navigator.pop(context, true);
                            },
                        ),
                    ],
                );
            }
        );
    }

    @override
    Widget build(BuildContext context) {
        return WillPopScope(
            onWillPop: () {
                print('Back button pressed');
                Navigator.pop(context, false);
                return Future.value(false);
            },
            child: Scaffold(
                appBar: AppBar(
                    title: Text('Product Detail'),
                ),
                body: Center(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                            Container(
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.only(bottom: 10.0, top: 10.0),
                                child: Text(
                                    product.name,
                                    style: TextStyle(
                                        fontSize: 25.0,
                                        fontWeight: FontWeight.w500,
                                    ),
                                ),
                            ),
                            Image.asset(product.image),
                            RaisedButton(
                                child: Text('Delete'),
                                color: Theme.of(context).accentColor,
                                onPressed: () => _showWarningDialog(context),
                            ),
                        ],
                    )
                ),
            ),
        );
    }
}