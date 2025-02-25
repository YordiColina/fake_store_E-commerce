import 'package:atomic_design/atomic_design.dart';
import 'package:fake_store_e_commerce/config/providers/notifiers_providers/categories_notifier_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../config/providers/notifiers_providers/product_notifier_provider.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {

  @override
  void initState() {
    final productNotifier = ref.read(productNotifierProvider.notifier);
    productNotifier.getAllProducts();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final items = ref.watch(productNotifierProvider);

    final categories = ref.watch(categoriesNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[50],
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            color: const Color.fromARGB(255, 2, 136, 209),
            onPressed: () {
              context.go('/Search');
            },
          ),
          const SizedBox(
            width: 5,
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            color: const Color.fromARGB(255, 2, 136, 209),
            onPressed: () {
              context.go(
                '/Cart',
                extra: {
                  'fromScreen': 'Home',
                  'isFromDetail': false,
                },
              );
            },
          ),
          const SizedBox(width: 10),
          IconButton(
            color: const Color.fromARGB(255, 255, 111, 0),
              onPressed: () {
            context.go(
              '/Support',
              extra: {
                'fromScreen': 'Home',
              },
            );
          }, icon: const Icon(Icons.support_agent)),
        ],
      ),
      backgroundColor: Colors.lightBlue[50],
      body: ListView(
        children: [
          Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 20),
                child: Center(
                  child: AtomicIconText(
                    size: 50,
                    text: "Fake Store",
                    iconColor: Color.fromARGB(255, 2, 136, 209),
                    textColor: Color.fromARGB(255, 38, 50, 56),
                    textSize: TextSize.large,
                    icon: Icons.home_outlined,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),



              categories.categories.isNotEmpty
                  ? Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                                    ),
                      child: AtomicIconText(
                                      size: 50,

                                      text: "Productos de la mejor calidad\n en las siguientes categorías"
                        " \n${categories.categories.join("\n")}",
                                      icon: Icons.category_outlined,
                                      iconColor: Color.fromARGB(255, 2, 136, 209),
                                      textColor: Color.fromARGB(255, 84, 110, 122),
                                      fontWeight: FontWeight.bold,
                                    ),
                    ),
                  )
                  : const CircularProgressIndicator(),
              const SizedBox(height: 20),



              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      const AtomicIconText(
                        size: 50,
                        text: "Disfruta de nuestras ofertas, 2x1 en Anillos para tu compromiso",
                        iconColor: Color.fromARGB(255, 2, 136, 209),
                        icon: Icons.card_giftcard,
                        textColor: Color.fromARGB(255, 84, 110, 122),
                        fontWeight: FontWeight.bold,
                      ),
                      items.isNotEmpty
                          ? GestureDetector(
                        onTap: () {
                          context.go(
                            '/Detail',
                            extra: {
                              'product': items[5],
                              'fromScreen': 'Home',
                            },
                          );
                        },
                        child: AtomicCard(
                          cardColor: const Color.fromARGB(255, 179, 229, 252),
                          titulo: items[5].title,
                          precio: items[5].price,
                          imageUrl: items[5].image,
                          categoria: items[5].category,
                        ),
                      )
                          : const CircularProgressIndicator(),

                    ],
                  ),
                ),
              ),


              const SizedBox(height: 20),

              items.isNotEmpty
                  ? SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
                child: AtomicTemplateCardList(
                  backgroundListColor: Colors.white,
                  cardColor: const Color.fromARGB(255, 179, 229, 252),
                  titleColor: const Color.fromARGB(255, 38, 50, 56),
                  title: "Nuestros productos destacados",
                  items: items.take(4).map((product) => {
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
                          'fromScreen': 'Home',
                        },
                      );
                    },
                  }).toList(),
                ),
              )
                  : const CircularProgressIndicator(),

              const SizedBox(height: 20),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 30, left: 20, right: 20),
            child: AtomicButton(
              color: const Color.fromARGB(255, 2, 136, 209),
              label: "Nuestros productos",
              onPressed: () => context.go('/Catalog'),
            ),
          ),
        ],
      ),
    );
  }
}
