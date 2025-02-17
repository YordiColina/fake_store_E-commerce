import 'package:fake_store_e_commerce/domain/usecases/category_usecases/get_categories_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/models/fake_categories/categories.dart';


class CategoriesNotifier extends StateNotifier<Categories> {
  final GetCategoriesUseCase getCategoriesUseCase;

  CategoriesNotifier( {required this.getCategoriesUseCase} ) : super(const Categories(categories: [])) {
    _fetchCategories(); // Llama a la función al inicializar
  }

  Future<void> _fetchCategories() async {
    final categories = await getCategoriesUseCase.execute();
    state = categories;
  }




  }



