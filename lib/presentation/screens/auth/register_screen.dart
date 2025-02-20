import 'package:atomic_design/templates/atomic_register_template.dart';
import 'package:fake_store_package/models/user/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../config/providers/notifiers_providers/auth_notifier_provider.dart';
import '../../../config/providers/notifiers_providers/create_user_notifier_provider.dart';
import '../../../config/providers/notifiers_providers/user_notifier_provider.dart';

class RegisterScreen extends ConsumerWidget {
  const RegisterScreen({super.key});



  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<String> fieldsValues = [];
void onRegister() async {
      final createUserNotifier = ref.read(createUserNotifierProvider.notifier);
      createUserNotifier.addUser(User(
          email: fieldsValues[0],
          username: fieldsValues[1],
          password:fieldsValues[2],
          name: Name(firstname: fieldsValues[3] , lastname: fieldsValues[4]),
          address: Address(
              city: fieldsValues[5],
              street: fieldsValues[6],
              number: int.parse(fieldsValues[7]),
              zipcode:fieldsValues[8],
              geolocation: Geolocation(lat: fieldsValues[9], long: fieldsValues[10])),
          phone: fieldsValues[11]));// Llama a la función de autenticación

      final registerSuccess = ref.watch(createUserNotifierProvider); // Obtiene el estado actualizado

      print("Register status: $registerSuccess");

      if (registerSuccess) {
        context.go('/Login');
      }


    }
    final List<String> labels = [
      'email',
      'username',
      'password',
      'firstname',
      'lastname',
      'city',
      'street',
      'number',
      'zipcode',
      'lat',
      'long',
      'phone'
    ];
   return Scaffold(
      body: SingleChildScrollView(
        child: AtomicTemplateRegister(
          labels: labels,
          onPressed: () {
            onRegister();
          },
          buttonText: "Crear cuenta",
          fieldsNumber: labels.length,
          iconSize: 50,
          onFieldsFilled: (values) {
          fieldsValues = values;
        },

        ),
      ),
    );
  }
}



