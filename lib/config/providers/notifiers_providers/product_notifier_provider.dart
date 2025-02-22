// Provider para el ProductNotifier
import 'package:fake_store_e_commerce/domain/usecases/product_usecases/get_filtered_products_usecase.dart';
import 'package:fake_store_package/models/products/product.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../domain/usecases/product_usecases/get_product_usecase.dart';
import '../../../domain/usecases/product_usecases/get_products_by_category_usecase.dart';
import '../../../domain/usecases/product_usecases/get_products_usecase.dart';
import '../../notifiers/products_notifier.dart';
import '../repository_providers/product_repository_provider.dart';

final productNotifierProvider = StateNotifierProvider<ProductNotifier, List<Product>>((ref) {
  final _productRepository = ref.watch(productRepositoryProvider);
  return ProductNotifier(
    getFilteredProductsUseCase: GetFilteredProductsUseCase(_productRepository),
    getProductUseCase: GetProductUseCase(_productRepository),
    getProductsByCategoryUseCase: GetProductsByCategoryUseCase(_productRepository),
    getProductsUseCase: GetProductsUseCase(_productRepository),
  );
});