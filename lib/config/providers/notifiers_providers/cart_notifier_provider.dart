import 'package:fake_store_e_commerce/config/providers/usecases_provider/cart_usecases_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../domain/models/fake_cart_data/cart.dart';
import '../../notifiers/cart_notifier.dart';


final cartNotifierProvider = StateNotifierProvider<CartNotifier, List<Cart?>>((ref) {
  return CartNotifier(
    addCartUseCase: ref.watch(addCartUseCaseProvider),
    deleteCartUseCase: ref.watch(deleteCartUseCaseProvider),
    getCartUseCase: ref.watch(getCartUseCaseProvider),
    updateCartUseCase: ref.watch(updateCartUseCaseProvider),
  );
});