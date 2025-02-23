import 'package:fake_store_e_commerce/config/providers/usecases_provider/categories_usecases_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../domain/models/fake_categories/categories.dart';
import '../../notifiers/categories_notifier.dart';
import '../repository_providers/categories_repository_provider.dart';

final categoriesNotifierProvider = StateNotifierProvider<CategoriesNotifier, Categories>((ref) {
  return CategoriesNotifier(
    getCategoriesUseCase: ref.watch(getCategoriesUseCaseProvider),
  );
});