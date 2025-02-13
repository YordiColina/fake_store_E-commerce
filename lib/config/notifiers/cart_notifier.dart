
import 'package:fake_store_package/models/cart/cart_request.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/models/fake_cart_data/cart.dart';
import '../../domain/usecases/cart_usecases/add_cart_usecase.dart';
import '../../domain/usecases/cart_usecases/delete_cart_usecase.dart';
import '../../domain/usecases/cart_usecases/get_cart_usecase.dart';
import '../../domain/usecases/cart_usecases/update_cart_usecase.dart';


class CartNotifier extends StateNotifier<List<Cart?>> {
  final AddCartUseCase addCartUseCase;
  final DeleteCartUseCase deleteCartUseCase;
  final GetCartUseCase getCartUseCase;
  final UpdateCartUseCase updateCartUseCase;

  CartNotifier({
    required this.addCartUseCase,
    required this.deleteCartUseCase,
    required this.getCartUseCase,
    required this.updateCartUseCase,
  }) : super([]); // Estado inicial: carrito vacío (null)

  // Obtener el carrito por ID
  Future <List<Cart>> getCart(int id) async {
    dynamic cart = await getCartUseCase.execute(id);
    state = cart; // Actualiza el estado con el carrito obtenido
    return cart;
  }

  // Agregar un carrito
  Future<void> addCart(CartRequest cart) async {
    await addCartUseCase.execute(cart);
    // Si deseas actualizar el estado después de agregar, puedes llamar a getCart nuevamente
    // state = await getCartUseCase.execute(cart.id);
  }

  // Actualizar un carrito
  Future<void> updateCart(CartRequest cart, int id) async {
    await updateCartUseCase.execute(cart, id);
    // Si deseas actualizar el estado después de la actualización, puedes llamar a getCart nuevamente
    // state = await getCartUseCase.execute(id);
  }

  // Eliminar un carrito
  Future<void> deleteCart(CartRequest cart, int id) async {
    await deleteCartUseCase.execute(cart, id);
    state = []; // Limpia el estado después de eliminar el carrito
  }
}

