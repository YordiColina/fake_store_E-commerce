import 'package:atomic_design/atomic_design.dart';
import 'package:atomic_design/molecules/atomic_dropdown_button.dart';
import 'package:atomic_design/molecules/atomic_search_field.dart';
import 'package:fake_store_e_commerce/config/providers/notifiers_providers/categories_notifier_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../config/providers/notifiers_providers/product_notifier_provider.dart';

class CatalogScreen extends ConsumerStatefulWidget {
  const CatalogScreen({super.key});

  @override
  _CatalogScreenState createState() => _CatalogScreenState();
}

class _CatalogScreenState extends ConsumerState<CatalogScreen> {
  late TextEditingController searchController;

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final items = ref.watch(productNotifierProvider);
    final productNotifier = ref.read(productNotifierProvider.notifier);
    final categories = ref.watch(categoriesNotifierProvider);

    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[50],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            context.go('/Home');
          },
        ),
        title: const Text('Catalogo'),
        actions: [
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  context.go('/Search');
                },
              ),
              const SizedBox(
                width: 5,
              ),
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {
                  context.go('/cart');
                },
              ),

            ],
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: AtomicDropdownButton(
                hintText: "Selecciona una categoría",
                items: categories.categories,
                onChanged: (value) {
              productNotifier.getProductsByCategory(value);
            }),
          ),

          const SizedBox(height: 20),
          Expanded(
            child: items.isNotEmpty
                ? AtomicTemplateCardList(
                    title: "",
                    items: items.map((product) => {
                          'title': product.title,
                          'price': product.price,
                          'image': product.image,
                          'category': product.category,
                          'description': product.description,
                        }).toList(),
                  )
                : const Center(child: CircularProgressIndicator()),
          ),
        ],
      ),
    );
  }
}
