import 'package:fake_store_e_commerce/domain/usecases/product_usecases/get_filtered_products_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../domain/usecases/product_usecases/get_product_usecase.dart';
import '../../../domain/usecases/product_usecases/get_products_by_category_usecase.dart';
import '../../../domain/usecases/product_usecases/get_products_usecase.dart';
import '../repository_providers/product_repository_provider.dart';

final getProductUseCaseProvider = Provider((ref) {
  final repository = ref.read(productRepositoryProvider);
  return GetProductUseCase(repository);
});

final getProductsUseCaseProvider = Provider((ref) {
  final repository = ref.read(productRepositoryProvider);
  return GetProductsUseCase(repository);
});

final getProductsByCategoryUseCaseProvider = Provider((ref) {
  final repository = ref.read(productRepositoryProvider);
  return GetProductsByCategoryUseCase(repository);
});

final getFilteredProductsUseCaseProvider = Provider((ref) {
  final repository = ref.read(productRepositoryProvider);
  return GetFilteredProductsUseCase(repository);
});


