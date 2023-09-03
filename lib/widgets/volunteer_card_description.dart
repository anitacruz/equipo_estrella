import 'package:flutter/material.dart';
import 'volunteer_card_acction.dart';

class VolunteerCardDescription extends StatelessWidget {
  const VolunteerCardDescription({super.key});

  //TODO: add color enum/class
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            width: 1000,
            padding: const EdgeInsets.all(6),
            margin:
                const EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 8),
            child: const Column(children: [
              Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "ACCIÓN SOCIAL",
                    style:
                        TextStyle(fontWeight: FontWeight.normal, fontSize: 10),
                  )),
              Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Un Techo para mi País",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                  )),
              VolunteerCardAction()
            ])));
  }
}
