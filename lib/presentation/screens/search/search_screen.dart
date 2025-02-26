import 'package:atomic_design/atomic_design.dart';
import 'package:atomic_design/molecules/atomic_search_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../config/providers/notifiers_providers/product_notifier_provider.dart';
import '../../../config/providers/notifiers_providers/cart_notifier_provider.dart';

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
    final cartState = ref.watch(cartNotifierProvider);
    final cartNotifier = ref.read(cartNotifierProvider.notifier);


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
        title: const AtomicText(text: 'Buscar Producto',fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 38, 50, 56), size: TextSize.medium),
        actions: [
          Row(
            children: [
              Stack(
                children: [
                  IconButton(
                    icon: const Icon(Icons.shopping_cart),
                    color: const Color.fromARGB(255, 2, 136, 209),
                    onPressed: () {
                      context.go(
                          '/Cart',
                          extra: {
                            'fromScreen': 'Search',
                            'isFromDetail': false,
                          });
                    },
                  ),
                  if (cartState.isNotEmpty && cartState.first!.products.isNotEmpty) // Si hay productos en el carrito
                    Positioned(
                      right: 6,
                      top: 6,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                        constraints: const BoxConstraints(
                          minWidth: 20,
                          minHeight: 20,
                        ),
                        child: Text(
                          cartNotifier.getTotalProducts().toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(width: 5),
              IconButton(onPressed: () {
                context.go(
                  '/Support',
                  extra: {
                    'fromScreen': 'Search',
                  },
                );
              }, icon: const Icon(Icons.support_agent, color: Color.fromARGB(255, 255, 111, 0),)),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(
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
                        'fromScreen': 'Search',
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
