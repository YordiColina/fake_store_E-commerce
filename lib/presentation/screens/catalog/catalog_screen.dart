import 'package:atomic_design/atomic_design.dart';
import 'package:atomic_design/molecules/atomic_dropdown_button.dart';
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
    final productNotifier = ref.read(productNotifierProvider.notifier);
    productNotifier.getAllProducts();
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
        title: const AtomicText(text: 'Catalogo',  color: Color.fromARGB(255, 38, 50, 56),
        size: TextSize.medium,fontWeight: FontWeight.bold),
        actions: [
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.search, color: Color.fromARGB(255, 2, 136, 209)),
                onPressed: () {
                  context.go('/Search');
                },
              ),
              const SizedBox(
                width: 5,
              ),
              IconButton(
                icon: const Icon(Icons.shopping_cart, color: Color.fromARGB(255, 2, 136, 209)),
                onPressed: () {
                  context.go(
                      '/Cart',
                      extra: {
                      'fromScreen': 'Catalog',
                      'isFromDetail': false,
                      });
                },
              ),
              const SizedBox(width: 5),
              IconButton(onPressed: () {
                context.go(
                  '/Support',
                  extra: {
                    'fromScreen': 'Catalog',
                  },
                );
              }, icon: const Icon(Icons.support_agent, color: Color.fromARGB(255, 255, 111, 0))),

            ],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: AtomicDropdownButton(
                  hintText: "Selecciona una categoría",
                  items: categories.categories,
                  borderRadius: 15,
                  onChanged: (value) {
                productNotifier.getProductsByCategory(value);
              }),
            ),

            const SizedBox(height: 20),
            Expanded(
              child: items.isNotEmpty
                  ? AtomicTemplateCardList(
                backgroundListColor: Colors.white,
                cardColor: Colors.white,
                borderCardColor: const Color.fromARGB(255, 1, 87, 155),
                      title: "",
                      items: items.map((product) => {
                            'title': product.title,
                            'price': product.price,
                            'image': product.image,
                            'category': product.category,
                            'description': product.description,
                        'onTapFunction': () {
                          context.go(
                            '/Detail',
                            extra: {
                              'product': product,
                              'fromScreen': 'Catalog',
                            },
                          );
                        },
                          }).toList(),
                    )
                  : const Center(child: CircularProgressIndicator()),
            ),
          ],
        ),
      ),
    );
  }
}
