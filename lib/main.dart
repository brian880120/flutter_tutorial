import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import './scoped-models/products.dart';
import './pages/auth/auth.dart';
import './pages/product/products_admin.dart';
import './pages/product/products_page.dart';
import './pages/product/product_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
    @override
    State<StatefulWidget> createState() {
        return _MyAppState();
    }
}

class _MyAppState extends State<MyApp> {
    @override
    Widget build(BuildContext context) {
        return ScopedModel<ProductsModel>(
            model:ProductsModel(),
            child: MaterialApp(
                theme: ThemeData(
                    brightness: Brightness.light,
                    primarySwatch: Colors.deepOrange,
                    accentColor: Colors.deepPurple,
                    fontFamily: 'Oswald',
                ),
                routes: {
                    '/': (BuildContext context) => AuthPage(),
                    '/products': (BuildContext context) => ProductsPage(),
                    '/admin': (BuildContext context) => ProductsAdminPage(),
                },
                onGenerateRoute: (RouteSettings settings) {
                    final List<String> pathElements = settings.name.split('/');
                    if (pathElements[0] != '') {
                        return null;
                    }
                    if (pathElements[1] == 'product') {
                        final int index = int.parse(pathElements[2]);
                        return MaterialPageRoute<bool>(
                            builder: (BuildContext context) => ProductPage(index),
                        );
                    }
                },
                onUnknownRoute: (RouteSettings settings) {
                    return MaterialPageRoute(
                        builder: (BuildContext context) => ProductsPage(),
                    );
                },
            ),
        );
    }
}
