import '../../models/fake_products/product.dart';
import '../../models/fake_products/repository/product_repository.dart';

class GetProductsByCategoryUseCase {
  final ProductRepository _productRepository;

  GetProductsByCategoryUseCase(this._productRepository);

  Future<List<Product>> execute(String category) {
    return _productRepository.getProductsByCategory(category);
  }
}
