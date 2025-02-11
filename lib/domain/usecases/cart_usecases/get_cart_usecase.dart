import '../../models/fake_cart_data/cart.dart';
import '../../models/fake_cart_data/repository/cart_repository.dart';


class GetCartUseCase {
  final CartRepository _cartRepository;

  GetCartUseCase(this._cartRepository);

  Future<Cart> execute(int id) {
    return _cartRepository.getCart(id);
  }
}