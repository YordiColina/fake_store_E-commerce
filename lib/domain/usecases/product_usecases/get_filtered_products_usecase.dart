import 'package:fake_store_package/models/products/product.dart';
import '../../models/fake_products/repository/product_repository.dart';

class GetFilteredProductsUseCase {
  final ProductRepository _productRepository;

  GetFilteredProductsUseCase(this._productRepository);

  Future<List<Product>> execute(String query) async {
    return _productRepository.searchProducts(query);
  }
}
