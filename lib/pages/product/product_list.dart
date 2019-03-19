import 'package:flutter/material.dart';
import '../../entity/Product.dart';
import './product_edit.dart';

class ProductListPage extends StatelessWidget {
    final List<Product> products;
    final Function updateProduct;
    final Function deleteProduct;

    ProductListPage(this.products, this.updateProduct, this.deleteProduct);

    Widget _buildEditButton(BuildContext context, int index) {
        return IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (BuildContext context) {
                            return ProductEditPage(product: products[index], updateProduct: updateProduct, index: index);
                        }
                    )
                );
            }
        );
    }

    @override
    Widget build(BuildContext context) {
        return ListView.builder(
            itemBuilder: (BuildContext context, int index) {
                return Dismissible(
                    key: Key(products[index].title),
                    onDismissed: (DismissDirection direction) {
                        if (direction == DismissDirection.startToEnd || direction == DismissDirection.endToStart) {
                            deleteProduct(index);
                        }
                    },
                    background: Container(
                        color: Colors.red,
                    ),
                    child: Column(
                        children: <Widget>[
                            ListTile(
                                leading: CircleAvatar(
                                    backgroundImage: AssetImage(products[index].image),
                                ),
                                title: Text(products[index].title),
                                subtitle: Text('\$${products[index].price.toString()}'),
                                trailing: _buildEditButton(context, index)
                            ),
                            Divider(
                                color: Colors.red,
                                height: 2.0,
                            ),
                        ],
                    ),
                );
            },
            itemCount: products.length,
        );
    }
}