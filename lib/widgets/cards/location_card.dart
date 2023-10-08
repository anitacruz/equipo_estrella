import 'package:equipo_estrella/commons/colors.dart';
import 'package:equipo_estrella/widgets/card_chip.dart';
import 'package:flutter/material.dart';

import '../../commons/fonts.dart';

class LocationCard extends StatelessWidget {
  final String location;

  const LocationCard({Key? key, required this.location}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: const BoxDecoration(
          color: ManosColors.secondary50,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8), topRight: Radius.circular(8)),
        ),
        child: Text(
          "Ubicación",
          style: ManosFonts.sub1(),
        ),
      ),
      Container(
          alignment: Alignment.topLeft,
          color: ManosColors.neutral10,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            children: [
              Text("Dirección", style: ManosFonts.overline()),
              Text(location, style: ManosFonts.b1()),
            ],
          )),
    ]);
  }
}
