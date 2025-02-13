import 'package:fake_store_package/models/cart/cart_request.dart';
import '../../models/fake_cart_data/repository/cart_repository.dart';

class AddCartUseCase {
  final CartRepository _cartRepository;

  AddCartUseCase(this._cartRepository);

  Future<void> execute(CartRequest cart) async {
    return _cartRepository.addCart(cart);
  }
}