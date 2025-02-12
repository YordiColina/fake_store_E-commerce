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
    return  AtomicLoginPage(onLogin: onLogin);
  }
}
