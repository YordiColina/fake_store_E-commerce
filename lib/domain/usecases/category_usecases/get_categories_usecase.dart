import '../../models/fake_categories/categories.dart';
import '../../models/fake_categories/repository/categories_repository.dart';

class GetCategoriesUseCase {
  final CategoriesRepository _categoriesRepository;

  GetCategoriesUseCase(this._categoriesRepository);

  Future<Categories> execute() {
    return _categoriesRepository.getCategories();
  }
}