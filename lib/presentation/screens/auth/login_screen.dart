import 'package:atomic_design/atomic_design.dart';
import 'package:atomic_design/pages/atomic_loginpage.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  void onLogin(String email, String password) {
    Navigator.pushNamed(context, '/home');
  }
  @override
  Widget build(BuildContext context) {
    return  AtomicLoginPage(onLogin: onLogin, icon: Icons.login, title: 'Fake store',
      buttonText: 'Iniciar sesión', labels: ['Correo','Contraseña'], fieldsNumber: 2,
      subTitle: 'Iniciar sesión',titleColor: const Color.fromRGBO(158, 123, 187, 1.0),
      iconColor: const Color.fromRGBO(158, 123, 187, 1.0) ,iconSize: 50, fontWeight: FontWeight.bold,);
  }
}
