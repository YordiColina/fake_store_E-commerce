import 'package:fake_store_package/models/products/product.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  final Product product;
  final int quantity;
  const CartScreen({super.key, required this.product, required this.quantity});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrito de compras'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: const Center(
        child: Text('Carrito de compras'),
      ),

    );
  }
}
