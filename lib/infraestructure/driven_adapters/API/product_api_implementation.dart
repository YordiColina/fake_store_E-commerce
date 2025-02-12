import 'package:fake_store_e_commerce/domain/models/fake_products/product.dart';
import 'package:fake_store_e_commerce/domain/models/fake_products/repository/product_repository.dart';
import 'package:fake_store_package/fake_store_package.dart';

class ProductApiImplementation implements ProductRepository {
  final fakeStore = FakeStorePackage();
  @override
  Future<Product> getProduct(int id) async {
    final result = await fakeStore.getProduct(id);
    return result.fold<Product>(
          (error) => throw Exception('Error al obtener los productos: $error'),
          (product) => Product.fromFakeStoreProduct(product),
    );
  }

  @override
  Future<List<Product>> getProducts() async {
    final result = await fakeStore.getAllProducts();
    return result.fold<List<Product>>(
          (error) => throw Exception('Error al obtener los productos: $error'),
          (products) => products.map((p) => Product.fromFakeStoreProduct(p)).toList(),
    );
  }


  @override
  Future<List<Product>> getProductsByCategory(String category) async {
    final result = await fakeStore.getProductsByCategory(category);
    return result.fold<List<Product>>(
          (error) => throw Exception('Error al obtener los productos: $error'),
          (products) => products.map((p) => Product.fromFakeStoreProduct(p)).toList(),
    );
  }
}

