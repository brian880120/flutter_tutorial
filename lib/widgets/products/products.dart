import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import '../../widgets/products/product_card.dart';
import '../../scoped-models/products.dart';
import '../../entity/Product.dart';

class Products extends StatelessWidget {

    Widget _buildProductList(List<Product> products) {
        Widget productCards = Center(
            child: Text('No products found, Please add some'),
        );

        if (products.length > 0) {
            productCards = ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                    return ProductCard(products[index], index);
                },
                itemCount: products.length,
            );
        }

        return productCards;
    }

    @override
    Widget build(BuildContext context) {
        return ScopedModelDescendant<ProductsModel>(
            builder: (BuildContext context, Widget child, ProductsModel model) {
                return _buildProductList(model.products);
            },
        );
    }
}