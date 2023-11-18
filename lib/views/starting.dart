import 'package:equipo_estrella/commons/fonts.dart';
import 'package:equipo_estrella/controllers/firebase_remote_config.dart';
import 'package:equipo_estrella/widgets/buttons/primary_button.dart';
import 'package:equipo_estrella/widgets/buttons/secondary_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class StartingPage extends StatelessWidget {
  const StartingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final GoRouter router =
        GoRouter.of(context); // Obtiene el router de GoRouter

    final remoteConfig = FirebaseRemoteConfigService();

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(
                  top: 229), // Establece el margen superior en 229 píxeles
              child: Image.asset(
                "assets/Ser_manos_logo.png",
                width: 150,
                height: 150,
              ),
            ),
            const SizedBox(height: 32), // Espacio entre la imagen y el texto
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                remoteConfig.welcomeText,
                style: ManosFonts.sub1(),
                textAlign: TextAlign.center,
              ),
            ),
            const Spacer(), // Espaciador para centrar verticalmente los botones
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: PrimaryButton(
                  text: "Iniciar Sesión",
                  onPressedMethod: () => {router.go('/login')}),
            ),

            const SizedBox(height: 16), // Espacio entre los botones
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SecondaryButton(
                  text: "Registrarse",
                  onPressedMethod: () => {router.go('/register')}),
            ),
            const SizedBox(height: 32), // Espacio entre los botones
          ],
        ),
      ),
    );
  }
}
