import 'package:flutter/material.dart';
import '../../widgets/products/products.dart';
import 'package:scoped_model/scoped_model.dart';
import '../../scoped-models/products.dart';

class ProductsPage extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            drawer: Drawer(
                child: Column(
                    children: <Widget>[
                        AppBar(
                            automaticallyImplyLeading: false,
                            title: Text('Choose'),
                        ),
                        ListTile(
                            title: Text('Logout'),
                            onTap: () {
                                Navigator.pushReplacementNamed(context, '/');
                            },
                        ),
                        ListTile(
                            leading: Icon(Icons.edit),
                            title: Text('Manager Products'),
                            onTap: () {
                                Navigator.pushReplacementNamed(context, '/admin');
                            },
                        ),
                    ],
                ),
            ),
            appBar: AppBar(
                title: Text('Home Page'),
                actions: <Widget>[
                    ScopedModelDescendant(
                        builder: (BuildContext context, Widget child, ProductsModel model) {
                            return IconButton(
                                icon: Icon(model.displayFavoritesOnly ? Icons.favorite : Icons.favorite_border),
                                onPressed: () {
                                    model.toggleDisplayMode();
                                },
                            );
                        }
                    ),
                ],
            ),
            body: Products(),
        );
    }
}