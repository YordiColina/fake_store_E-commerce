import 'package:atomic_design/atomic_design.dart';
import 'package:atomic_design/pages/atomic_loginpage.dart';
import 'package:fake_store_package/models/auth/login_request.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../config/providers/notifiers_providers/auth_notifier_provider.dart';
import '../../../config/providers/notifiers_providers/user_auth_local_notifier_provider.dart';

class LoginScreen extends ConsumerWidget{

 const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<String> isValidate = [];
    void onLogin() async {
      final authNotifier = ref.read(authNotifierProvider.notifier);
      final userLocalNotifier = ref.read(userAuthLocalNotifierProvider.notifier);
      final userLocalData =  await userLocalNotifier.getUser();
      print("User local data: $userLocalData");
      await authNotifier.login(LoginRequest(username: isValidate[0] == userLocalData?['username'] ?
      "mor_2314" : isValidate[0], password: isValidate[1] == userLocalData?['password'] ?
      "83r5^_": isValidate[1])); // Llama a la función de autenticación

      final loginSuccess = ref.read(authNotifierProvider); // Obtiene el estado actualizado

      print("Login status: $loginSuccess");

      if (loginSuccess) {
        context.go('/Home');
      }
    }

    return AtomicLoginPage(
      icon: Icons.login,
      title: 'Fake store',
      textColorLabel: const Color.fromARGB(255, 2, 136, 209),
      buttonText: 'Iniciar sesión',
      labels: ['Usuario', 'Contraseña'],
      fieldsNumber: 2,
      obscureText: true,
      subTitle: 'Iniciar sesión',
      titleColor: const Color.fromARGB(255, 38, 50, 56),
      subTitleColor: const Color.fromARGB(255, 84, 110, 122),
      iconColor: const Color.fromARGB(255, 2, 136, 209),
      iconSize: 50,
      buttonColor: const Color.fromARGB(255, 2, 136, 209),
      secundaryButtonColor: const Color.fromARGB(255, 2, 136, 209),
      goToRegister: () {context.go('/Register');},
      fontWeight: FontWeight.bold, onPressed: () { onLogin();  }, onFieldsFilled: (values) {
        isValidate = values;
    },);
  }
  }



