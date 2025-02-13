import 'package:fake_store_e_commerce/domain/models/fake_categories/categories.dart';
import 'package:fake_store_e_commerce/domain/models/fake_categories/repository/categories_repository.dart';
import 'package:fake_store_package/fake_store_package.dart';

class CategoriesApiImplementation implements CategoriesRepository {
  final fakeStore = FakeStorePackage();

  @override
  Future<Categories> getCategories() async {
  final result = await fakeStore.getCategories();
  return result.fold<Categories>(
    (error) => throw Exception('Error al obtener las categorias: $error'),
    (categories) => Categories.fromFakeStoreCategories(categories),
  );
  }

}