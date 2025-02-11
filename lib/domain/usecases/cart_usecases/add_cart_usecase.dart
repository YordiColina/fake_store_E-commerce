import 'package:fake_store_e_commerce/domain/models/fake_cart_data/cart_request.dart';
import '../../models/fake_cart_data/repository/cart_repository.dart';

class AddCartUseCase {
  final CartRepository _cartRepository;

  AddCartUseCase(this._cartRepository);

  Future<void> execute(CartRequest cart) async {
    return _cartRepository.addCart(cart);
  }
}