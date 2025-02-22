import 'package:fake_store_e_commerce/presentation/screens/auth/login_screen.dart';
import 'package:fake_store_e_commerce/presentation/screens/catalog/catalog_screen.dart';
import 'package:fake_store_package/models/products/product.dart';
import 'package:go_router/go_router.dart';

import '../presentation/screens/auth/register_screen.dart';
import '../presentation/screens/details/detail_screen.dart';
import '../presentation/screens/home/home_screen.dart';


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
      path: '/Detail',
      name: 'Detail',
      builder: (context, state) {
        final item = state.extra as Product;
        return DetailScreen(product: item);
      },
    ),
  ],
);
