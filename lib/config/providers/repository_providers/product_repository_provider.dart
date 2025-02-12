import 'package:fake_store_e_commerce/infraestructure/driven_adapters/API/product_api_implementation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final productRepositoryProvider = Provider((ref) => ProductApiImplementation());