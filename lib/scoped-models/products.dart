import 'package:scoped_model/scoped_model.dart';
import '../entity/Product.dart';

class ProductsModel extends Model {
    List<Product> _products = [];

    List<Product> get products {
        return List.from(_products);
    }

    void addProduct(Product product) {
        _products.add(product);
    }

    void updateProduct(int index, Product targetProduct) {
        _products[index] = targetProduct;
    }

    void deleteProduct(int index) {
        _products.removeAt(index);
    }
}