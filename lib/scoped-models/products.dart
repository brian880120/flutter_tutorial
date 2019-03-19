import 'package:scoped_model/scoped_model.dart';
import '../entity/Product.dart';

class ProductsModel extends Model {
    List<Product> _products = [];
    int _selectedProductIndex;

    List<Product> get products {
        return List.from(_products);
    }

    int get selectedProductIndex {
        return _selectedProductIndex;
    }

    void addProduct(Product product) {
        _products.add(product);
        _selectedProductIndex = null;
    }

    void updateProduct(Product targetProduct) {
        _products[_selectedProductIndex] = targetProduct;
        _selectedProductIndex = null;
    }

    void deleteProduct() {
        _products.removeAt(_selectedProductIndex);
        _selectedProductIndex = null;
    }

    void selectProduct(int index) {
        _selectedProductIndex = index;
    }

    Product get selectedProduct {
        if (_selectedProductIndex == null) {
            return null;
        }
        return _products[_selectedProductIndex];
    }
}