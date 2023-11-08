import 'package:equipo_estrella/commons/colors.dart';
import 'package:equipo_estrella/commons/fonts.dart';
import 'package:equipo_estrella/widgets/primaryButton.dart';
import 'package:equipo_estrella/widgets/short_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class IncompleteProfileTab extends StatelessWidget {
  const IncompleteProfileTab({super.key});

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
                  top: 147.5), // Establece el margen superior en 229 píxeles
              child: Image.asset(
                "assets/Profile_picture.png",
                width: 120,
                height: 120,
              ),
            ),
            const SizedBox(height: 16), // Espacio entre la imagen y el titulo
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'VOLUNTARIO',
                style: ManosFonts.overline(color: ManosColors.neutral75),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 8), // Espacio entre titulo y texto
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Juan Cruz Gonzalez',
                style: ManosFonts.sub1(),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 8), // Espacio entre titulo y texto
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                '¡Completá tu perfil para tener acceso a mejores oportunidades!',
                style: ManosFonts.b1(color: ManosColors.neutral75),
                textAlign: TextAlign.center,
              ),
            ),
            const Spacer(), // Espaciador para centrar verticalmente los botones
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ShortButton(onPressedMethod: () => {},),
            ),
            const SizedBox(height: 92), // Espacio entre los botones
          ],
        ),
      ),
    );
  }
}
