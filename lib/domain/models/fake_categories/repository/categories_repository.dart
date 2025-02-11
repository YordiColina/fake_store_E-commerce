import 'package:fake_store_e_commerce/domain/models/fake_categories/categories.dart';

abstract class CategoriesRepository {
  Future<Categories> getCategories();
}