import 'package:atomic_design/atomic_design.dart';
import 'package:atomic_design/molecules/atomic_dropdown_button.dart';
import 'package:atomic_design/molecules/atomic_search_field.dart';
import 'package:fake_store_e_commerce/config/providers/notifiers_providers/categories_notifier_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../config/providers/notifiers_providers/product_notifier_provider.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
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
            context.go('/Catalog');
          },
        ),
        title: const Text('Buscar Producto'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              context.go('/cart');
            },
          ),
        ],
      ),
      body: Column(
        children: [

          Padding(
            padding: EdgeInsets.only(  top: MediaQuery.of(context).size.height * 0.080,
              left: 20,
              right: 20,),
            child: AtomicSearchField(
              controller: searchController,
              onChanged: (query) {
                productNotifier.getFilteredProducts(query);
              },),
          ),

          const SizedBox(height: 20),

          Expanded(
            child: items.isNotEmpty
                ? AtomicTemplateCardList(
              onTapFunction: () {
                context.go(
                  '/Detail',
                  extra: {
                    'product': items[5],
                    'fromScreen': 'Home',
                  },
                );
              },
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
