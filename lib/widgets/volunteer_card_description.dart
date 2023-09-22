import 'package:flutter/material.dart';
import '../commons/colors.dart';
import '../commons/fonts.dart';
import 'card_chip.dart';

class VolunteerCardDescription extends StatelessWidget {
  const VolunteerCardDescription({super.key});

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
              Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    style: ManosFonts.overline(),
                    "ACCIÓN SOCIAL",
                  )),
              Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Un Techo para mi País",
                        style: ManosFonts.sub1(),
                      ))),
              Container(
                  margin: const EdgeInsets.only(top: 4),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CardChip(amount: 10, isAvailable: true),
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
