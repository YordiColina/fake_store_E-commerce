import 'package:atomic_design/atomic_design.dart';
import 'package:atomic_design/pages/atomic_loginpage.dart';
import 'package:fake_store_package/models/auth/login_request.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../config/providers/notifiers_providers/auth_notifier_provider.dart';

class LoginScreen extends ConsumerWidget{
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void onLogin(String email, String password) async {
      final authNotifier = ref.read(authNotifierProvider.notifier);

      await authNotifier.login(LoginRequest(username: email, password: password)); // Llama a la función de autenticación

      final loginSuccess = ref.read(authNotifierProvider); // Obtiene el estado actualizado

      print("Login status: $loginSuccess");

      if (loginSuccess) {
        Navigator.pushNamed(context, '/home');
      }
    }

    return AtomicLoginPage(
      icon: Icons.login,
      title: 'Fake store',
      buttonText: 'Iniciar sesión',
      labels: ['Correo', 'Contraseña'],
      fieldsNumber: 2,
      subTitle: 'Iniciar sesión',
      titleColor: const Color.fromRGBO(158, 123, 187, 1.0),
      iconColor: const Color.fromRGBO(158, 123, 187, 1.0),
      iconSize: 50,
      onBack: () {context.go('/');},
      fontWeight: FontWeight.bold, onPressed: () {  }, onFieldsFilled: (bool ) {  },);
  }
  }



