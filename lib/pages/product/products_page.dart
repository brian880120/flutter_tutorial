import 'package:flutter/material.dart';
import '../../widgets/products/products.dart';

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
                    IconButton(
                        icon: Icon(Icons.favorite),
                        onPressed: () {},
                    ),
                ],
            ),
            body: Products(),
        );
    }
}