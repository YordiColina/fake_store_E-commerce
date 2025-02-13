import 'package:atomic_design/templates/atomic_register_template.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  void onRegister(Map<String, String> cd) {}
  final List<String> labels = [
 'nombre',
  'apellido',
  'email',
  'password',
  ];
  @override
  Widget build(BuildContext context) {
    return AtomicTemplateRegister(onRegister: onRegister, labels: labels, buttonText: "hello");
  }
}
