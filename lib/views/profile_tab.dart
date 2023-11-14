import 'package:equipo_estrella/widgets/buttons/primary_button.dart';
import 'package:equipo_estrella/widgets/buttons/secondary_button.dart';
import 'package:equipo_estrella/widgets/cards/information_card.dart';
import 'package:flutter/material.dart';

import '../commons/colors.dart';
import '../commons/fonts.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        //image
        Container(
            margin: const EdgeInsets.only(top: 32),
            child: ClipOval(
              child: Image.asset(
                "assets/profile_pic.jpg",
                width: 110,
                height: 110,
                fit: BoxFit.cover,
              ),
            )),
        const SizedBox(height: 16),
        Text(
          'VOLUNTARIO',
          style: ManosFonts.overline(color: ManosColors.neutral75),
          textAlign: TextAlign.center,
        ),
        Text(
          'Juan Cruz Gonzalez',
          style: ManosFonts.sub1(),
          textAlign: TextAlign.center,
        ),
        Text(
          'mimail@mail.com',
          style: ManosFonts.b1(color: ManosColors.secondary200),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 32),
        Container(
          width: 1000,
          alignment: Alignment.center,
          child: const InformationCard(
              title: "Información personal",
              subtitle1: "FECHA DE NACIMIENTO",
              subtitle2: "GÉNERO",
              value1: "10/10/1990",
              value2: "Hombre"),
        ),
        const SizedBox(height: 32),
        const InformationCard(
            title: "Datos de contacto",
            subtitle1: "TELÉFONO",
            subtitle2: "E-MAIL",
            value1: "+5491165863216",
            value2: "mimail@gmail.com"),
        const SizedBox(height: 32),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child:
              PrimaryButton(text: "Editar perfil", onPressedMethod: () => {}),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SecondaryButton(
            text: "Cerrar sesión",
            onPressedMethod: () => {},
            textColor: ManosColors.error,
          ),
        )
      ],
    ));
  }
}
