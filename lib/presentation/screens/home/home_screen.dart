import 'package:atomic_design/atomic_design.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../config/providers/notifiers_providers/product_notifier_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(productNotifierProvider);
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: Padding(
          padding: EdgeInsets.only(top: 30),
          child: Center(
            child: AtomicText(text: "Fake store", fontWeight: FontWeight.bold,
              size: TextSize.large, color: Color.fromRGBO(158, 123, 187, 1.0),),
          ),
        ),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 20),
            child: Center(
              child: AtomicIconText(size: 50, text: "Bienvenidos", iconColor: Color.fromRGBO(158, 123, 187, 1.0),
                textColor: Color.fromRGBO(158, 123, 187, 1.0),
                textSize: TextSize.large,icon: Icons.home_outlined, fontWeight: FontWeight.bold,),
            ),
          ),

          AtomicTemplateCardList(title: "Nuestros productos destacados", items: items ?? []),

          Text(items[0].title)


        ],
      ),
    );
  }
}


