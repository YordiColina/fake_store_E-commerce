import 'package:atomic_design/atomic_design.dart';
import 'package:atomic_design/organism/atomic_detail_card.dart';
import 'package:fake_store_e_commerce/config/providers/notifiers_providers/cart_notifier_provider.dart';
import 'package:fake_store_package/models/cart/cart.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[50],
        title: Text(widget.product.title),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            context.go('/${widget.fromScreen}');
          },
        ),
        actions: [
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart, color: Color.fromARGB(255, 2, 136, 209),),
                onPressed: () {
                    context.go(
                      '/Cart',
                      extra: {
                        'fromScreen': '${widget.fromScreen}',
                        'isFromDetail': true,
                      },
                    );

                },
              ),
              const SizedBox(width: 5),
              IconButton(onPressed: () {
                context.go(
                  '/Support',
                  extra: {
                    'fromScreen': '${widget.fromScreen}',
                  },
                );
              }, icon: const Icon(Icons.support_agent,color: Color.fromARGB(255, 255, 111, 0),)),
            ],
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AtomicDetailCard(
                cardColor: Colors.white,
                borderCardColor: const Color.fromARGB(255, 1, 87, 155),
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
                      color: const Color.fromARGB(255, 2, 136, 209),
                      label: "agregar producto",
                      onPressed: () {
                        if (quantity == 0) {
                          return;
                        } else {
                          ref.read(cartNotifierProvider.notifier).addProductToCart(
                            CartProducts(productId: widget.product.id, quantity: quantity),
                            5, // Asegúrate de tener el userId disponible aquí
                          );
                          context.go(
                            '/Cart',
                            extra: {
                              'product': widget.product,
                              'quantity': quantity,
                              'fromScreen': widget.fromScreen,
                              'isFromDetail': true,
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
