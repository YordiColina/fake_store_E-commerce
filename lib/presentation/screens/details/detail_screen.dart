import 'package:atomic_design/atomic_design.dart';
import 'package:atomic_design/organism/atomic_detail_card.dart';
import 'package:fake_store_e_commerce/config/providers/notifiers_providers/cart_notifier_provider.dart';
import 'package:fake_store_package/models/cart/cart.dart';
import 'package:fake_store_package/models/cart/cart_request.dart';
import 'package:fake_store_package/models/products/product.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailScreen extends ConsumerStatefulWidget {
  final String? fromScreen;
  final Product product;
  const DetailScreen({super.key, required this.product, this.fromScreen});

  @override
  ConsumerState<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends ConsumerState<DetailScreen> {
  int quantity = 0;
  List<CartProducts> cartProducts = [];

  @override
  Widget build(BuildContext context) {
    final items = ref.watch(cartNotifierProvider);
    final cartNotifier = ref.read(cartNotifierProvider.notifier);
    cartNotifier.addCart(CartRequest(
        userId: 1,
        date: DateTime.now(),
        products: []));

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product.title),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            context.go('/${widget.fromScreen}');
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              context.go('/cart');
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AtomicDetailCard(
                titulo: widget.product.title,
                precio: widget.product.price,
                imageUrl: widget.product.image,
                categoria: widget.product.category,
                descripcion: widget.product.description),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 20),
              child: Center(
                child: Row(
                  children: [
                    AtomicButton(
                      label: "agregar producto",
                      onPressed: () {
                        if (quantity == 0) {
                          return;
                        } else {
                          context.go(
                            '/Cart',
                            extra: {
                              'product': widget.product,
                              'quantity': quantity,
                            },
                          );
                        }
                      },
                    ),
                    const SizedBox(width: 20),
                    GestureDetector(
                      onTap: () {
                        if (quantity > 0) {
                          setState(() {
                            quantity--;
                          });
                        }
                      },
                      child: _buildIconContainer(Icons.remove),
                    ),
                    const SizedBox(width: 20),
                    _buildQuantityDisplay(),
                    const SizedBox(width: 20),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          quantity++;
                        });
                      },
                      child: _buildIconContainer(Icons.add),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildIconContainer(IconData icon) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Icon(icon, size: 25, color: Colors.black),
    );
  }

  Widget _buildQuantityDisplay() {
    return Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Center(
        child: AtomicText(
          text: quantity.toString(),
          fontWeight: FontWeight.bold,
          size: TextSize.large,
        ),
      ),
    );
  }
}
