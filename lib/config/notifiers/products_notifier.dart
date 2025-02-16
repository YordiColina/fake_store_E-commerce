import 'package:fake_store_package/models/products/product.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/usecases/product_usecases/get_product_usecase.dart';
import '../../domain/usecases/product_usecases/get_products_by_category_usecase.dart';
import '../../domain/usecases/product_usecases/get_products_usecase.dart';

class ProductNotifier extends StateNotifier<List<Product>> {
  final GetProductUseCase getProductUseCase;
  final GetProductsByCategoryUseCase getProductsByCategoryUseCase;
  final GetProductsUseCase getProductsUseCase;

  ProductNotifier({
    required this.getProductUseCase,
    required this.getProductsByCategoryUseCase,
    required this.getProductsUseCase,
  }) : super([]); // Estado inicial: lista vacía

  Future<Product> getProduct(int id) async {
    final product = await getProductUseCase.execute(id);
    return product;
  }

  Future<List<Product>> getProductsByCategory(String category) async {
    final products = await getProductsByCategoryUseCase.execute(category);
    state = products; // Actualiza el estado con los productos de la categoría
    return products;
  }

  Future<List<Product>> getAllProducts() async {
    final products = await getProductsUseCase.execute();
    state = products; // Actualiza el estado con todos los productos
    return products;
  }
}

