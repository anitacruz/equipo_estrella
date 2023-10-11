import 'package:equipo_estrella/commons/colors.dart';
import 'package:equipo_estrella/commons/fonts.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StartingPage(),
    );
  }
}

class StartingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                '“El esfuerzo desinteresado para llevar alegría a los demás será el comienzo de una vida más feliz para nosotros”',
                style: ManosFonts.sub1(),
                textAlign: TextAlign.center,
              ),
            ),
            const Spacer(), // Espaciador para centrar verticalmente los botones
            Container( //TODO: Hacer que el boton sea un widget aparte y no que esté este codigo duplicado. 
              margin: const EdgeInsets.symmetric(horizontal: 16), //TODO: Los margenes parecen ser mas grandes que 16 pixeles
              child: ElevatedButton(
                onPressed: () {
                  // Acción al hacer clic en el botón de iniciar sesión
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: ManosColors.primary100,
                  minimumSize: const Size(312, 20), // Dimensiones del botón
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(4), // Bordes redondeados
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 8,
                  ),
                  child: Text(
                    'Iniciar Sesión',
                    style: ManosFonts.button(color: ManosColors.neutral100), //TODO: Este color no está siendo blanco de verdad
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16), // Espacio entre los botones
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: ElevatedButton(
                onPressed: () {
                  // Acción al hacer clic en el botón de iniciar sesión
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: ManosColors.neutral100,
                  minimumSize: const Size(312, 20), // Dimensiones del botón
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(4), // Bordes redondeados
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 8,
                  ),
                  child: Text(
                    'Registrarse',
                    style: ManosFonts.button(
                        color: ManosColors
                            .primary100), //TODO: Esto no está en bold!! en el figma se ve medio bold.
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32), // Espacio entre los botones
          ],
        ),
      ),
    );
  }
}
