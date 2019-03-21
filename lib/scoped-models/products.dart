import 'package:scoped_model/scoped_model.dart';
import '../entity/Product.dart';

class ProductsModel extends Model {
    List<Product> _products = [];
    int _selectedProductIndex;
    bool _showFavorites = false;

    List<Product> get products {
        return List.from(_products);
    }

    List<Product> get displayedProducts {
        if (_showFavorites) {
            return List.from(_products.where((Product product) => product.isFavorite).toList());
        }

        return List.from(_products);
    }

    int get selectedProductIndex {
        return _selectedProductIndex;
    }

    void addProduct(Product product) {
        _products.add(product);
        _selectedProductIndex = null;
        notifyListeners();
    }

    void updateProduct(Product targetProduct) {
        _products[_selectedProductIndex] = targetProduct;
        _selectedProductIndex = null;
        notifyListeners();
    }

    void deleteProduct() {
        _products.removeAt(_selectedProductIndex);
        _selectedProductIndex = null;
        notifyListeners();
    }

    void selectProduct(int index) {
        _selectedProductIndex = index;
    }

    void toggleFavorite() {
        final bool isFavorite = selectedProduct.isFavorite;
        final bool newFavorite = !isFavorite;
        final Product updatedProduct = Product(
            title: selectedProduct.title,
            description: selectedProduct.description,
            price: selectedProduct.price,
            image: selectedProduct.image,
            isFavorite: newFavorite,
        );
        _products[_selectedProductIndex] = updatedProduct;
        notifyListeners();
        _selectedProductIndex = null;
    }

    void toggleDisplayMode() {
        _showFavorites = !_showFavorites;
        notifyListeners();
    }

    bool get displayFavoritesOnly {
        return _showFavorites;
    }

    Product get selectedProduct {
        if (_selectedProductIndex == null) {
            return null;
        }
        return _products[_selectedProductIndex];
    }
}