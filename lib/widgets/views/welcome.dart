
import 'package:equipo_estrella/commons/fonts.dart';
import 'package:equipo_estrella/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

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
                  top: 218), // Establece el margen superior en 229 píxeles
              child: Image.asset(
                "assets/Ser_manos_logo.png",
                width: 150,
                height: 150,
              ),
            ),
            const SizedBox(height: 30), // Espacio entre la imagen y el titulo
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                '¡Bienvenido!',
                style: ManosFonts.h1(),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 48), // Espacio entre titulo y texto
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Nunca subestimes tu habilidad para mejorar la vida de alguien.',
                style: ManosFonts.sub1(),
                textAlign: TextAlign.center,
              ),
            ),
            const Spacer(), // Espaciador para centrar verticalmente los botones
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: PrimaryButton(
                  text: "Comenzar",
                  onPressedMethod: () {
                    router.go('/');
                  }),
            ),
            const SizedBox(height: 92), // Espacio entre los botones
          ],
        ),
      ),
    );
  }
}
