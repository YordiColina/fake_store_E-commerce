import 'package:atomic_design/atomic_design.dart';
import 'package:fake_store_e_commerce/config/providers/notifiers_providers/product_notifier_provider.dart';
import 'package:fake_store_package/models/products/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../config/providers/notifiers_providers/cart_notifier_provider.dart';

final productDataProvider = FutureProvider.autoDispose<List<Product>>((ref) async {
  final cartState = ref.watch(cartNotifierProvider);
  final productNotifier = ref.watch(productNotifierProvider.notifier);

  // Verificar que el carrito no esté vacío antes de buscar productos
  if (cartState.isEmpty || cartState.first?.products.isEmpty == true) {
    return [];
  }

  // Obtener todos los productos del carrito
  final productInfo = await Future.wait(cartState.first!.products.map(
        (item) async => await productNotifier.getProduct(item.productId),
  ));

  return productInfo;
});




class CartScreen extends ConsumerWidget {
  final Product? product;
  final int quantity;
  final String fromScreen;
  final bool isFromDetail;

  const CartScreen(this.product, {super.key,
    required this.quantity,
    required this.fromScreen,
    required this.isFromDetail});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartNotifier = ref.watch(cartNotifierProvider.notifier);
    final cartState = ref.watch(cartNotifierProvider);
    final imagesAsync = ref.watch(productDataProvider);
    double totalPrice = 0.0;


    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[50],
        title: const AtomicText(text: 'Carrito de compras ',fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 38, 50, 56), size: TextSize.medium),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            isFromDetail && product != null
                ? context.go('/Detail', extra: {'product': product, 'fromScreen': fromScreen})
                : context.go("/$fromScreen");
          },
        ),
        actions: [
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.delete, color:Color.fromARGB(255, 255, 111, 0) ),
                onPressed: () {
                  cartNotifier.state = [];
                },
              ),
              const SizedBox(width: 5),
              IconButton(onPressed: () {
                context.go(
                  '/Support',
                  extra: {
                    'fromScreen': 'Cart',
                  },
                );
              }, icon: const Icon(Icons.support_agent,color: Color.fromARGB(255, 2, 136, 209),)),
            ],
          ),
        ],
      ),
      body: cartState.isEmpty
          ? const Center(child: Text('Tu carrito está vacío'))
          : imagesAsync.when(

        data: (productInfo) {
          // Calcular totalPrice antes de construir el ListView
          for (int i = 0; i < cartState.first!.products.length; i++) {
            totalPrice += productInfo[i].price * cartState.first!.products[i].quantity;
          }
        return  ListView.builder(
            itemCount: cartState.first?.products.length ?? 0,
            itemBuilder: (context, index) {
              final product = cartState.first?.products[index];


              return Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Container(
                  margin: const EdgeInsets.all(8),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color.fromARGB(255, 1, 87, 155)),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [

                      if (productInfo.isNotEmpty)
                        AtomicText(text: productInfo[index].title, fontWeight: FontWeight.bold,
                            size: TextSize.medium, textAlign: TextAlign.center),
                      const SizedBox(height: 8),
                      Image.network(productInfo[index].image, height: 100, width: 100, fit: BoxFit.cover),
                      const SizedBox(height: 8),
                      AtomicText(text: "Precio unitario: ${productInfo[index].price.toString()}\$",
                          fontWeight: FontWeight.bold,
                          size: TextSize.small, textAlign: TextAlign.center),
                      const SizedBox(height: 8),
                      AtomicText(text: " Total:${productInfo[index].price*product!.quantity}\$",
                          fontWeight: FontWeight.bold,
                          size: TextSize.small, textAlign: TextAlign.center),

                      if (productInfo.isEmpty)
                        const CircularProgressIndicator(
                          color: Color.fromARGB(255, 1, 87, 155),
                          backgroundColor: Color.fromARGB(255, 1, 87, 155),
                        ),
                      ListTile(
                        title: Text('Producto ID: ${product.productId}'),
                        subtitle: Text('Cantidad: ${product.quantity}'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.remove),
                              onPressed: () {
                                if (product.quantity > 1) {
                                  cartNotifier.editProductQuantity(5, product.productId, product.quantity - 1);
                                } else {
                                  cartNotifier.removeProductFromCart(5, product.productId);
                                }
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.add),
                              onPressed: () {
                                cartNotifier.editProductQuantity(5, product.productId, product.quantity + 1);
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () {
                                cartNotifier.removeProductFromCart(5, product.productId);
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator(
          color: Color.fromARGB(255, 1, 87, 155),
          backgroundColor: Color.fromARGB(255, 1, 87, 155),
        )),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: AtomicButton(
          color: const Color.fromARGB(255, 2, 136, 209),
          onPressed: () {
            if(cartState.isEmpty || cartState.first?.products.isEmpty == true) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('No hay productos en el carrito')),
              );
            } else {
              cartNotifier.state = [];
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Pedido enviado')),
              );
              context.go('/Home');
            }

          },
          label: 'Enviar pedido, total: ${totalPrice.toStringAsFixed(2)}\$',
        ),
      ),
    );
  }
}
