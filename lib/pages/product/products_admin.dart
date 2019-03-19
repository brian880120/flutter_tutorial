import 'package:flutter/material.dart';
import '../product/product_edit.dart';
import '../product/product_list.dart';

class ProductsAdminPage extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return DefaultTabController(
            length: 2,
            child: Scaffold(
                drawer: Drawer(
                    child: Column(
                        children: <Widget>[
                            AppBar(
                                automaticallyImplyLeading: false,
                                title: Text('Choose'),
                            ),
                            ListTile(
                                leading: Icon(Icons.shop),
                                title: Text('All Products'),
                                onTap: () {
                                    Navigator.pushReplacementNamed(context, '/products');
                                },
                            ),
                        ],
                    ),
                ),
                appBar: AppBar(
                    title: Text('Manage Products'),
                    bottom:TabBar(
                        tabs: <Widget>[
                            Tab(
                                text: 'Create Product',
                                icon: Icon(Icons.create),
                            ),
                            Tab(
                                text: 'My Products',
                                icon: Icon(Icons.list),
                            ),
                        ],
                    ),
                ),
                body: TabBarView(
                    children: <Widget>[
                        ProductEditPage(),
                        ProductListPage(),
                    ],
                ),
            ),
        );
    }
}