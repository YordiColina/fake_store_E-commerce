import 'package:fake_store_e_commerce/domain/models/fake_cart_data/cart.dart';
import 'package:fake_store_e_commerce/domain/models/fake_cart_data/repository/cart_repository.dart';
import 'package:fake_store_package/fake_store_package.dart';
import 'package:fake_store_package/models/cart/cart_request.dart';

class CartApiImplementation implements CartRepository {
  final fakeStore = FakeStorePackage();

  @override
  Future<void> addCart(CartRequest cartRequest) async {
    final result = await fakeStore.createCart(cartRequest);
    return result.fold(
      (error) => throw Exception('Error al agregar el carrito: $error'),
      (cart) => cart,
    );
  }

  @override
  Future<void> deleteCart(CartRequest cartRequest, int id) async {
    final result = await fakeStore.deleteCart(id);
    return result.fold(
      (error) => throw Exception('Error al eliminar el carrito: $error'),
      (cart) => cart,
    );
  }

  @override
  Future<List<Cart>> getCart(int cartId) async {
    final result = await fakeStore.getCart(cartId);
    return result.fold<List<Cart>>(
      (error) => throw Exception('Error al obtener el carrito: $error'),
      (carts) => carts.map((cart) => Cart.fromFakeStoreCart(cart)).toList(),
    );
  }

  @override
  Future<void> updateCart(CartRequest cartRequest, int id) async {
    final result = await fakeStore.updateCart(id, cartRequest);
    return result.fold(
      (error) => throw Exception('Error al actualizar el carrito: $error'),
      (cart) => cart,
    );
  }
}
