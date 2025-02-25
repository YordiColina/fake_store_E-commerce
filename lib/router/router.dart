import 'package:fake_store_e_commerce/presentation/screens/auth/login_screen.dart';
import 'package:fake_store_e_commerce/presentation/screens/catalog/catalog_screen.dart';
import 'package:fake_store_e_commerce/presentation/screens/search/search_screen.dart';
import 'package:fake_store_package/models/products/product.dart';
import 'package:go_router/go_router.dart';

import '../presentation/screens/auth/register_screen.dart';
import '../presentation/screens/cart/cart_screen.dart';
import '../presentation/screens/details/detail_screen.dart';
import '../presentation/screens/home/home_screen.dart';
import '../presentation/screens/support/support_screen.dart';


final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: 'Login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/Home',
      name: 'Home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/Register',
      name: 'Register',
      builder: (context, state) => const RegisterScreen(),
    ),
    GoRoute(
      path: '/Catalog',
      name: 'Catalog',
      builder: (context, state) {
        return const CatalogScreen();
      },
    ),
    GoRoute(
      path: '/Search',
      name: 'Search',
      builder: (context, state) {
        return const SearchScreen();
      },
    ),
    GoRoute(
      path: '/Detail',
      name: 'Detail',
      builder: (context, state) {
        final data = state.extra as Map<String, dynamic>?;
        final product = data?['product'] as Product;
        final fromScreen = data?['fromScreen'] as String;

        return DetailScreen(product: product, fromScreen: fromScreen);
      },
    ),
    GoRoute(
      path: '/Cart',
      name: 'Cart',
      builder: (context, state) {
        final data = state.extra as Map<String, dynamic>? ?? {}; // Asegura que no sea null
        final Product? product = data['product'] as Product?;
        final int quantity = (data['quantity'] as int?) ?? 0;
        final String fromScreen = (data['fromScreen'] as String?) ?? '';
        final bool isFromDetail = (data['isFromDetail'] as bool?) ?? false;

        return CartScreen(product, quantity: quantity, fromScreen: fromScreen, isFromDetail: isFromDetail);
      },
    ),

    GoRoute(
      path: '/Support',
      name: 'Support',
      builder: (context, state) {
        final data = state.extra as Map<String, dynamic>?;
        final fromScreen = data?['fromScreen'] as String;
        return  SupportScreen(fromScreen: fromScreen,);
      },
    ),


  ],
);
