import 'package:atomic_design/templates/atomic_register_template.dart';
import 'package:fake_store_e_commerce/config/providers/notifiers_providers/user_auth_local_notifier_provider.dart';
import 'package:fake_store_package/models/user/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../config/providers/notifiers_providers/create_user_notifier_provider.dart';


class RegisterScreen extends ConsumerWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<String> fieldsValues = [];
    final userLocalNotifier = ref.read(userAuthLocalNotifierProvider.notifier);


    void onRegister() async {
      final createUserNotifier = ref.read(createUserNotifierProvider.notifier);
      await createUserNotifier.addUser(User(
        email: fieldsValues[0],
        username: fieldsValues[1],
        password: fieldsValues[2],
        name: Name(firstname: fieldsValues[3], lastname: fieldsValues[4]),
        address: Address(
          city: fieldsValues[5],
          street: fieldsValues[6],
          number: int.parse(fieldsValues[7]),
          zipcode: fieldsValues[8],
          geolocation: Geolocation(lat: fieldsValues[9], long: fieldsValues[10]),
        ),
        phone: fieldsValues[11],
      ));
    }

    // Escuchar cambios en `createUserNotifierProvider`
    ref.listen<bool>(createUserNotifierProvider, (previous, next) {
      if (next) {
        userLocalNotifier.saveUser(fieldsValues[1], fieldsValues[2]);
        context.go('/');
      }
    });

    final List<String> labels = [
      'email', 'username', 'password', 'firstname', 'lastname',
      'city', 'street', 'number', 'zipcode', 'lat', 'long', 'phone'
    ];

    return Scaffold(
      body: SingleChildScrollView(
        child: AtomicTemplateRegister(
          buttonColor: const Color.fromARGB(255, 2, 136, 209),
          labels: labels,
          textColor: const Color.fromARGB(255, 38, 50, 56),
          onPressed: onRegister,
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



