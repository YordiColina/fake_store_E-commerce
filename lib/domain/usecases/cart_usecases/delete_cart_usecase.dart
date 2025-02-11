import 'package:fake_store_e_commerce/domain/models/fake_cart_data/cart_request.dart';

import '../../models/fake_cart_data/repository/cart_repository.dart';

class DeleteCartUseCase {
  final CartRepository _cartRepository;

  DeleteCartUseCase(this._cartRepository);

  Future<void> execute(CartRequest cart,int id) async {
    return _cartRepository.deleteCart(cart,id);
  }
}