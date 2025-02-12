import 'package:fake_store_e_commerce/domain/models/fake_cart_data/cart.dart';
import 'package:fake_store_e_commerce/domain/models/fake_cart_data/cart_request.dart';
import 'package:fake_store_e_commerce/domain/models/fake_cart_data/repository/cart_repository.dart';
import 'package:fake_store_package/fake_store_package.dart';

class CartApiImplementation implements CartRepository {
  final fakeStore = FakeStorePackage();
  @override
  Future<void> addCart(CartRequest cartRequest) {
    // TODO: implement addCart
    throw UnimplementedError();
  }

  @override
  Future<void> deleteCart(CartRequest cartRequest, int id) {
    // TODO: implement deleteCart
    throw UnimplementedError();
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
    @override

    @override
    Future<void> updateCart(CartRequest cartRequest, int id) async {
      final result = await fakeStore.updateCart(id, cartRequest.toFakeStoreCartRequest());
    }

    }

  }


