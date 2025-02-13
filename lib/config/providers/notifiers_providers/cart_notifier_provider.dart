import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../domain/models/fake_cart_data/cart.dart';
import '../../../domain/usecases/cart_usecases/add_cart_usecase.dart';
import '../../../domain/usecases/cart_usecases/delete_cart_usecase.dart';
import '../../../domain/usecases/cart_usecases/get_cart_usecase.dart';
import '../../../domain/usecases/cart_usecases/update_cart_usecase.dart';
import '../../notifiers/cart_notifier.dart';
import '../repository_providers/cart_repository_provider.dart';

final cartNotifierProvider = StateNotifierProvider<CartNotifier, List<Cart?>>((ref) {
  final cartRepository = ref.watch(cartRepositoryProvider);
  return CartNotifier(
    addCartUseCase: AddCartUseCase(cartRepository),
    deleteCartUseCase: DeleteCartUseCase(cartRepository),
    getCartUseCase: GetCartUseCase(cartRepository),
    updateCartUseCase: UpdateCartUseCase(cartRepository),
  );
});