import '../../models/fake_products/product.dart';
import '../../models/fake_products/repository/product_repository.dart';

class GetProductUseCase {
  final ProductRepository _productRepository;

  GetProductUseCase(this._productRepository);

  Future<Product> execute(int id) {
    return _productRepository.getProduct(id);
  }
}