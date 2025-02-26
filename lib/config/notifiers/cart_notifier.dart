import 'package:fake_store_package/models/cart/cart.dart';
import 'package:fake_store_package/models/cart/cart_request.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/usecases/cart_usecases/add_cart_usecase.dart';
import '../../domain/usecases/cart_usecases/delete_cart_usecase.dart';
import '../../domain/usecases/cart_usecases/get_cart_usecase.dart';
import '../../domain/usecases/cart_usecases/update_cart_usecase.dart';

class CartNotifier extends StateNotifier<List<Cart>> {
  final AddCartUseCase addCartUseCase;
  final DeleteCartUseCase deleteCartUseCase;
  final GetCartUseCase getCartUseCase;
  final UpdateCartUseCase updateCartUseCase;

  CartNotifier({
    required this.addCartUseCase,
    required this.deleteCartUseCase,
    required this.getCartUseCase,
    required this.updateCartUseCase,
  }) : super([]);

  /// ✅ Obtener carrito por ID (ejecutar al entrar en la pantalla del carrito)
  Future<void> getCart(int userId) async {
    final cart = await getCartUseCase.execute(userId);
    state = cart; // Actualiza el estado con el carrito obtenido
  }

  /// ✅ Agregar un producto al carrito (si ya existe, aumenta la cantidad)
  Future<void> addProductToCart(CartProducts product, int userId) async {
    final cartIndex = state.indexWhere((cart) => cart.userId == userId);

    if (cartIndex != -1) {
      // 🛒 Si el carrito existe, actualizamos el producto dentro del carrito
      final cart = state[cartIndex];
      final updatedProducts = List<CartProducts>.from(cart.products);

      final productIndex = updatedProducts.indexWhere((p) => p.productId == product.productId);
      if (productIndex != -1) {
        // Si el producto ya está en el carrito, sumamos la cantidad
        updatedProducts[productIndex] = CartProducts(
          productId: product.productId,
          quantity: updatedProducts[productIndex].quantity + product.quantity,
        );
      } else {
        // Si no existe, lo agregamos
        updatedProducts.add(product);
      }

      // Actualizamos el carrito con los nuevos productos
      final updatedCart = Cart(
        id: cart.id,
        userId: cart.userId,
        date: cart.date,
        products: updatedProducts,
      );

      // Simulación de actualización en FakeStore
      await updateCartUseCase.execute(CartRequest(
        userId: cart.userId,
        date: cart.date,
        products: updatedProducts,
      ), cart.id);

      state = [
        ...state..[cartIndex] = updatedCart,
      ];
    } else {
      // 🆕 Si no hay carrito, lo creamos
      final newCart = Cart(
        id: state.length + 1, // FakeStore no persiste, así que generamos un ID
        userId: userId,
        date: DateTime.now(),
        products: [product],
      );

      await addCartUseCase.execute(CartRequest(
        userId: newCart.userId,
        date: newCart.date,
        products: newCart.products,
      ));

      state = [...state, newCart];
    }
  }

  /// ✅ Editar la cantidad de un producto en el carrito
  Future<void> editProductQuantity(int userId, int productId, int newQuantity) async {
    final cartIndex = state.indexWhere((cart) => cart.userId == userId);
    if (cartIndex == -1) return;

    final cart = state[cartIndex];
    final updatedProducts = cart.products.map((p) {
      if (p.productId == productId) {
        return CartProducts(productId: p.productId, quantity: newQuantity);
      }
      return p;
    }).toList();

    final updatedCart = Cart(
      id: cart.id,
      userId: cart.userId,
      date: cart.date,
      products: updatedProducts,
    );


    await updateCartUseCase.execute(CartRequest(
      userId: cart.userId,
      date: cart.date,
      products: updatedProducts,
    ), cart.id);

    state = [
      ...state..[cartIndex] = updatedCart,
    ];
  }

  int getTotalProducts() {
    int total = 0;
    state.forEach((cart) {
      cart.products.forEach((product) {
        total += product.quantity;
      });
    });
    return total;
  }

  /// ✅ Eliminar un producto del carrito
  Future<void> removeProductFromCart(int userId, int productId) async {
    final cartIndex = state.indexWhere((cart) => cart.userId == userId);
    if (cartIndex == -1) return;

    final cart = state[cartIndex];
    final updatedProducts = cart.products.where((p) => p.productId != productId).toList();

    if (updatedProducts.isEmpty) {
      // Si no quedan productos, eliminamos el carrito
      await deleteCartUseCase.execute(cart.id);
      state = state.where((c) => c.userId != userId).toList();
    } else {
      // Si quedan productos, actualizamos el carrito
      final updatedCart = Cart(
        id: cart.id,
        userId: cart.userId,
        date: cart.date,
        products: updatedProducts,
      );

      await updateCartUseCase.execute(CartRequest(
        userId: cart.userId,
        date: cart.date,
        products: updatedProducts,
      ), cart.id);

      state = [
        ...state..[cartIndex] = updatedCart,
      ];
    }
  }
}
