// Provider para el ProductNotifier
import 'package:fake_store_package/models/products/product.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../domain/usecases/product_usecases/get_product_usecase.dart';
import '../../../domain/usecases/product_usecases/get_products_by_category_usecase.dart';
import '../../../domain/usecases/product_usecases/get_products_usecase.dart';
import '../../notifiers/products_notifier.dart';
import '../repository_providers/product_repository_provider.dart';

final productNotifierProvider = StateNotifierProvider<ProductNotifier, List<Product>>((ref) {
  final productRepository = ref.watch(productRepositoryProvider);
  return ProductNotifier(
    getProductUseCase: GetProductUseCase(productRepository),
    getProductsByCategoryUseCase: GetProductsByCategoryUseCase(productRepository),
    getProductsUseCase: GetProductsUseCase(productRepository),
  );
});