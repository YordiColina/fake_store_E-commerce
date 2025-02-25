import 'package:atomic_design/atomic_design.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

class SupportScreen extends StatelessWidget {
  final String supportEmail = "soporte@tienda-fake.com";
  final String supportPhone = "+57 320 123 4567";

  final String fromScreen;

  const SupportScreen({super.key, required this.fromScreen});

  void _launchPhoneCall() async {
    final Uri url = Uri(scheme: 'tel', path: supportPhone);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      debugPrint("No se pudo abrir el marcador");
    }
  }

  void _launchEmail() async {
    final Uri url = Uri(scheme: 'mailto', path: supportEmail);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      debugPrint("No se pudo abrir la aplicación de correo");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[50],
        title: const AtomicText(text: "Soporte y contacto", fontWeight: FontWeight.bold,
            size: TextSize.medium, color: Color.fromARGB(255, 38, 50, 56),),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            if (fromScreen == 'Cart') {
              context.go('/$fromScreen', extra: { 'fromScreen': "Home", 'isFromDetail': false });
            } else {
              context.go('/$fromScreen');
            }
  }
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AtomicText(
                  color: Color.fromARGB(255, 84, 110, 122),
                 text:  "¿Necesitas ayuda? Contáctanos",
                  fontWeight: FontWeight.bold,
                  size: TextSize.medium,
                ),
                const SizedBox(height: 20),
                ListTile(
                  leading: const Icon(Icons.phone, color: Colors.blue),
                  title: AtomicText(text: supportPhone,fontWeight: FontWeight.w400,
                    color: const Color.fromARGB(255, 84, 110, 122),),
                  subtitle: const AtomicText(text: "Llámanos para soporte inmediato",
                    fontWeight: FontWeight.w400, color: Color.fromARGB(255, 84, 110, 122) ,),
                  onTap: _launchPhoneCall,
                ),
                ListTile(
                  leading: const Icon(Icons.email, color: Colors.red),
                  title: AtomicText(text: supportEmail,fontWeight: FontWeight.w400,
                    color: const Color.fromARGB(255, 84, 110, 122),),
                  subtitle: const AtomicText(text: "Envíanos un correo con tu consulta",
                    fontWeight: FontWeight.w400, color: Color.fromARGB(255, 84, 110, 122),),
                  onTap: _launchEmail,
                ),
                const SizedBox(height: 20),
                const AtomicText(
                 text:  "Motivos de contacto:",
                  fontWeight: FontWeight.bold,
                  size: TextSize.medium,
                  color: Color.fromARGB(255, 84, 110, 122),
                ),
                const AtomicText(
                 text:  "- Problemas con el pago\n"
                      "- Devoluciones y reembolsos\n"
                      "- Consultas sobre productos\n"
                      " Horarios de atención: Lunes a Viernes, 9 AM - 6 PM",
                  fontWeight: FontWeight.w400, color: Color.fromARGB(255, 84, 110, 122),
                ),
                const SizedBox(height: 20),
                ListTile(
                  leading: const Icon(Icons.feedback, color: Colors.green),
                  title: const AtomicText(text: "Peticiones, Quejas y Reclamos (PQR)",
                      fontWeight: FontWeight.w600, color: Color.fromARGB(255, 84, 110, 122),),
                  subtitle: const AtomicText(text: "puedes dejarnos tus comentarios en nuestro correo de contacto",
                 fontWeight: FontWeight.w400 , color: Color.fromARGB(255, 84, 110, 122), ),
                  onTap: () => _launchEmail(),
                ),
                ListTile(
                  leading: const Icon(Icons.work, color: Colors.purple),
                  title: const AtomicText(text: "Trabaja con Nosotros",
                      fontWeight: FontWeight.w600, color: Color.fromARGB(255, 84, 110, 122),),
                  subtitle: const AtomicText(text: "Envia tu hoja de vida a nuestro correo de contacto",
                  fontWeight: FontWeight.w400 , color: Color.fromARGB(255, 84, 110, 122), ),
                  onTap: () => _launchEmail(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
