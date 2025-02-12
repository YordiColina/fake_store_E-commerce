import 'package:fake_store_e_commerce/domain/models/fake_cart_data/cart_request.dart';

import '../cart.dart';

abstract class CartRepository {
  Future<List<Cart>> getCart(int cartId);
  Future<void> addCart(CartRequest cartRequest);
  Future<void> updateCart(CartRequest cartRequest, int id);
  Future<void> deleteCart(CartRequest cartRequest, int id);
}