import 'package:flutter/material.dart';
import 'volunteer_card_acction.dart';

class VolunteerCardDescription extends StatelessWidget {
  const VolunteerCardDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            color: Colors.grey[100],
            width: 1000,
            padding: const EdgeInsets.all(6),
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
