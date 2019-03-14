import 'package:flutter/material.dart';
import './pages/auth/auth.dart';
import './pages/product/products_admin.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            theme: ThemeData(
                brightness: Brightness.light,
                primarySwatch: Colors.deepOrange,
                accentColor: Colors.deepPurple,
            ),
            home: AuthPage(),
            routes: {
                'admin': (BuildContext context) => ProductsAdminPage(),
            },
        );
    }
}
