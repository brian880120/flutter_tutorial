import 'package:flutter/material.dart';
import './pages/auth/auth.dart';
import './pages/product/products_admin.dart';
import './pages/product/products_page.dart';
import './pages/product/product_page.dart';
import './entity/Product.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
    @override
    State<StatefulWidget> createState() {
        return _MyAppState();
    }
}

class _MyAppState extends State<MyApp> {
    final List<Product> _products = [];

    void _addProduct(Product product) {
        setState(() {
            _products.add(product);
        });
    }

    void _updateProduct(int index, Product targetProduct) {
        setState(() {
            _products[index] = targetProduct;
        });
    }

    void _deleteProduct(int index) {
        if (_products.length > 0) {
            setState(() {
                _products.removeAt(index);
            });
        }
    }

    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            theme: ThemeData(
                brightness: Brightness.light,
                primarySwatch: Colors.deepOrange,
                accentColor: Colors.deepPurple,
                fontFamily: 'Oswald',
            ),
            routes: {
                '/': (BuildContext context) => AuthPage(),
                '/products': (BuildContext context) => ProductsPage(_products),
                '/admin': (BuildContext context) => ProductsAdminPage(_addProduct, _deleteProduct, _updateProduct, _products),
            },
            onGenerateRoute: (RouteSettings settings) {
                final List<String> pathElements = settings.name.split('/');
                if (pathElements[0] != '') {
                    return null;
                }
                if (pathElements[1] == 'product') {
                    final int index = int.parse(pathElements[2]);
                    return MaterialPageRoute<bool>(
                        builder: (BuildContext context) => ProductPage(_products[index]),
                    );
                }
            },
            onUnknownRoute: (RouteSettings settings) {
                return MaterialPageRoute(
                    builder: (BuildContext context) => ProductsPage(_products),
                );
            },
        );
    }
}
