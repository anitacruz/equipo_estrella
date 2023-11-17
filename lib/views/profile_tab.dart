import 'package:equipo_estrella/controllers/user_controller.dart';
import 'package:equipo_estrella/widgets/buttons/primary_button.dart';
import 'package:equipo_estrella/widgets/buttons/secondary_button.dart';
import 'package:equipo_estrella/widgets/cards/information_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../commons/colors.dart';
import '../commons/fonts.dart';

class ProfileTab extends ConsumerWidget {
  const ProfileTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final router = GoRouter.of(context);
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
                currUser.name,
                style: ManosFonts.sub1(),
                textAlign: TextAlign.center,
              ),
              Text(
                currUser.email,
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
                    value1: DateFormat('dd/MM/yyyy')
                        .format(currUser.birthDate.toDate()),
                    value2: currUser.sex),
              ),
              const SizedBox(height: 32),
              InformationCard(
                  title: "Datos de contacto",
                  subtitle1: "TELÉFONO",
                  subtitle2: "E-MAIL",
                  value1: currUser.phone,
                  value2: currUser.altEmail),
              const SizedBox(height: 32),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: PrimaryButton(
                    text: "Editar perfil",
                    onPressedMethod: () => {router.go("/editProfile")}),
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
        });
  }
}
