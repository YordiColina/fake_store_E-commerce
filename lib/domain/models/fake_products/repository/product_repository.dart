import 'package:fake_store_package/models/products/product.dart';


abstract class ProductRepository {
  Future<List<Product>> getProducts();
  Future<Product> getProduct(int id);
  Future<List<Product>> getProductsByCategory(String category);
}