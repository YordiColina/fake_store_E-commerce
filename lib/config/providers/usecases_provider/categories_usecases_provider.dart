import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../domain/usecases/category_usecases/get_categories_usecase.dart';
import '../repository_providers/categories_repository_provider.dart';

final getCategoriesUseCaseProvider = Provider((ref) {
  final repository = ref.read(categoriesRepositoryProvider);
  return GetCategoriesUseCase(repository);
});
