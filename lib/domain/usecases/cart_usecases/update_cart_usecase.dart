import 'package:fake_store_e_commerce/domain/models/fake_cart_data/cart_request.dart';

import '../../models/fake_cart_data/cart.dart';
import '../../models/fake_cart_data/repository/cart_repository.dart';


class UpdateCartUseCase {
  final CartRepository _cartRepository;

  UpdateCartUseCase(this._cartRepository);

  Future<void> execute(CartRequest cart, int id) async {
    return _cartRepository.updateCart(cart, id);
  }
}