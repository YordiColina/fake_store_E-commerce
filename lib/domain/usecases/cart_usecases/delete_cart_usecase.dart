import 'package:fake_store_package/models/cart/cart_request.dart';
import '../../models/fake_cart_data/repository/cart_repository.dart';

class DeleteCartUseCase {
  final CartRepository _cartRepository;

  DeleteCartUseCase(this._cartRepository);

  Future<void> execute(int id) async {
    return _cartRepository.deleteCart(id);
  }
}