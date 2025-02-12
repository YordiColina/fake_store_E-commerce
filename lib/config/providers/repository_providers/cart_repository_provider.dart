import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../infraestructure/driven_adapters/API/cart_api_implementation.dart';

final cartRepositoryProvider = Provider((ref) => CartApiImplementation());