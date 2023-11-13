import 'package:equipo_estrella/widgets/custom_form_field.dart';
import 'package:equipo_estrella/widgets/password_field.dart';
import 'package:equipo_estrella/widgets/primaryButton.dart';
import 'package:equipo_estrella/widgets/secondaryButton.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    final GoRouter router =
        GoRouter.of(context); // Obtiene el router de GoRouter

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(
                  top: 83), // Establece el margen superior en 83 píxeles
              child: Image.asset(
                "assets/Ser_manos_logo.png",
                width: 150,
                height: 150,
              ),
            ),
            const SizedBox(height: 32), // Espacio entre la imagen y campos
            //Nombre
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: const CustomFormField(
                  fieldName: "Nombre",
                  hintText: "Ej: Juan",
                  alwaysFloatingLabel: true),
            ),
            const SizedBox(height: 24), //Espacio
            //Apellido
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: const CustomFormField(
                  fieldName: "Apellido",
                  hintText: "Ej: Barcena",
                  alwaysFloatingLabel: true),
            ),
            const SizedBox(height: 24), //Espacio
            //Email
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: const CustomFormField(
                  fieldName: "Email",
                  hintText: "Ej: juanbarcena@mail.com",
                  alwaysFloatingLabel: true),
            ),
            const SizedBox(height: 24), //Espacio

            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: const PasswordFormField(alwaysFloatingLabel: true),
            ),

            const Spacer(), // Espaciador para centrar verticalmente los botones
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: PrimaryButton(text: "Registrarse", onPressedMethod: () {}),
            ),

            const SizedBox(height: 16), // Espacio entre los botones
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SecondaryButton(
                  text: "Ya tengo cuenta",
                  onPressedMethod: () {
                    router.go('/login');
                  }),
            ),
            const SizedBox(height: 32), // Espacio entre los botones
          ],
        ),
      ),
    );
  }
}
