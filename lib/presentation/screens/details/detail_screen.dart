import 'package:fake_store_package/models/products/product.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
 final Product product;
  const DetailScreen({super.key, required this.product});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
