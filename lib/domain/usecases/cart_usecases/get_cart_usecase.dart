import 'package:fake_store_package/models/cart/cart.dart';
import '../../models/fake_cart_data/repository/cart_repository.dart';


class GetCartUseCase {
  final CartRepository _cartRepository;

  GetCartUseCase(this._cartRepository);

  Future<List<Cart>> execute(int id) {
    return _cartRepository.getCart(id);
  }
}