import 'package:atomic_design/templates/atomic_register_template.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegisterScreen extends ConsumerWidget {
  const RegisterScreen({super.key});



  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void onRegister(Map<String, String> cd) {


    }
    final List<String> labels = [
      'nombre',
      'apellido',
      'email',
      'password',
    ];
   return Scaffold(
      body: AtomicTemplateRegister(
        labels: labels,
        buttonText: "Crear cuenta",
        fieldsNumber: 4,
        iconSize: 50, onPressed: () {  }, onFieldsFilled: (bool ) {  },
      ),
    );
  }
}



