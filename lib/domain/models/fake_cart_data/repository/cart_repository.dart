import 'package:fake_store_package/models/cart/cart.dart';
import 'package:fake_store_package/models/cart/cart_request.dart';


abstract class CartRepository {
  Future<List<Cart>> getCart(int cartId);
  Future<void> addCart(CartRequest cartRequest);
  Future<void> updateCart(CartRequest cartRequest, int id);
  Future<void> deleteCart(int id);
}