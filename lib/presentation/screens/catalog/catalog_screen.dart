import 'package:atomic_design/atomic_design.dart';
import 'package:fake_store_package/models/products/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../config/providers/notifiers_providers/categories_notifier_provider.dart';
import '../../../config/providers/notifiers_providers/product_notifier_provider.dart';

class CatalogScreen extends ConsumerWidget {
  const CatalogScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(productNotifierProvider);
    final categories = ref.watch(categoriesNotifierProvider);
    List<Product>? filteredList = [];

    TextEditingController searchController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.080,
                left: 20,
                right: 20),
            child: TextField(
              controller: searchController,
              onChanged: (query) {

            filteredList = ref.watch()
              },
              decoration: InputDecoration(
                hintText: 'Encuentra  tus productos por nombre  o descripción',
                filled: true,
                fillColor: Colors.white,
                hintStyle:
                    const TextStyle(color: Colors.grey, fontFamily: 'Stars'),
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          items.isNotEmpty
              ? AtomicTemplateCardList(
                  title: "",
                  containerListHeight: MediaQuery.of(context).size.height * 0.70,
                  items: items
                      .toList()
                      .map((product) => {
                            'title': product.title,
                            'price': product.price,
                            'image': product.image,
                            'category': product.category,
                          })
                      .toList(),
                )
              : const CircularProgressIndicator(),
        ],
      ),
    );
  }
}
