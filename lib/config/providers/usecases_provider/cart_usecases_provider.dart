import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../domain/usecases/cart_usecases/add_cart_usecase.dart';
import '../../../domain/usecases/cart_usecases/delete_cart_usecase.dart';
import '../../../domain/usecases/cart_usecases/get_cart_usecase.dart';
import '../../../domain/usecases/cart_usecases/update_cart_usecase.dart';
import '../repository_providers/cart_repository_provider.dart';

final addCartUseCaseProvider = Provider((ref) {
  final repository = ref.read(cartRepositoryProvider);
  return AddCartUseCase(repository);
});

final getCartUseCaseProvider = Provider((ref) {
  final repository = ref.read(cartRepositoryProvider);
  return GetCartUseCase(repository);
});

final updateCartUseCaseProvider = Provider((ref) {
  final repository = ref.read(cartRepositoryProvider);
  return UpdateCartUseCase(repository);
});

final deleteCartUseCaseProvider = Provider((ref) {
  final repository = ref.read(cartRepositoryProvider);
  return DeleteCartUseCase(repository);
});
