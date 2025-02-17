

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/models/fake_categories/categories.dart';
import '../../../domain/usecases/category_usecases/get_categories_usecase.dart';
import '../../notifiers/categories_notifier.dart';
import '../repository_providers/categories_repository_provider.dart';

final categoriesNotifierProvider = StateNotifierProvider<CategoriesNotifier, Categories>((ref) {
  final productRepository = ref.watch(categoriesRepositoryProvider);
  return CategoriesNotifier(
    getCategoriesUseCase: GetCategoriesUseCase(productRepository),
  );
});