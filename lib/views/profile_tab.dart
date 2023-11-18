import 'package:equipo_estrella/commons/fonts.dart';
import 'package:equipo_estrella/controllers/user_controller.dart';
import 'package:equipo_estrella/models/user_model.dart';
import 'package:equipo_estrella/views/edit_profile.dart';
import 'package:equipo_estrella/widgets/buttons/primary_button.dart';
import 'package:equipo_estrella/widgets/buttons/secondary_button.dart';
import 'package:equipo_estrella/widgets/buttons/short_button_with_plus_sign.dart';
import 'package:equipo_estrella/widgets/cards/information_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../commons/colors.dart';

class CompleteUser extends StatelessWidget {
  const CompleteUser({Key? key, required this.userModel}) : super(key: key);

  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
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
        userModel.name,
        style: ManosFonts.sub1(),
        textAlign: TextAlign.center,
      ),
      Text(
        userModel.email,
        style: ManosFonts.b1(color: ManosColors.secondary200),
        textAlign: TextAlign.center,
      ),
      const SizedBox(height: 32),
      Container(
        width: 1000,
        alignment: Alignment.center,
        child: InformationCard(
            title: "Información personal",
            subtitle1: "FECHA DE NACIMIENTO",
            subtitle2: "GÉNERO",
            value1: userModel.birthDate,
            value2: userModel.gender),
      ),
      const SizedBox(height: 32),
      InformationCard(
          title: "Datos de contacto",
          subtitle1: "TELÉFONO",
          subtitle2: "E-MAIL",
          value1: userModel.phone,
          value2: userModel.altEmail),
      const SizedBox(height: 32),
      Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: PrimaryButton(
            text: "Editar perfil",
            onPressedMethod: () => {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => EditProfile(userModel: userModel))),
            },
          )),
      const SizedBox(height: 8),
      Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SecondaryButton(
            text: "Cerrar sesión",
            onPressedMethod: () => {},
            textColor: ManosColors.error,
          ))
    ]);
  }
}

class IncompleteUser extends StatelessWidget {
  const IncompleteUser({Key? key, required this.userModel}) : super(key: key);

  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
// Obtiene el router de GoRouter
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
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
            userModel.name,
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
          child: ShortButtonWithPlusSign(
              onPressedMethod: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                EditProfile(userModel: userModel))),
                  },
              text: "Completar"),
        ),
        const SizedBox(height: 92), // Espacio entre los botones
      ],
    );
  }
}

class ProfileTab extends ConsumerWidget {
  const ProfileTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    var userController = ref.watch(userControllerProvider);

    return userController.when(
        loading: () => const Center(
              child: SizedBox(
                width: 24.0, // Adjust the size as needed
                height: 24.0, // Adjust the size as needed
                child: CircularProgressIndicator(
                  color: ManosColors.primary100,
                ),
              ),
            ),
        error: (error, stackTrace) {
          return Text('Error: $error');
        },
        data: (currUser) {
          return Center(
              child: currUser.phone == ''
                  ? IncompleteUser(userModel: currUser)
                  : CompleteUser(
                      userModel: currUser,
                    ));
        });
  }
}
