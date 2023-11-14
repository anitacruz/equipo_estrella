import 'package:equipo_estrella/widgets/custom_form_field.dart';
import 'package:equipo_estrella/widgets/cards/edit_information_card.dart';
import 'package:equipo_estrella/widgets/edit_profile_picture.dart';
import 'package:equipo_estrella/widgets/buttons/primary_button.dart';
import 'package:flutter/material.dart';

import '../commons/fonts.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
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
          const SizedBox(height: 24),
          const EditProfilePicture(hasProfilePic: true),
          const SizedBox(height: 32),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "Datos de contacto",
              style: ManosFonts.h1(),
            ),
          ),
          const SizedBox(height: 24),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "Estos datos serán compartidos con la organización para ponerse en contacto contigo",
              style: ManosFonts.sub1(),
            ),
          ),
          const SizedBox(height: 24),
          const CustomFormField(
            fieldName: "Teléfono",
            hintText: "Ej: +541178445459",
            alwaysFloatingLabel: true,
          ),
          const SizedBox(height: 24),
          const CustomFormField(
            fieldName: "Mail",
            hintText: "Ej: mimail@mail.com",
            alwaysFloatingLabel: true,
          ),
          const SizedBox(height: 24),
          PrimaryButton(
            text: "Guardar datos",
            onPressedMethod: () => {},
            disabled: true,
          )
        ],
      ),
    )));
  }
}
