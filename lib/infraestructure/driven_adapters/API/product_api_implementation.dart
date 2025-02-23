import 'package:fake_store_e_commerce/domain/models/fake_products/repository/product_repository.dart';
import 'package:fake_store_package/fake_store_package.dart';
import 'package:fake_store_package/models/products/product.dart';

class ProductApiImplementation implements ProductRepository {
  final fakeStore = FakeStorePackage();
  @override
  Future<Product> getProduct(int id) async {
    final result = await fakeStore.getProduct(id);
    return result.fold<Product>(
          (error) => throw Exception('Error al obtener los productos: $error'),
          (product) => product,
    );
  }

  @override
  Future<List<Product>> getProducts() async {
    final result = await fakeStore.getAllProducts();
    return result.fold<List<Product>>(
          (error) => throw Exception('Error al obtener los productos: $error'),
          (products) => products,
    );
  }


  @override
  Future<List<Product>> getProductsByCategory(String category) async {
    final result = await fakeStore.getProductsByCategory(category);
    return result.fold<List<Product>>(
          (error) => throw Exception('Error al obtener los productos: $error'),
          (products) => products,
    );
  }

  @override
  Future<List<Product>> searchProducts(String query) async {
    final result = await fakeStore.getAllProducts();
    var filteredList = [];
    return result.fold<List<Product>>(
          (error) => throw Exception('Error al obtener los productos: $error'),
          (products) =>  filteredList = products.where((product) {
            return product.title.toLowerCase().contains(query.toLowerCase()) ||
                product.description.toLowerCase().contains(query.toLowerCase());
          }).toList(),
    );
  }
}

