import 'package:flutter/material.dart';
import '../../entity/Product.dart';
import '../../widgets/products/product_card.dart';

class Products extends StatelessWidget {
    final List<Product> products;
    Products(this.products);

    Widget _buildProductList() {
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
        return _buildProductList();
    }
}