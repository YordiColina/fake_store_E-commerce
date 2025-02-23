import 'package:atomic_design/organism/atomic_detail_card.dart';
import 'package:fake_store_package/models/products/product.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DetailScreen extends StatefulWidget {
  final String? fromScreen;
 final Product product;
  const DetailScreen({super.key, required this.product, this.fromScreen});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product.title),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            context.go('/${widget.fromScreen}');
         },
        ),
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
             descripcion: widget.product.description)
          ],
        ),
      ),
    );
  }
}
