import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../infraestructure/driven_adapters/API/categories_api_implementation.dart';

final categoriesRepositoryProvider = Provider((ref) => CategoriesApiImplementation());