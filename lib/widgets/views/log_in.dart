import 'package:equipo_estrella/commons/colors.dart';
import 'package:equipo_estrella/commons/fonts.dart';
import 'package:equipo_estrella/widgets/custom_form_field.dart';
import 'package:equipo_estrella/widgets/password_field.dart';
import 'package:equipo_estrella/widgets/primaryButton.dart';
import 'package:equipo_estrella/widgets/secondaryButton.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LogIn extends StatelessWidget {
  const LogIn({super.key});

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
                  top: 199), // Establece el margen superior en 229 píxeles
              child: Image.asset(
                "assets/Ser_manos_logo.png",
                width: 150,
                height: 150,
              ),
            ),
            const SizedBox(height: 32), // Espacio entre la imagen y campos
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: const CustomFormField(
                  fieldName: "Email", hintText: "mimail@gmail.com"),
            ),
            const SizedBox(height: 24), //Espacio entre email y password
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: const PasswordFormField(),
            ),

            const Spacer(), // Espaciador para centrar verticalmente los botones
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child:
                  PrimaryButton(text: "Iniciar Sesión", onPressedMethod: () {}),
            ),

            const SizedBox(height: 16), // Espacio entre los botones
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SecondaryButton(
                  text: "No tengo cuenta",
                  onPressedMethod: () {
                    router.go('/register');
                  }),
            ),
            const SizedBox(height: 32), // Espacio entre los botones
          ],
        ),
      ),
    );
  }
}
