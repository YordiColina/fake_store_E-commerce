import 'package:fake_store_package/models/products/product.dart';
import '../../models/fake_products/repository/product_repository.dart';

class GetProductsUseCase {
  final ProductRepository _productRepository;

  GetProductsUseCase(this._productRepository);

  Future<List<Product>> execute() {
    return _productRepository.getProducts();
  }
}