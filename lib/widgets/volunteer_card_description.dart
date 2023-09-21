import 'package:equipo_estrella/fonts.dart';
import 'package:flutter/material.dart';
import '../colors.dart';
import 'atoms/card_chip.dart';
import 'volunteer_card_acction.dart';

class VolunteerCardDescription extends StatelessWidget {
  const VolunteerCardDescription({super.key});

  //TODO: add color enum/class
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            width: 1000,
            padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                bottom: 16,
                top: 8), //const EdgeInsets.all(6),
            // margin:
            //     const EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 4),
            child: Column(children: [
              const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    style: ManosFonts.overline,
                    "ACCIÓN SOCIAL",
                  )),
              const Padding(
                  padding: EdgeInsets.only(bottom: 4),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Un Techo para mi País",
                        style: ManosFonts.sub1,
                      ))),
              Container(
                  margin: const EdgeInsets.only(top: 4),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CardChip(amount: 10, isAvailable: false),
                      Row(
                        children: [
                          Icon(
                            Icons.favorite_border,
                            color: ManosColors.primary100,
                          ),
                          SizedBox(width: 16),
                          Icon(Icons.location_on,
                              color: ManosColors.primary100, size: 24)
                        ],
                      )
                    ],
                  ))
            ])));
  }
}
