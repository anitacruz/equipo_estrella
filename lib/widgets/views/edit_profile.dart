import 'package:equipo_estrella/widgets/custom_form_field.dart';
import 'package:equipo_estrella/widgets/edit_information_card.dart';
import 'package:equipo_estrella/widgets/information_card.dart';
import 'package:equipo_estrella/widgets/primaryButton.dart';
import 'package:equipo_estrella/widgets/secondaryButton.dart';
import 'package:flutter/material.dart';

import '../../commons/colors.dart';
import '../../commons/fonts.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      margin: const EdgeInsets.all(16),
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "Datos del perfil",
              style: ManosFonts.h1(),
            ),
          ),
          const SizedBox(height: 24),
          const CustomFormField(
            fieldName: "Fecha de nacimiento",
            hintText: "DD/MM/YYYY",
            alwaysFloatingLabel: true,
          ),
          const SizedBox(height: 24),
          const EditInformationCard(title: "Información de perfil"),
        ],
      ),
    ));
  }
}
