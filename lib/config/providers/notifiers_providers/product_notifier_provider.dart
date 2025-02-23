// Provider para el ProductNotifier

import 'package:fake_store_package/models/products/product.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../notifiers/products_notifier.dart';
import '../usecases_provider/product_usecase_provider.dart';

final productNotifierProvider = StateNotifierProvider<ProductNotifier, List<Product>>((ref) {
  return ProductNotifier(
    getFilteredProductsUseCase: ref.watch(getFilteredProductsUseCaseProvider),
    getProductUseCase: ref.watch(getProductUseCaseProvider),
    getProductsByCategoryUseCase: ref.watch(getProductsByCategoryUseCaseProvider),
    getProductsUseCase: ref.watch(getProductsUseCaseProvider),
  );
});
