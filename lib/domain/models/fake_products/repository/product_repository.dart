import '../product.dart';

abstract class ProductRepository {
  Future<List<Product>> getProducts();
  Future<Product> getProduct(int id);
  Future<List<Product>> getProductsByCategory(String category);
}