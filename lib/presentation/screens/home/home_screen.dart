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
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: Padding(
          padding: EdgeInsets.only(top: 30),
          child: Center(
            child: AtomicText(
              text: "Fake store",
              fontWeight: FontWeight.bold,
              size: TextSize.large,
              color: Color.fromRGBO(158, 123, 187, 1.0),
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 20),
                child: Center(
                  child: AtomicIconText(
                    size: 50,
                    text: "Bienvenidos",
                    iconColor: Color.fromRGBO(158, 123, 187, 1.0),
                    textColor: Color.fromRGBO(158, 123, 187, 1.0),
                    textSize: TextSize.large,
                    icon: Icons.home_outlined,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              const Divider(height: 2, thickness: 2),

              categories.categories.isNotEmpty
                  ? AtomicIconText(
                size: 50,
                text: "Productos de la mejor calidad\n en las siguientes categorías"
                    " \n${categories.categories.join("\n")}",
                icon: Icons.category_outlined,
                iconColor: Colors.lightBlueAccent,
                textColor: Colors.black,
                fontWeight: FontWeight.bold,
              )
                  : const CircularProgressIndicator(),
              const SizedBox(height: 20),

              const Divider(height: 2, thickness: 2),

              const AtomicIconText(
                size: 50,
                text: "Disfruta de nuestras ofertas, 2x1 en Anillos para tu compromiso",
                iconColor: Colors.lightBlueAccent,
                icon: Icons.card_giftcard,
                textColor: Colors.black,
                fontWeight: FontWeight.bold,
              ),

              items.isNotEmpty
                  ? AtomicCard(
                titulo: items[5].title,
                precio: items[5].price,
                imageUrl: items[5].image,
                categoria: items[5].category,
              )
                  : const CircularProgressIndicator(),

              const Divider(height: 2, thickness: 2),

              const SizedBox(height: 20),

              items.isNotEmpty
                  ? SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
                child: AtomicTemplateCardList(
                  title: "Nuestros productos destacados",
                  items: items.take(4).map((product) => {
                    'title': product.title,
                    'price': product.price,
                    'image': product.image,
                    'category': product.category,
                    'description': product.description,
                  }).toList(),
                ),
              )
                  : const CircularProgressIndicator(),

              const Divider(height: 2, thickness: 2),
              const SizedBox(height: 20),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 30, left: 20, right: 20),
            child: AtomicButton(
              label: "Nuestros productos",
              onPressed: () => context.go('/Catalog'),
            ),
          ),
        ],
      ),
    );
  }
}
