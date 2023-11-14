import 'package:equipo_estrella/commons/fonts.dart';
import 'package:equipo_estrella/widgets/short_button.dart';
import 'package:flutter/material.dart';

import '../commons/colors.dart';

class EditProfilePicture extends StatelessWidget {
  final bool hasProfilePic;
  const EditProfilePicture({
    Key? key,
    required this.hasProfilePic,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1000,
      alignment: Alignment.center,
      // padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 1000,
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              color: ManosColors.secondary25,
            ),
            child: !hasProfilePic
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Foto de perfil",
                        style: ManosFonts.sub1(),
                      ),
                      ShortButton(onPressedMethod: () => {}, text: "Subir foto")
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Foto de perfil",
                                style: ManosFonts.sub1(),
                              )),
                          const SizedBox(height: 8),
                          ShortButton(
                              onPressedMethod: () => {}, text: "Cambiar foto")
                        ],
                      ),
                      ClipOval(
                        child: Image.asset(
                          "assets/profile_pic.jpg",
                          width: 84,
                          height: 84,
                          fit: BoxFit.cover,
                        ),
                      )
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}
